#' Clear coolors history from current session
#'
#' @param ask boolean; defaults to TRUE. Confirms deletion of coolors history if TRUE.
#'
clear_coolors_history <- function(ask = TRUE){

  clear_hist <- function() {
    coolors_hist <- list()
    coolors_set(coolors_hist)
    if(length(coolors_get(coolors_hist)) == 0) cat("History erased.")
    else stop("History not erased!")
  }

  if(ask){

    cat("Erase coolors history?\n
          1 : Absolutely not
          2 : Yes
          3 : No way!\n ")

    ans <- tolower(scan(what = double(), n = 1, quiet = TRUE))

    switch(ans,
           "1" = cat("History not erased."),
           "2" = clear_hist(),
           "3" = cat("History not erased.")
    )

  } else {

    clear_hist()

  }

}
