
cat_progress_rep <- function(text = ".\n", rep = 2, total_time = 1) {
    cycle <- total_time / rep

    for (i in 1:rep) {
        cat(text)
        Sys.sleep(cycle)
    }
}


spin_custom <- function(sp,
                        total_time = 1,
                        frame = 100
) {

  cycle <- total_time / frame
  lapply(1:frame, function(x) {
    sp$spin()
    Sys.sleep(cycle)
  })
  sp$finish()
}
