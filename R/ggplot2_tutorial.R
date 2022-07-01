# A ggplot2 tutorial for beautiful plotting in R
# Cédric Scherer
# Last updated 2022-07-01

# https://www.cedricscherer.com/2019/08/05/a-ggplot2-tutorial-for-beautiful-plotting-in-r/

# Load packages ----

library(tidyverse)

# Import dataset ----

chic <- readr::read_csv("https://raw.githubusercontent.com/z3tt/ggplot-courses/main/data/chicago-nmmaps-custom.csv")

tibble::glimpse(chic)
head(chic, 10)

# A default ggplot ----

(g <- ggplot(chic, aes(x = date, y = temp)))

g + geom_point()

g + geom_line()

g + geom_line() + geom_point()

g + geom_point(colour = "firebrick", shape = "diamond", size = 2)
g + geom_point(colour = "#b22222", shape = "diamond", size = 2)
g + geom_point(colour = rgb(178, 34, 34, maxColorValue = 255), shape = "diamond", size = 2)
