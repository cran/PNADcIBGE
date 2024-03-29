% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pnadc_deflator.R
\name{pnadc_deflator}
\alias{pnadc_deflator}
\title{Add deflator variables to PNADC microdata}
\usage{
pnadc_deflator(data_pnadc, deflator.file)
}
\arguments{
\item{data_pnadc}{A tibble of PNADC microdata read with \code{read_pnadc} function.}

\item{deflator.file}{The deflator file for selected survey available on official website:\cr Quarter (select the deflator zip file) - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Trimestral/Microdados/Documentacao/}.\cr Annual per Interview (select a deflator xls file, according to the appropriated year) - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Anual/Microdados/Visita/Documentacao_Geral/}.\cr Annual per Topic (select a deflator xls file, according to the appropriated period and, then, inside the documentation folder, choose the desired year) - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Anual/Microdados/Trimestre/}.}
}
\value{
A tibble with the data provided from PNADC survey and the deflator variables added for use.
}
\description{
This function adds deflator variables to PNADC microdata. For deflation of income variables, the documentation provided through the following addresses must be used:\cr Quarter - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Trimestral/Microdados/Documentacao/PNADcIBGE_Deflator_Trimestral.pdf}.\cr Annual per Interview - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Anual/Microdados/Visita/Documentacao_Geral/PNADcIBGE_Deflator_Anual_Visita.pdf}.\cr Annual per Topic - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Anual/Microdados/Trimestre/Documentacao_Geral/PNADcIBGE_Deflator_Anual_Trimestre.pdf}.
}
\note{
For more information, visit the survey official website <\url{https://www.ibge.gov.br/estatisticas/sociais/trabalho/9171-pesquisa-nacional-por-amostra-de-domicilios-continua-mensal.html?=&t=o-que-e}> and consult the other functions of this package, described below.
}
\examples{
# Using data read from disk
input_path <- pnadc_example(path="input_example.txt")
data_path <- pnadc_example(path="exampledata.txt")
dictionary.path <- pnadc_example(path="dictionaryexample.xls")
deflator.path <- pnadc_example(path="deflatorexample.xls")
pnadc.df <- read_pnadc(microdata=data_path, input_txt=input_path, vars=c("VD4001","VD4002"))
pnadc.df <- pnadc_labeller(data_pnadc=pnadc.df, dictionary.file=dictionary.path)
pnadc.df <- pnadc_deflator(data_pnadc=pnadc.df, deflator.file=deflator.path)
\donttest{
# Downloading data
pnadc.df2 <- get_pnadc(year=2017, quarter=4, selected=FALSE, vars=c("VD4001","VD4002"),
                       defyear=2017, defperiod=4, labels=TRUE, deflator=FALSE, design=FALSE,
                       reload=TRUE, curlopts=list(), savedir=tempdir())
deflator.path2 <- pnadc_example(path="deflatorexample.xls")
pnadc.df2 <- pnadc_deflator(data_pnadc=pnadc.df2, deflator.file=deflator.path2)}
}
\seealso{
\link[PNADcIBGE]{get_pnadc} for downloading, labeling, deflating and creating survey design object for PNADC microdata.\cr \link[PNADcIBGE]{read_pnadc} for reading PNADC microdata.\cr \link[PNADcIBGE]{pnadc_labeller} for labeling categorical variables from PNADC microdata.\cr \link[PNADcIBGE]{pnadc_design} for creating PNADC survey design object.\cr \link[PNADcIBGE]{pnadc_example} for getting the path of the quarter PNADC toy example files.
}
