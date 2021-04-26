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
#' @importFrom rlang .data
shuffle_pal <- function(palette = .data,
                        freeze,
                        hist = TRUE){

  # get palette object
  if(is.character(palette)){
    if(!all(valid_hex(palette))){
      stop("At least one hex provided is invalid. See ?coolors::valid_hex for details.")
    }
    hex <- as.character(palette)
    palette_num <- which(sapply(coolors, identical, hex))
  }
  else if(is.double(palette)){
    hex <- palette_coolors(palette_num = palette, hex = TRUE, hist = FALSE)
    palette_num <- palette
  } else {
    stop("Palette provided must be a color palette, or a length-1 double vector specifying a coolors palette number.")
  }

  n <- length(hex)
  if(length(freeze) > n) stop("Length of freeze must be less than or equal to length of palette.")

  hex_mod <- as.list(hex)  # list faster (modifying uses internal C code)
  no_freeze_ind <- setdiff(seq_along(hex), freeze)

  # set.seed(palette_num)

  for(i in no_freeze_ind){

    # set.seed(palette_num)

    samp <- sample(unlist(coolors), size = 1)

    hex_mod[[i]] <- samp

  }

  if(hist){

#' @importFrom purrr prepend
    coolors_hist <- prepend(coolors_get(coolors_hist), list(as.character(hex_mod)))
    names(coolors_hist) <- NULL
    coolors_set(coolors_hist)

  }

  hex_mod <- as.character(hex_mod)
  print.palette(hex_mod)
  message("Positions shuffled: ", paste(no_freeze_ind, collapse = ", "))
  return(hex_mod)

}
