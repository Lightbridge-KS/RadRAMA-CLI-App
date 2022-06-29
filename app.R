library(cli)
library(emo)
source("R/cli-fun.R")
source("cli/multiply.R")
source("cli/weather.R")
source("cli/introduce.R")


# Main App ----------------------------------------------------------------

runApp <- function() {

    # Ask Nick Name for Next Prompt
    nickname <- readline(crayon::green("What's your nickname? "))
    if (tolower(nickname) %in% c("exit", "quit")) {
        cat("Goodbye!", ji("joy"))
        return(invisible(1))
    }
    cli_text("Hi 👋, {.field {nickname}}", "!")
    show_help()

    # Enter Prompt with Nick Name
    while (TRUE) {
        input <- readline(crayon::blue(glue::glue("{nickname}> ")))
        if (tolower(input) %in% c("exit", "quit")) {
            cat("See you", ji("joy"))
            break
        }
        # Main Logic Here
        switch(input,
            "help" = show_help(),
            "intro" = introduce(),
            "multiply" = multiply(),
            "weather" = weather_cli(),
            {
                cli_alert_warning("Sorry {nickname}, {.code {input}} is not an option! {ji('ignorance')}") # nolint
            }
        )
    }
}


# Help Page ---------------------------------------------------------------



show_help <- function() {
    cat("\n")
    cli_text(col_green("What do you want to do next?"))

    cli_li("Introduce myself: {col_yellow('intro')}")
    cli_li("Multiply number: {col_yellow('multiply')}")
    cli_li("Get weather report: {col_yellow('weather')}")
    cli_li("See help: {col_yellow('help')}, Exit: {col_yellow('exit')} or {col_yellow('quit')}") # nolint

    cat("\n")
}
