# Use uma imagen R:
FROM rocker/r-ver:4.2.0

# Poderia ser em Python:
# FROM python:3.10

# Pedimos ao conteiner para instalar os pacotes do renv:
# The renv package lhe ajuda a criar versões reproduzíveis para os seus 
# projetos em R, ou seja ambientes locais, um gerenciamento de 
# pacotes/dependências, separada da instalação global de pacotes de R que você tem no computador.

# ENV RENV_VERSION=v1.0.2
# RUN R -e "install.packages('remotes')"
# RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
# RUN R -e "options(renv.config.repos.override = 'https://packagemanager.posit.co/cran/latest')"

COPY . /app

WORKDIR /app

RUN R -e "renv::restore()"

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('./app.R', host='0.0.0.0', port=3838)"]
