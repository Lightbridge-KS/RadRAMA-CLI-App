
#' Cat Text
#'
#' Cat text for specified repitition and total time
#'
#' @param text text to cat
#' @param rep how many cycle
#' @param total_time total time (sec)
#'
#' @return NULL
#' @export
cat_progress_rep <- function(text = ".\n", rep = 2, total_time = 1) {
    cycle <- total_time / rep

    for (i in 1:rep) {
        cat(text)
        Sys.sleep(cycle)
    }
}


#' Spin Custom
#'
#' Spine a spinner for specified duration and frame rate
#'
#' @param (cli_spinner) A spinner object
#' @param total_sec total time to spin (seconds)
#' @param frame_rate frame rate (frames/seconds)
#'
#' @return
#' @export
#'
spin_custom <- function(sp = cli::make_spinner(),
                        total_sec = 1,
                        frame_rate = 100
) {

  frames <- frame_rate * total_sec
  cycle_sec <- 1 / frame_rate   # Second per cycle

  lapply(1:frames, function(x) {
    sp$spin()
    Sys.sleep(cycle_sec)
  })
  sp$finish()
}
