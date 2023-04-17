library(tidyverse)
library(palmerpenguins)

plot_penguins <- function(data) {
  plot <- ggplot(data, aes(x = bill_length_mm,
                     y = flipper_length_mm,
                     color = species)) +
  geom_point() +
  geom_hline(yintercept = 205) +
  geom_vline(xintercept = 45)
  return(plot)
}
