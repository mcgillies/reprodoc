all: results/penguins_plot.png results/penguins.html

results/penguins_plot.png: R/generate_figures.R
	Rscript R/generate_figures.R --input_dir="data/penguins.csv" --out_dir="results/"

results/penguins.html: analysis/penguins.Rmd analysis/citations.bib
	Rscript -e "rmarkdown::render('analysis/penguins.Rmd', 'bookdown::html_document2')"

clean: 
	rm -rf results
	rm -rf analysis/penguins.html