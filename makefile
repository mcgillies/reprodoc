all:

results/penguins_plot.png: R/generate_figures.R
	Rscript R/generate_figures.R --input_dir="data/penguins.csv" --out_dir="results/"

clean: 
	rm -rf results