#' Multiply 2 number
#' 
#' @description Interactively prompt user to input `x` and `y` as number
#'
multiply <- function() {
    while (TRUE) {
        input_x <- readline(crayon::blue("what's x? "))
        input_y <- readline(crayon::blue("what's y? "))
        tryCatch(
            warning = function(cnd) cat("Please provide a number\n"),
            {
                input_x <- as.numeric(input_x)
                input_y <- as.numeric(input_y)
                cli::cli_alert_success("x times y is {input_x * input_y}")
                cat("\n")
                break
            }
        )
    }
}
