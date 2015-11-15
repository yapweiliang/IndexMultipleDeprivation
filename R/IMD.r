# IMD.r
# parse the imd.csv file and get all the details in the way I want it
#

#library(readr)
#library(data.table)


# constants ---------------------------------------------------------------
# stuff that we assume remains unchanged through different IMD releases, but maybe might change

# format as per readr::read_csv
#                            xxxxImdIncEmpEduHeaCriBarLivAciAopChiDduGeoWidIndOutxxxxx
.csv.column.types.all    <- "ccccdiidiidiidiidiidiidiidiidiidiidiidiidiidiidiidii_____"
.csv.column.types.scores <- "ccccd__d__d__d__d__d__d__d__d__d__d__d__d__d__d__d_______"

imd_headers <- data.frame(rbind(
  c("LSOA11CD",               "LSOA code (2011)"),
  c("LSOA11NM",               "LSOA name (2011)"),
  c("LAD13CD",                "Local Authority District code (2013)"),
  c("LAD13NM",                "Local Authority District name (2013)"),
  c("IMD",                    "Index of Multiple Deprivation (IMD) Score"),
  c("Income",                 "Income Score (rate)"),
  c("Employment",             "Employment Score (rate)"),
  c("Education",              "Education, Skills and Training Score"),
  c("Health",                 "Health Deprivation and Disability Score"),
  c("Crime",                  "Crime Score"),
  c("Barriers",               "Barriers to Housing and Services Score"),
  c("Living",                 "Living Environment Score"),
  c("IDACI",                  "Income Deprivation Affecting Children Index (IDACI) Score (rate)"),
  c("IDAOPI",                 "Income Deprivation Affecting Older People (IDAOPI) Score (rate)"),
  c("CYP_subdomain",          "Children and Young People Sub-domain Score"),
  c("Adult_subdomain",        "Adult Skills Sub-domain Score"),
  c("Geographical_subdomain", "Geographical Barriers Sub-domain Score"),
  c("Wider_subdomain",        "Wider Barriers Sub-domain Score"),
  c("Indoors_subdomain",      "Indoors Sub-domain Score"),
  c("Outdoors_subdomain",     "Outdoors Sub-domain Score")
), stringsAsFactors = FALSE)

# comments ----------------------------------------------------------------
#
# the higher the score, the more deprived
# when ranking, 1 = most deprived


# default file ------------------------------------------------------------

.defaultPath <- "H:/DATASETS/IMD/IMD2015"
.defaultFile <- "File_7_ID_2015_All_ranks__deciles_and_scores_for_the_Indices_of_Deprivation__and_population_denominators.csv"

# getIMD ------------------------------------------------------------

#' get Index of Multiple Deprivation data
#'
#' load and prepare the data from .csv file
#'
#' @param path path to file
#' @param file filename of the .csv file containing everything
#' @param scores.only TRUE (default) to strip ranking and deciles, FALSE to keep everything
#'
#' @return IMD dataset
#' @export
#'
#' @examples IMD2015 <- getIMD()
getIMD <- function( path = .defaultPath,
                    file = .defaultFile,
                    scores.only = TRUE) {

  file <- paste(path, file, sep = "/")
  cols <- ifelse(scores.only, .csv.column.types.scores, .csv.column.types.all)
  IMD <- read_csv(file, col_types = cols)
  setnames(IMD, old = imd_headers[, 2], new = imd_headers[, 1])

  return(IMD)
}