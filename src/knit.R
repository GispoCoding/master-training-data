args <- commandArgs(trailingOnly = TRUE)
arg1 <- args[1]
bookdown::render_book(arg1, 'bookdown::html_book')