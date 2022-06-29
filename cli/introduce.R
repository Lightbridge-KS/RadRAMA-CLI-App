library(here)
library(lubridate)
here::i_am("cli/introduce.R")
source(here("R/cli-fun.R"))

introduce <- function(first_name = "Kittipos",
                      last_name = "Sirivongrungson",
                      birth_day = as.Date("1995/05/19")
                      ) {

   sp_dot <- cli::make_spinner("dots")
   sp_line <- cli::make_spinner("line")
   sp_earth <- cli::make_spinner("earth")
   sp_monkey <- cli::make_spinner("monkey")

   cli::cli_h2("Introduce Myself")
   age <- lubridate::as.period(birth_day %--% Sys.Date())
   Year <- lubridate::year(age)
   Month <- lubridate::month(age)
   Day <- lubridate::day(age)

   cli::cli_text("Hello, there 👋")
   cat("\n")
   spin_custom(sp_monkey, total_sec = 1) # Spin

   ## Name
   cli::cli_text("My name is {.field {first_name} {last_name}}.")
   cat("\n")
   spin_custom(sp_line, total_sec = 1) # Spin
   ## Age
   cli::cli_text("I'm {.val {Year}} years, {.val {Month}} months, and {.val {Day}} day's old.") # nolint

   cat("\n")
   spin_custom(sp_earth, total_sec = 1) # Spin

   ## Skills
   cli::cli_h2("Skills")

   cat("I like to" , crayon::yellow$bold("write computer code"), emo::ji("computer"), "\n\n")

   spin_custom(sp_dot, total_sec = 1) # Spin

   cat("I mostly use", crayon::blue$bold("R programming language"), "for:\n")

   spin_custom(sp_dot, total_sec = 0.8) # Spin

   ul <- cli_ul()
   cli::cli_li("Buiding Software (R package and Web app)")
   spin_custom(sp_dot, total_sec = 0.8) # Spin
   cli::cli_li("Data Science")
   spin_custom(sp_dot, total_sec = 0.8) # Spin
   cli::cli_li("Explore fun ideas, like this one 🙂.")
   cli_end(ul)

   cat("\n")
   spin_custom(sp_dot, total_sec = 1) # Spin
   cat("I used to like", crayon::yellow$bold("singing"), "a lot, but not so much these days.")


  }

