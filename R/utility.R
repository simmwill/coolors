.coolors_env <- new.env()

#' Set hidden variable
#'
#' @param var Hidden variable to set
#'
coolors_set <- function(var) {
  varname <- deparse(substitute(var))
  if (exists(varname, envir = parent.frame())) {
    assign(deparse(substitute(var)), var, envir = .coolors_env)}
  else {
    stop(paste(varname,"doesn't exist"))
  }
}

#' Get hidden variable
#'
#' @param var Hidden variable to get
#'
coolors_get <- function(var) {
  varname <- deparse(substitute(var))
  .coolors_env[[varname]]
}

coolors_hist <- list()
coolors_set(coolors_hist)
