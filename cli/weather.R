options(box.path = getwd())
box::use(R / openweather[weather_current_report])

#' @export
weather_cli <- function() {
    cli::cli_h2("Welcome to weather report!")

    while (TRUE) {
        cityname <- readline(crayon::blue("Please provide city name: "))
        if (tolower(cityname) %in% c("exit", "quit")) {
            return(invisible(1))
        }
        tryCatch(
            error = function(cnd) cli::cli_alert_warning("Please provide a valid city name."), # nolint
            {
                weather_current_report(cityname, units = "celsius")
                break
            }
        )
    }
}
