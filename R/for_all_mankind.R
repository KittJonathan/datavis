# For all mankind 
# Last updated 2022-07-12

# Load packages ----

library(tidyverse)
library(ggnewscale)

# Create dataset ----

# https://www.imdb.com/title/tt7772588/episodes

d1 <- tibble(
  season = rep(1:3, each = 10),
  episode_nb = rep(1:10, times = 3),
  episode_title = c("Red Moon", "He Built the Saturn V", "Nixon's Women", "Prime Crew", "Into the Abyss",
                    "Home Again", "Hi Bob", "Rupture", "Bent Bird", "A City Upon a Hill", rep(NA, 20)),
  imdb_rating = c(7.5, 7.6, 8.0, 7.9, 8.5, 7.7, 8.0, 8.2, 8.8, 8.9, rep(NA, 20))
)


s1 <- d1 %>% 
  filter(season == 1)

s1

# Plot ----

# https://www.ascistance.co.uk/blog/network/hello-world/

ggplot(data = s1) +
  geom_tile(aes(x = episode_nb,
                y = 7,
                fill = imdb_rating),
            colour = "white") +
  ylim(c(0, 10)) +
  coord_polar(theta = "x") +
  theme_void()
