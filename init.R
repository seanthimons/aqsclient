# From the extracted aqsclient directory: Rscript init.R
root <- normalizePath('.', winslash = '/')
stopifnot(file.exists('DESCRIPTION'), file.exists('specmill.yml'))
library_dir <- file.path(root, 'library')
build_dir <- file.path(root, 'build')
dir.create(library_dir, showWarnings = FALSE)
dir.create(build_dir, showWarnings = FALSE)
.libPaths(c(library_dir, .libPaths()))
metadata <- read.dcf(file.path(root, 'DESCRIPTION'))
dependencies <- trimws(strsplit(metadata[1, 'Imports'], ',')[[1]])
missing <- dependencies[!vapply(dependencies, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  install.packages(missing, repos = 'https://cloud.r-project.org', lib = library_dir)
}
stopifnot(all(vapply(dependencies, requireNamespace, logical(1), quietly = TRUE)))
run <- function(args) {
  status <- system2(file.path(R.home('bin'), 'R'), args)
  if (status != 0L) stop('R package command failed; see output above.', call. = FALSE)
}
setwd(build_dir)
run(c('CMD', 'build', shQuote(root)))
archive <- file.path(build_dir, paste0(metadata[1, 'Package'], '_', metadata[1, 'Version'], '.tar.gz'))
run(c('CMD', 'INSTALL', paste0('--library=', shQuote(library_dir)), shQuote(archive)))
setwd(root)
source(file.path(root, 'tests/smoke.R'))
cat('\nBuild, local installation, and offline request tests passed.\n')
cat('Source archive: ', archive, '\n', sep = '')
cat('In a new R session from this folder:\n.libPaths(c("library", .libPaths()))\nlibrary(aqsclient)\n')
