doc <- "
Generates predictions for each row in the penguins dataset
Usage: Rscript predictions.R --input_dir = <input_dir> --out_dir = <out_dir>
Options:
--input_dir=<input_dir>		Path (including filename) to raw data
--out_dir=<output_dir>		Path to directory where the results should be saved
"
library(docopt)
library(gridExtra)
library(knitr)
library(tidyverse)

opt <- docopt(doc)
input_dir <- opt[["--input_dir"]]
out_dir <- opt[["--out_dir"]]

main <- function(input_dir, out_dir) {
  if (!dir.exists(out_dir)) {
    dir.create(out_dir)
  }

  data <- read_csv(input_dir)
  classify_penguin <- function(bill_length, flipper_length) {
    if (flipper_length > 205) {
      return("Gentoo")
    } else {
      if (bill_length > 45) {
        return("Chinstrap")
      } else {
        return("Adelle")
      }
    }
  }
  for (n in nrow(data)) {
    data$prediction <- classify_penguin(data$bill_length[n], data$flipper_length[n])
  }

  head_preds <- head(data, 20)
  write_csv(head_preds, output_dir/"preds.csv")
}

main(opt[["--input_dir"]], opt[["--out_dir"]])
