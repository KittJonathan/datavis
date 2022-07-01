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

# Change properties of geometries

g + geom_point(colour = "firebrick", shape = "diamond", size = 2)
g + geom_point(colour = "#b22222", shape = "diamond", size = 2)
g + geom_point(colour = rgb(178, 34, 34, maxColorValue = 255), shape = "diamond", size = 2)

g + 
  geom_point(colour = "firebrick", shape = "diamond", size = 2) +
  geom_line(colour = "firebrick", linetype = "dotted", size = .3)

# Replace the default ggplot2 theme

theme_set(theme_bw())

g + geom_point(colour = "firebrick")

# Working with axes ----

# Change axis titles

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)")

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  xlab("Year") +
  ylab("Temperature (°F)")

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year",
       y = expression(paste("Temperature (", degree ~ F, ")"^"(Hey, why should we use metric units?!)")))

# Increase space between axis and axis titles

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.title.x = element_text(vjust = 0, size = 15),
        axis.title.y = element_text(vjust = 2, size = 15))

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.title.x = element_text(margin = margin(t = 10), size = 15),
        axis.title.y = element_text(margin = margin(r = 10), size = 15))

# Change aesthetics of axis titles

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.title = element_text(size = 15, colour = "firebrick", face = "bold.italic"))

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.title.x = element_text(colour = "sienna", size = 15),
        axis.title.y = element_text(colour = "orangered", size = 15))

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.title = element_text(colour = "sienna", size = 15, face = "bold"),
        axis.title.y = element_text(face = "bold.italic"))

# Change aesthetics of axis text

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.text = element_text(colour = "dodgerblue", size = 12),
        axis.text.x = element_text(face = "italic"))

# Rotate axis text

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1, size = 12))

# Remove axis text & ticks

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  theme(axis.ticks.y = element_blank(),
        axis.text.y = element_blank())

# Remove axis titles

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = NULL, y = "")

# Limit axis range

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  ylim(c(0, 50))

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  scale_y_continuous(limits = c(0, 50))

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = "Temperature (°F)") +
  coord_cartesian(ylim = c(0, 50))

# Force plot to start at origin

chic_high <- dplyr::filter(chic, temp > 25, o3 > 20)

ggplot(chic_high, aes(x = temp, y = o3)) +
  geom_point(colour = "darkcyan") +
  labs(x = "Temperature higher than 25°F",
       y = "Ozone higher than 20 ppb") +
  expand_limits(x = 0, y = 0)

ggplot(chic_high, aes(x = temp, y = o3)) +
  geom_point(colour = "darkcyan") +
  labs(x = "Temperature higher than 25°F",
       y = "Ozone higher than 20 ppb") +
  coord_cartesian(xlim = c(0, NA), ylim = c(0, NA))

ggplot(chic_high, aes(x = temp, y = o3)) +
  geom_point(colour = "darkcyan") +
  labs(x = "Temperature higher than 25°F",
       y = "Ozone higher than 20 ppb") +
  expand_limits(x = 0, y = 0) +
    coord_cartesian(expand = FALSE, clip = "off")

# Axes with same scalling

ggplot(chic, aes(x = temp, y = temp + rnorm(nrow(chic), sd = 20))) +
  geom_point(colour = "sienna") +
  labs(x = "Temperature (°F)", y = "Temperature (°F) + random noise") +
  xlim(c(0, 100)) +
  ylim(c(0, 150)) +
  coord_fixed()

ggplot(chic, aes(x = temp, y = temp + rnorm(nrow(chic), sd = 20))) +
  geom_point(colour = "sienna") +
  labs(x = "Temperature (°F)", y = "Temperature (°F) + random noise") +
  xlim(c(0, 100)) +
  ylim(c(0, 150)) +
  coord_fixed(ratio = 1/5)

# Use a function to alter labels

ggplot(chic, aes(x = date, y = temp)) +
  geom_point(colour = "firebrick") +
  labs(x = "Year", y = NULL) +
  scale_y_continuous(label = function(x) {return(paste(x, "Degrees Fahrenheit"))})

# Working with titles ----