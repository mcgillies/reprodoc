FROM r-base
RUN apt-get install docopt
RUN Rscript -e "install.packages('remotes')"
RUN Rscript -e "remotes::install_version('knitr')"
RUN Rscript -e "remotes::install_version('tidyverse')"
RUN Rscript -e "remotes::install_version('palmerpenguins')"


