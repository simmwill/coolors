#' Randomly shuffle part or all of a color palette
#'
#' @param palette character vector of hexadecimal color values, with each beginning with "#". Alternatively, a
#'   double vector of length 1 specifying the numeric identifier of \code{palette_coolors} palette.
#' @param freeze double vector specifying the positions of colors to freeze (i.e. not shuffle). Must be
#'   length 1:n, where n is the length of the palette specified.
#' @param hist boolean, default TRUE; indicates whether to write results of shuffled palette to history
#'   using \code{coolors_history()}.
#'
#' @return A vector of hexadecimal color values.
#' @export
#'
#' @examples
#' # shuffle a known color palette, keeping colors 2:3
#' library(magrittr)
#' palette_coolors(palette_num = 123) %>% shuffle_pal(freeze = 2:3)
#'
#' @importFrom rlang .data
shuffle_pal <- function(palette = .data,
                        freeze,
                        hist = TRUE){

  # get palette object
  if(is.character(palette)){
    if(!all(valid_hex(palette))){
      stop("At least one hex provided is invalid. See ?coolors::valid_hex for details.")
    }
    hexcodes <- as.character(palette)
    palette_num <- which(sapply(coolors, identical, hexcodes))
  }
  else if(is.double(palette)){
    hexcodes <- palette_coolors(palette_num = palette, hex = TRUE, hist = FALSE)
    palette_num <- palette
  } else {
    stop("Palette provided must be a color palette, or a length-1 double vector specifying a coolors palette number.")
  }

  n <- length(hexcodes)
  if(length(freeze) >= n) stop("Length of freeze must be less than length of palette.")
  if(any(freeze > n)) stop("At least one freeze position specified is out of bounds.")

  hexcodes_mod <- hexcodes
  no_freeze_ind <- setdiff(seq_along(hexcodes), freeze)

  for(i in no_freeze_ind){

    samp <- sample(unlist(coolors), size = 1)

    hexcodes_mod[[i]] <- samp

  }

  if(hist){

    coolors_hist <- purrr::prepend(lapply(coolors_get(coolors_hist), unname), list(hexcodes_mod))
    coolors_set(coolors_hist)

  }

  print.palette(stats::setNames(hexcodes_mod, "Custom palette"))
  message("Positions shuffled: ", paste(no_freeze_ind, collapse = ", "))
  invisible(hexcodes_mod)

}
