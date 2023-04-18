doc <- "
Loads penguins data from palmer penguins and produces initial plot
Usage: R/generate_figures.R --input_dir=<input_dir>  --out_dir=<output_dir>
Options:
--input_dir=<input_dir>		Path (including filename) to raw data
--out_dir=<output_dir>		Path to directory where the results should be saved
"

library(docopt)
library(gridExtra)
library(knitr)
library(tidyverse)
library(palmerpenguins)

opt <- docopt(doc)
input_dir <- opt[["--input_dir"]]
out_dir <- opt[["--out_dir"]]

main <- function(input_dir, out_dir) {
  # Create out_dir if it does not exist
  if (!dir.exists(out_dir)) {
    dir.create(out_dir)
  }

  data <- read_csv(input_dir)
  plot <- ggplot(data, aes(x = bill_length_mm,
                           y = flipper_length_mm,
                           color = species)) +
    geom_point() +
    geom_hline(yintercept = 205) +
    geom_vline(xintercept = 45)
  ggsave("penguins_plot.png", device = "png", path = out_dir)
}

main(opt[["--input_dir"]], opt[["--out_dir"]])
