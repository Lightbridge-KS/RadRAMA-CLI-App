
prompt <- function() {
    while (TRUE) {
        input <- readline(crayon::blue("user> "))
        if (tolower(input) %in% c("exit", "quit")) {
            break
        }
        # Do Something
        cat(input)
    }
}
