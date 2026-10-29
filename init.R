# Run from the aqsclient folder in a terminal: Rscript init.R
setup_client <- function() {
  root <- normalizePath('.', winslash = '/')
  if (!file.exists('DESCRIPTION') || !file.exists('tests/smoke.R')) {
    stop('Open a terminal in the aqsclient folder, then run Rscript init.R.', call. = FALSE)
  }
  on.exit(setwd(root), add = TRUE)
  library_dir <- file.path(root, 'library')
  build_dir <- file.path(root, 'build')
  cat('Setting up aqsclient in ', root, '\n', sep = '')
  cat('This builds and installs the package, then checks requests offline.\n')
  cat('No AQS account or API calls are needed.\n\n')

  cat('[1/4] Checking R dependencies\n')
  dir.create(library_dir, showWarnings = FALSE)
  dir.create(build_dir, showWarnings = FALSE)
  .libPaths(c(library_dir, .libPaths()))
  metadata <- read.dcf(file.path(root, 'DESCRIPTION'))
  dependencies <- trimws(strsplit(metadata[1, 'Imports'], ',')[[1]])
  missing <- dependencies[!vapply(dependencies, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing)) {
    cat('Downloading missing packages from CRAN: ', paste(missing, collapse = ', '), '\n', sep = '')
    install.packages(missing, repos = 'https://cloud.r-project.org', lib = library_dir)
  } else {
    cat('All required packages are already installed.\n')
  }
  missing <- dependencies[!vapply(dependencies, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing)) {
    stop('Could not install: ', paste(missing, collapse = ', '), '. See the installation output above.', call. = FALSE)
  }
  run <- function(args, step) {
    status <- system2(file.path(R.home('bin'), 'R'), args)
    if (status != 0L) stop(step, ' failed. See the R output above.', call. = FALSE)
  }

  cat('\n[2/4] Building the source archive in build/\n')
  setwd(build_dir)
  run(c('CMD', 'build', shQuote(root)), 'Package build')
  archive <- file.path(build_dir, paste0(metadata[1, 'Package'], '_', metadata[1, 'Version'], '.tar.gz'))

  cat('\n[3/4] Installing aqsclient in this folder\'s library/ directory\n')
  run(c('CMD', 'INSTALL', paste0('--library=', shQuote(library_dir)), shQuote(archive)), 'Package installation')

  cat('\n[4/4] Testing request construction offline\n')
  setwd(root)
  source(file.path(root, 'tests/smoke.R'), local = new.env())
  cat('\nSetup complete. Offline request tests passed.\n')
  cat('Source archive: ', archive, '\n', sep = '')
  cat('\nTo use the client, open R in this folder and run:\n')
  cat(".libPaths(c('library', .libPaths()))\nlibrary(aqsclient)\n")
  cat('\nNext: follow "Use your own AQS account" in README.md to add your credentials.\n')
}

setup_client()
