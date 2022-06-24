### Get Weather from Open Weather API

#' <https://openweathermap.org/api>

#' Before Using
#' Store API Key in .Renviron as
#'
#' `ROpenWeatherMap_KEY="Value"`



# Current Weather Report -----------------------------------------------------

#' @export
weather_current_report <- function(city = "",
                                   units = c("kelvin", "celsius", "fahrenheit"),
                                   lang = NULL,
                                   api_key = Sys.getenv("ROpenWeatherMap_KEY")
) {

  units <- match.arg(units)
  w <- weather_current_ls(city = city, units = units, api_key = api_key)

  units_abbr <- weather_units_abbr[units]

  # Country
  city_name <- w$name
  country_code <- w$sys$country
  # Date Time
  dt <- lubridate::as_datetime(w$dt, tz = Sys.timezone())
  dt_chr <- format(dt, "%R, %d/%m/%y")

  # Temp
  ## Feels Like
  feels_like <- w$main$feels_like
  feels_like_disp <- cli::col_yellow(round(feels_like), units_abbr)

  t_min <- w$main$temp_min # Min
  t_max <- w$main$temp_max # Max
  humid <- w$main$humidity # Humidity
  humid_disp <- cli::col_blue(humid, "%")

  ## Description
  desc <-  w$weather$description
  desc_disp <- stringr::str_to_sentence(desc)

  # Country, Code
  cli::cli_h2("Current Weather ({dt_chr})")
  cli::cli_alert_info("At {.field {city_name}, {country_code}}")
  cli::cli_alert_success("Feels like {feels_like_disp}, {desc_disp}")
  cli::cli_alert_success("Humidity: {humid_disp}")

}
# Current Weather List -----------------------------------------------------

#' @export
weather_current_ls <- function(city = "",
                            units = c("kelvin", "celsius", "fahrenheit"),
                            lang = NULL,
                            api_key = Sys.getenv("ROpenWeatherMap_KEY")
) {



  url <- weather_create_url(city = city, units = units, api_key = api_key)
  jsonlite::fromJSON(url)
}




# Build URL ---------------------------------------------------------------


weather_create_url <- function(city = "",
                               units = c("kelvin", "celsius", "fahrenheit"),
                               lang = NULL,
                               api_key = Sys.getenv("ROpenWeatherMap_KEY")
) {
  units <- match.arg(units)
  temp_units <- weather_units[units]

  baseURL <- "https://api.openweathermap.org/data/2.5/weather?"

  city <- glue::glue("q={city}")

  if(!is.null(lang)) {
    lang <- glue::glue("&lang={lang}")
  }

  api_key <- glue::glue("&appid={api_key}")
  units_var <- glue::glue("&units={temp_units}")

  paste0(baseURL, city, lang, api_key, units_var)

}


# Weather Units -----------------------------------------------------------


weather_units <- c(kelvin = "standard",
                   celsius = "metric",
                   fahrenheit="imperial")

weather_units_abbr <-  c(kelvin = "K", celsius = "˚C", fahrenheit = "˚F")
