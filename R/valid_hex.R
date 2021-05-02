#' Test whether a string is a valid hexadecimal color value
#'
#' @details A hex code is valid if:
#'   * It begins with '#' (can set \code{hash = FALSE} if needed, see below), and
#'   * It is three, six, or eight characters long, consisting of the characters 0-9, A-F, and/or a-f.
#'
#' Three-character hex codes are interpolated to six-character codes by repeating each element twice. Eight-
#'   character hex codes contain two digits (either prepended or appended) representing transparency (alpha).
#'
#' @param hex character vector containing string(s) to test as hex value(s).
#' @param hash boolean, default TRUE; indicates whether \code{valid_hex()} should verify whether hex codes begin
#'   with the hash symbol (#). If FALSE, hex codes are considered valid whether or not they begin with the hash
#'   symbol. Defaults to true because internal print functions require hashed hex codes. This option is provided
#'   in case this function can serve other uses, e.g. checking if a character vector contains any valid hex
#'   strings (with or without the hex symbol).
#'
#' @return vector of boolean values indicating whether string(s) are valid hex code.
#' @export
#'
#' @examples
#' valid_hex("#ffffff")
#' valid_hex("123456", hash = FALSE)
#'
valid_hex <- function(hex, hash = TRUE) {

  valid_hash <- c("^\\#[0-9A-Fa-f]{3}$",  # 3-digit hex
                  "^\\#[0-9A-Fa-f]{6}$",  # 6-digit hex
                  "^\\#[0-9A-Fa-f]{8}$")  # 6-digit hex w/ alpha (2 digits)

  valid_else <- c("^[0-9A-Fa-f]{3}$",  # 3-digit hex
                  "^[0-9A-Fa-f]{6}$",  # 6-digit hex
                  "^[0-9A-Fa-f]{8}$")  # 6-digit hex w/ alpha (2 digits)

  if(hash){
    valid_str <- paste(valid_hash, collapse = "|")
    stringr::str_detect(hex, valid_str)
  } else {
    valid_str <- paste(valid_hash, valid_else, sep = "|", collapse = "|")
    stringr::str_detect(hex, valid_str)
  }

}
