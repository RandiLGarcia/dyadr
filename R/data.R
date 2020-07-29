#' Acitelli Data
#'
#' Data from 148 heterosexual married couples in Detroit
#'
#' @docType data
#' @import qtl
#' @usage data(acipair)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @examples
#' str(acipair)
"acipair"

#' Alliance Data
#'
#' Data from Gibler (2009) paper about International military alliances contains the alliance dataset distributed by directed-dyad, with one observation for each directed-dyad alliance initiation, with data on 414 countries.
#'
#' @docType data
#'
#' @usage data(alliance)
#'
#' @keywords datasets
#'
#' @format A data frame with 3252 rows and 18 variables:
#' \describe{
#' \item{version4id}{the unique serial identification number for each alliance}
#' \item{ccode1}{the Correlates of War System Membership number of the state initiating alliance terms toward ccode2}
#' \item{state_name1}{the Correlates of War System Membership name of ccode1}
#' \item{ccode2}{the Correlates of War System Membership number of the state receiving alliance terms from ccode1}
#' \item{state_name2}{the Correlates of War System Membership name of ccode2}
#' \item{dyad_st_day}{the day of entry into the Correlates of War system for the allied dyad}
#' \item{dyad_st_month}{the month of entry into the Correlates of War system for the allied dyad}
#' \item{dyad_st_year}{the year of entry into the Correlates of War system for the allied dyad}
#' \item{dyad_end_day}{the day of alliance entry for the directed-dyad observation; missing data denotes alliance is still in effect as of 12/31/2012}
#' \item{dyad_end_month}{the month of alliance entry for the directed-dyad observation; missing data denotes alliance is still in effect as of 12/31/2012}
#' \item{dyad_end_year}{the year of alliance entry for the directed-dyad observation; missing data denotes alliance is still in effect as of 12/31/2012}
#' \item{left_censor}{coded as (1) if the directed-dyad entered the alliance prior to 1/1/1816}
#' \item{right_censor}{coded as (1) if the directed-dyad is still considered in the alliance as of 12/31/2012}
#' \item{defense}{coded as (1) if ccode1 signed a defense pact to protect ccode2}
#' \item{neutrality}{coded as (1) if ccode1 agreed to remain neutral toward ccode2}
#' \item{nonaggression}{coded as (1) if ccode1 promised not to attack ccode2}
#' \item{entente}{coded as (1) if ccode1 agreed to consult with ccode2 if a crisis occurred}
#' \item{version}{version number of the data set (4.x)}
#' }
#'
#' @references Gibler, Douglas M. 2009. International military alliances, 1648-2008. CQ Press.
#' (\url{https://dmgibler.people.ua.edu/alliance-data.html})
#'
#' @examples
#' str(alliance)
"alliance"

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
#' str(dyadic_trade)
#' \dontrun{
#' if (require(qtlcharts)) {
#'   iplotCurves(dyadic_trade, flow1, flow2)
#' }
#' }
"dyadic_trade"
