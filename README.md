# RadRAMA CLI App for Orientation Event


> I created this `R`'s CLI App for introduce my skill set in radiology resident orientation at Radio RAMA

[![asciicast](https://asciinema.org/a/504036.svg)](https://asciinema.org/a/504036?t=10)

## Usage

Steps to reproduce this project

-   Install required R package by:

```r
renv::restore()
```

-   [`app.R`](app.R): contains main logic of application

```r
source("app.R")
```

-   Run CLI App by

```r
runApp()
```

## Weather App

To use weather submodule, you must get Open weather map [API Key](https://openweathermap.org/api).

Store it at `.Renviron` (project level)

```r
usethis::edit_r_environ("project") # Open
```

Store API key and value as:

```shell
ROpenWeatherMap_KEY="value"
```
