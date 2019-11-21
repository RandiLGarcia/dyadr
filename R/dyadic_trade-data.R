#' Dyadic Trade Data
#' 
#' Data from Correlates of War (COW) project in Version 3.0
#' contains annual dyadic and national trade figures for states within the international system
#' contains 139 years' data about dyadic trade
#' 
#' @docType data
#' 
#' @usage data(dyadic_trade)
#' 
#' @format A data frame with 540,507 rows and 9 variables:
#' \describe{
#'   \item{ccode1}{Correlates of War Country Code for State A}
#'   \item{ccode2}{Correlates of War Country Code for State B}
#'   \item{year}{Observational Year}
#'   \item{importer1}{Name of country A}
#'   \item{importer2}{Name of country B}
#'   \item{flow1}{Imports of Country A from Country B in current US millions of dollars}
#'   \item{flow2}{Imports of Country B from Country A in current US millions of dollars}
#'   \item{source1}{Source of data for flow1 variable (see table below)}
#'   \item{source2}{Source of data for flow2 variable (see table below)}
#' }
#' 
#' @keywords datasets
#' 
#' @references Correlates of War Version 3.0
#' (\url{http://www.correlatesofwar.org/data-sets/bilateral-trade})
#' 
#' @examples
#' data(dyadic_trade)
#' \donttest{iplotCurve(flow1, flow2)}
"dyadic_trade"


