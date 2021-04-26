#' Test whether a string is a valid hexadecimal color value
#'
#' @details A hex code is valid if:
#'   * It begins with '#' (can set \code{hash = FALSE} if needed), and
#'   * It is three, six, or eight characters long, consisting of the characters 0-9, A-F, and/or a-f.
#'
#' Three-character hex codes are interpolated to six-character codes by repeating each element twice. Eight-
#'   character hex codes contain two digits (either prepended or appended) representing transparency (alpha).
#'
#' @param hex character vector containing string(s) to test as hex value(s).
#'
#' @return vector of boolean values indicating whether string(s) are valid hex code.
#' @export
#'
#' @importFrom stringr str_detect
valid_hex <- function(hex) {

  valid <- c("^\\#[0-9A-Fa-f]{3}$",  # 3-digit hex
             "^\\#[0-9A-Fa-f]{6}$",  # 6-digit hex
             "^\\#[0-9A-Fa-f]{8}$")  # 6-digit hex w/ alpha (2 digits)
  valid_str <- paste(valid, collapse = "|")
  str_detect(hex, valid_str)

}
