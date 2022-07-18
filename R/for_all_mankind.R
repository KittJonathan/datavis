# For all mankind 
# Last updated 2022-07-12

# Load packages ----

library(tidyverse)
library(patchwork)
library(showtext)

# Import fonts ----

font_add_google(name = "Orbitron", family = "orbitron")
font_add_google(name = "Monoton", family = "monoton")
font_add_google(name = "Raleway Dots", family = "raleway_dots")
font_add_google(name = "Zen Tokyo Zoo", family = "zen_tokyo")
font_add_google(name = "Tourney", family = "tourney")
showtext_auto()

# Tests ----

library(ggforce)

ggplot() +
  geom_circle(aes(x0 = -75, y0 = 0, r = 25),
              fill = "#d5f2f2", colour = NA, size = 2) +
  coord_fixed() +
  xlim(-100, 200) +
  ylim(-50, 50) +
  theme(panel.background = element_rect(fill = "#0d0d0d"))

fill = "#d5f2f2", alpha = 0.5) +
  geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                          label = paste0(episode_duration_min, " min")),
            family = "orbitron", hjust = 0, colour = "white", size = 15) +
  annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     2", family = "monoton", colour = "#d5f2f2", size = 35, alpha = 0.75) +
  scale_y_reverse() +
  xlim(c(0, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#30588c"),
        plot.background = element_rect(fill = "#30588c"))

p <- ggplot() +
  geom_circle(aes(x0 = -75, y0 = 0, r = 25)) +
  geom_circle(aes(x0 = 200, y0 = 0, r = 10)) +
  geom_segment(data = s1,
               aes(x = 0, xend = 20*imdb_rating,
                   y = rev(seq(-45, 45, 10)), yend = rev(seq(-45, 45, 10)))) +
  # geom_segment(aes(x = 0, xend = 50, y = seq(-45, 45, 10), yend = seq(-45, 45, 10))) +
  geom_segment(aes(x = -50, xend = 0, y = 0, yend = seq(-45, 45, 10))) +
  geom_point(data = s1,
             aes(x = 20*imdb_rating, y = rev(seq(-46, 46, 10))),
             size = 5) +
  geom_text(data = s1, aes(x = 0, y = rev(seq(-45, 45, 10)), label = label),
            hjust = 0, vjust = -0.5) +
  geom_rect(data = s1,
            aes(xmin = 0, xmax = episode_duration_min,
                ymin = rev(seq(-47, 43, 10)),
                ymax = rev(seq(-43, 47, 10)))) +
  # annotate(geom = "text", x = 0, y = 42, label = s1$label[1], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = 34, label = s1$label[2], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = 26, label = s1$label[3], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = 18, label = s1$label[4], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = 10, label = s1$label[5], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = 2, label = s1$label[6], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = -6, label = s1$label[7], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = -14, label = s1$label[8], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = -22, label = s1$label[9], hjust = 0, size = 3) +
  # annotate(geom = "text", x = 0, y = -30, label = s1$label[10], hjust = 0, size = 3) +
  # geom_text(data = s1,
  #           aes(x = 0, y = seq(40, -40, 8), label = label),
  #           size = 10) +
  # geom_arc(aes(x0 = 0, y0 = 45, r = 5, start = -150, end = 0)) +
  # geom_segment(aes(x = 0, xend = 5, y = 0, yend = 5)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 4, start = 0, end = 2)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 6, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 7, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 8, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 9, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 10, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 11, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 12, start = 0, end = 3)) +
  # geom_arc(aes(x0 = 15, y0 = 15, r = 13, start = 0, end = 3)) +
  xlim(c(-100, 225)) +
  ylim(c(-50, 50)) +
  coord_fixed()

ggsave("figs/test.png", p, dpi = 320, width = 12, height = 6)

p + p

arcs <- data.frame(
  start = 0,
  end = runif(5) * 2*pi,
  r = seq_len(5)
)

p <- ggplot() + theme_no_axes() + coord_fixed()

p + geom_arc(aes(x0 = 0, y0 = 0, r = r, start = start, end = end, 
                 alpha = ..index.., colour = factor(r)), data = arcs)

# Create dataset ----

# https://www.imdb.com/title/tt7772588/episodes

d1 <- tibble(
  season = rep(1:3, each = 10),
  episode_nb = rep(1:10, times = 3),
  episode_title = c("Red Moon", "He Built the Saturn V", "Nixon's Women", "Prime Crew", "Into the Abyss",
                    "Home Again", "Hi Bob", "Rupture", "Bent Bird", "A City Upon a Hill",
                    "Every Little Thing", "The Bleeding Edge", "Rules of Engagement", "Pathfinder", "The Weight", 
                    "Best-Laid Plans", "Don't be Cruel", "And Here's to You", "Triage", "The Grey",
                    "Polaris", "Game Changer", "All In", "Happy Valley", "Seven Minutes of Terror", "New Eden",
                    "Bring It Down", "The Sands of Ares", "Coming Home", "Stranger in a Strange Land"),
  episode_duration_min = c(65, 62, 62, 63, 62, 62, 59, 57, 48, 76,
                           76, 56, 60, 60, 58, 59, 62, 69, 56, 76,
                           57, 62, 61, 52, 63, 61, 57, rep(NA, 3)),
  imdb_rating = c(7.5, 7.6, 8.0, 7.9, 8.5, 7.7, 8.0, 8.2, 8.8, 8.9,
                  7.9, 7.3, 8.0, 7.6, 7.4, 7.7, 7.7, 7.9, 8.7, 9.5, 
                  8.5, 8.5, 8.1, 8.9, 8.2, 6.9, rep(NA, 4))) %>% 
  mutate(label = paste0(episode_nb, " - ", episode_title)) 
  

# Season 1 plots ----

ggplot(data = filter(d1, season == 1))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0)

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25)

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb),
             colour = "#a69ca2") +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb),
             colour = "#a69ca2") +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating),
            colour = "#a69ca2") +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb),
             colour = "#a69ca2") +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating),
            colour = "#a69ca2") +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
            fill = "#a69ca2") +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb),
             colour = "#a69ca2") +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating),
            colour = "#a69ca2") +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
            fill = "#a69ca2") +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 3, label = "E", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 4, label = "A", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 5, label = "S", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 6, label = "O", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 7, label = "N", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 9, label = "1", colour = "#a69ca2") +
  xlim(c(-10, 100)) +
  theme_void()

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb),
               colour = "#a69ca2") +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb),
             colour = "#a69ca2") +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating),
            colour = "#a69ca2") +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
            fill = "#a69ca2") +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min, y = episode_nb, label = paste0(episode_duration_min, " min")),
            hjust = 1.25) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 3, label = "E", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 4, label = "A", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 5, label = "S", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 6, label = "O", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 7, label = "N", colour = "#a69ca2") +
  annotate(geom = "text", x = -8, y = 9, label = "1", colour = "#a69ca2") +
  xlim(c(-10, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#0d0d0d"),
        plot.background = element_rect(fill = "#0d0d0d"))

(s1 <- ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
  geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 2.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_text(aes(x = episode_duration_min + 0.25, y = episode_nb - 0.15, label = paste0(episode_duration_min, " min")),
            hjust = 0) +
  scale_y_reverse() +
  annotate(geom = "text", x = -8, y = 2, label = "S") +
  annotate(geom = "text", x = -8, y = 3, label = "E") +
  annotate(geom = "text", x = -8, y = 4, label = "A") +
  annotate(geom = "text", x = -8, y = 5, label = "S") +
  annotate(geom = "text", x = -8, y = 6, label = "O") +
  annotate(geom = "text", x = -8, y = 7, label = "N") +
  annotate(geom = "text", x = -8, y = 9, label = "1") +
  theme_void() +
  xlim(c(-10, 95))
)

(s2 <- ggplot(data = filter(d1, season == 2)) +
    geom_segment(aes(x = 0, xend = 10 * imdb_rating,
                     y = episode_nb, yend = episode_nb)) +
    geom_point(aes(x = 10 * imdb_rating, y = episode_nb)) +
    geom_text(aes(x = (10 * imdb_rating) + 2.5, y = episode_nb, label = imdb_rating)) +
    geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                  ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
    geom_text(aes(x = 2.5, y = episode_nb, label = label),
              hjust = 0) +
    geom_text(aes(x = episode_duration_min + 0.25, y = episode_nb - 0.15, label = paste0(episode_duration_min, " min")),
              hjust = 0) +
    scale_y_reverse() +
    annotate(geom = "text", x = -8, y = 2, label = "S") +
    annotate(geom = "text", x = -8, y = 3, label = "E") +
    annotate(geom = "text", x = -8, y = 4, label = "A") +
    annotate(geom = "text", x = -8, y = 5, label = "S") +
    annotate(geom = "text", x = -8, y = 6, label = "O") +
    annotate(geom = "text", x = -8, y = 7, label = "N") +
    annotate(geom = "text", x = -8, y = 9, label = "2") +
    theme_void() +
    xlim(c(-10, 95))
)


##############################################################################

ggplot(data = filter(d1, season == 1)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25))

ggplot(data = filter(d1, season == 1)) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min / 1.5 ,
                ymin = episode_nb - 0.25, ymax = episode_nb + 0.25)) +
  geom_text(aes(x = 0.5, y = episode_nb, label = label),
            hjust = 0) +
  geom_vline(aes(xintercept = mean(10*imdb_rating, na.rm = TRUE))) +
  geom_segment(aes(x = mean(10*imdb_rating), xend = 10*imdb_rating,
                   y = episode_nb, yend = episode_nb))



ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 20*imdb_rating,
                   y = episode_nb, yend = episode_nb))

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = 0, xend = 20*imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_point(aes(x = 20*imdb_rating, y = episode_nb),
             size = 15)

ggplot(data = filter(d1, season == 1)) +
  geom_segment(aes(x = mean(15*imdb_rating, na.rm = TRUE), xend = 15*imdb_rating,
                   y = episode_nb, yend = episode_nb)) +
  geom_vline(aes(xintercept = mean(15*imdb_rating, na.rm = TRUE))) +
  geom_point(aes(x = 15*imdb_rating, y = episode_nb),
             size = 15) +
  geom_rect(aes(xmin = 0, xmax = episode_duration_min,
                ymin = episode_nb - 0.35, ymax = episode_nb + 0.35))



(s1p1 <- ggplot(data = filter(d1, season == 1)) +
   geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                           ymin = episode_nb - 0.35, ymax = episode_nb + 0.35),
             fill = "#a69ca2", alpha = 1) +
   geom_text(mapping = aes(x = 2.5, y = episode_nb,
                           label = label),
             family = "orbitron", hjust = 0, colour = "#0d0d0d", size = 10) +
   geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                           label = paste0(episode_duration_min, " min")),
             family = "orbitron", hjust = 0, colour = "#a69ca2", size = 10) +
   geom_segment(mapping = aes(x = 0,  xend = 20*imdb_rating, y = episode_nb, yend = episode_nb),
                colour = "#a69ca2") +
   geom_point(mapping = aes(x = 20*imdb_rating, y = episode_nb), size = 15, colour = "#a69ca2") +
   annotate(geom = "text", x = 85, y = 5.5, label = "SEASON 1", family = "tourney", colour = "#a69ca2", size = 50, alpha = 0.75) +
   xlim(c(0, 200)) +
   scale_y_reverse() +
   # theme_void() +
   theme(panel.background = element_rect(fill = "#0d0d0d"),
         plot.background = element_rect(fill = "#0d0d0d"))
)

ggsave("figs/famk01.png", s1p1, dpi = 320, width = 12, height = 6)

(s1p2 <- ggplot(data = filter(d1, season == 1)) +
    # geom_vline(aes(xintercept = mean(imdb_rating, na.rm = TRUE)),
    #            colour = "#a69ca2", linetype = "dotted") +
    geom_segment(aes(x = mean(imdb_rating, na.rm = TRUE),
                     xend = imdb_rating,
                     y = episode_nb - 0.35, 
                     yend = episode_nb - 0.35),
                 colour = "#a69ca2") +
    # geom_point(aes(x = imdb_rating, y = episode_nb),
    #            size = 12, colour = "#a69ca2") +
    # geom_text(aes(x = imdb_rating, y = episode_nb, label = imdb_rating),
    #           family = "orbitron", size = 12) +
    # xlim(c(7, 10)) +
    # ylim(c(0, 15)) +
    scale_y_reverse() +
    # theme_void() +
    theme(panel.background = element_rect(fill = "#0d0d0d"),
          plot.background = element_rect(fill = "#0d0d0d"))
)

ggsave("figs/famk02.png", s1p2, dpi = 320, width = 12, height = 6)

p <- s1p1 + s1p2

ggsave("figs/famk.png", p, dpi = 320, width = 12, height = 6)

(p2 <- ggplot(data = s2) +
    geom_point(aes(x = imdb_rating,
                   y = label)) +
    geom_vline(aes(xintercept = mean(imdb_rating))) +
    geom_segment(aes(x = mean(imdb_rating), xend = imdb_rating,
                     y = label, yend = label)) +
    xlim(c(7, 10)) +
    theme(axis.text.y = element_text(hjust = 0)) +
    theme(panel.background = element_rect(fill = "#0d0d0d"),
          plot.background = element_rect(fill = "#0d0d0d"))
)

ggsave("figs/famk02.png", s1p2, dpi = 320, width = 12, height = 6)



ggsave("figs/famk01.png", s1p1, dpi = 320, width = 12, height = 6)



s1 <- d1 %>%
  filter(season == 1) %>% 
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>% 
  mutate(label = fct_rev(fct_inorder(label)))

s2 <- d1 %>%
  filter(season == 2) %>%
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>%
  mutate(label = fct_rev(fct_inorder(label)))

s3 <- d1 %>%
  filter(season == 3) %>%
  mutate(label = paste0(episode_nb, " - ", episode_title)) %>%
  mutate(label = fct_rev(fct_inorder(label)))

(p1 <- ggplot(data = s1) +
  geom_text(mapping = aes(x = 2.5, y = episode_nb,
                          label = label),
            family = "orbitron", hjust = 0, colour = "white", size = 10) +
  geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                          ymin = episode_nb - 0.35, ymax = episode_nb + 0.35),
            fill = "#a69ca2", alpha = 0.5) +
  geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                          label = paste0(episode_duration_min, " min")),
            family = "orbitron", hjust = 0, colour = "white", size = 10) +
  annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     1", family = "monoton", colour = "#a69ca2", size = 35, alpha = 0.75) +
  scale_y_reverse() +
  xlim(c(0, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#0d0d0d"),
        plot.background = element_rect(fill = "#0d0d0d"))
)

ggsave("figs/famk01.png", p1, dpi = 320, width = 12, height = 6)

(p2 <- ggplot(data = s2) +
  geom_text(mapping = aes(x = 2.5, y = episode_nb,
                          label = label),
            family = "orbitron", hjust = 0, colour = "white", size = 15) +
  geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                          ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
            fill = "#d5f2f2", alpha = 0.5) +
  geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                          label = paste0(episode_duration_min, " min")),
            family = "orbitron", hjust = 0, colour = "white", size = 15) +
  annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     2", family = "monoton", colour = "#d5f2f2", size = 35, alpha = 0.75) +
  scale_y_reverse() +
  xlim(c(0, 100)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#30588c"),
        plot.background = element_rect(fill = "#30588c"))
)

(p3 <- ggplot(data = s3) +
    geom_text(mapping = aes(x = 2.5, y = episode_nb,
                            label = label),
              family = "orbitron", hjust = 0, colour = "white", size = 15) +
    geom_rect(mapping = aes(xmin = 0, xmax = episode_duration_min,
                            ymin = episode_nb - 0.25, ymax = episode_nb + 0.25),
              fill = "#f2bd1d", alpha = 1) +
    geom_text(mapping = aes(x = episode_duration_min + 1, y = episode_nb,
                            label = paste0(episode_duration_min, " min")),
              family = "orbitron", hjust = 0, colour = "white", size = 15) +
    annotate(geom = "text", x = 85, y = 5.5, label = "SEASON     3", family = "monoton", colour = "#f2bd1d", size = 35, alpha = 0.75) +
    scale_y_reverse() +
    xlim(c(0, 100)) +
    theme_void() +
    theme(panel.background = element_rect(fill = "#bf5111"),
          plot.background = element_rect(fill = "#bf5111"))
)

ggsave("figs/famk02.png", p2, dpi = 320, width = 12, height = 6)

p <- p1 / p2 / p3

ggsave("figs/famk.png", p, dpi = 320, width = 12, height = 6)
  

(p1 <- ggplot(data = s1) +
  geom_vline(aes(xintercept = mean(imdb_rating))) +
  geom_segment(aes(x = mean(imdb_rating), xend = imdb_rating,
                     y = label, yend = label)) +
  geom_rect(aes(xmin = 7, xmax = 10,
                ymin = as.numeric(label) - 0.25,
                ymax = as.numeric(label) + 0.25),
            alpha = 0.15) +
    geom_point(aes(x = imdb_rating,
                   y = label),
               shape = 21,
               size = 12,
               fill = "white") +
    geom_text(aes(x = imdb_rating, y = label, label = imdb_rating),
              family = "orbitron") +
  xlim(c(7, 10)) +
  theme(axis.title.y = element_blank(),
        axis.ticks = element_blank(),
        axis.text.y = element_text(family = "orbitron",
                                   hjust = 0)))

(p2 <- ggplot(data = s2) +
    geom_point(aes(x = imdb_rating,
                   y = label)) +
    geom_vline(aes(xintercept = mean(imdb_rating))) +
    geom_segment(aes(x = mean(imdb_rating), xend = imdb_rating,
                     y = label, yend = label)) +
    xlim(c(7, 10)) +
    theme(axis.text.y = element_text(hjust = 0)))

(p3 <- ggplot(data = s3) +
    geom_point(aes(x = imdb_rating,
                   y = label)) +
    geom_vline(aes(xintercept = mean(imdb_rating, na.rm = TRUE))) +
    geom_segment(aes(x = mean(imdb_rating, na.rm = TRUE), xend = imdb_rating,
                     y = label, yend = label)) +
    xlim(c(7, 10)) +
    theme(axis.text.y = element_text(hjust = 0)))

p1 / p2 / p3




ggplot(data = s1) +
  geom_line(aes(y = episode_nb,
                x = imdb_rating)) +
  geom_text(aes(x = 5, y = episode_nb,
                label = paste0(episode_nb, ". ", episode_title)),
            hjust = 0) +
  scale_y_reverse()

ggplot(data = d1) +
  geom_line(aes(x = index,
                y = imdb_rating,
                colour = as.factor(season)))



ggplot(data = s1) +
  geom_tile(aes(x = episode_nb,
                y = 7,
                fill = imdb_rating),
            colour = "white") +
  ylim(c(0, 10)) +
  coord_polar(theta = "x") +
  theme_void()
