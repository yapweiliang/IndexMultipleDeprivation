% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IMD.r
\name{getIMD}
\alias{getIMD}
\title{get Index of Multiple Deprivation data}
\usage{
getIMD(path = .defaultPath, file = .defaultFile, scores.only = TRUE)
}
\arguments{
\item{path}{path to file}

\item{file}{filename of the .csv file containing everything}

\item{scores.only}{\code{TRUE} (default) to strip ranking and deciles, \code{FALSE} to keep everything}
}
\value{
the IMD dataset as.data.table
}
\description{
load and prepare the data from .csv file.
}
\details{
\describe{
 \item{default path}{\code{H:/DATASETS/IMD/IMD2015}}
 \item{default file}{\code{File_7_ID_2015_All_ranks__deciles_and_scores_for_the_Indices_of_Deprivation__and_population_denominators.csv}}
}

headers are renamed as follows:
\tabular{rr}{
  \emph{new name}        \tab \emph{old name}\cr
  LSOA11CD               \tab LSOA code (2011)\cr
  LSOA11NM               \tab LSOA name (2011)\cr
  LAD13CD                \tab Local Authority District code (2013)\cr
  LAD13NM                \tab Local Authority District name (2013)\cr
  IMD                    \tab Index of Multiple Deprivation (IMD) Score\cr
  Income                 \tab Income Score (rate)\cr
  Employment             \tab Employment Score (rate)\cr
  Education              \tab Education, Skills and Training Score\cr
  Health                 \tab Health Deprivation and Disability Score\cr
  Crime                  \tab Crime Score\cr
  Barriers               \tab Barriers to Housing and Services Score\cr
  Living                 \tab Living Environment Score\cr
  IDACI                  \tab Income Deprivation Affecting Children Index (IDACI) Score (rate)\cr
  IDAOPI                 \tab Income Deprivation Affecting Older People (IDAOPI) Score (rate)\cr
  CYP_subdomain          \tab Children and Young People Sub-domain Score\cr
  Adult_subdomain        \tab Adult Skills Sub-domain Score\cr
  Geographical_subdomain \tab Geographical Barriers Sub-domain Score\cr
  Wider_subdomain        \tab Wider Barriers Sub-domain Score\cr
  Indoors_subdomain      \tab Indoors Sub-domain Score\cr
  Outdoors_subdomain     \tab Outdoors Sub-domain Score
}
}
\examples{
IMD2015 <- getIMD()
}

