#' Display coolors palette history from current session
#'
#' @return A list of previously-generated coolors palettes. Limited to current session.
#' @export
#'
#' @examples
#' coolors_history()
coolors_history <- function() {

  coolors_get(coolors_hist)

}
