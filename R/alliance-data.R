#' Alliance Data
#'
#' Data from Gibler (2009) paper about International military alliances contains the alliance dataset distributed by directed-dyad, with one observation for each directed-dyad alliance initiation, with data on 414 countries. 
#'
#'@docType data
#'
#'@usage data(alliance)
#'
#'@keywords datasets
#'
#'@format A data frame with 3252 rows and 18 variables:
#'\describe{
#' \item{version4id}{the unique serial identification number for each alliance}
#' \item{ccode1}{the Correlates of War System Membership number of the state initiating alliance terms toward ccode2}
#' \item{state_name1}{the Correlates of War System Membership name of ccode1}
#' \item{ccode2}{the Correlates of War System Membership number of the state receiving alliance terms from ccode1}
#' \item{state_name2}{the Correlates of War System Membership name of ccode2}
#' \item{dyad_st_day/month/year}{the day/month/year of entry into the Correlates of War system for the allied dyad}
#' \item{dyad_end_day/month/year}{the day/month/year of alliance entry for the directed-dyad observation; missing data denotes alliance is still in effect as of 12/31/2012}
#' \item{left_censor}{coded as (1) if the directed-dyad entered the alliance prior to 1/1/1816}
#' \item{right_censor}{coded as (1) if the directed-dyad is still considered in the alliance as of 12/31/2012}
#' \item{defense}{coded as (1) if ccode1 signed a defense pact to protect ccode2}
#' \item{neutrality}{coded as (1) if ccode1 agreed to remain neutral toward ccode2}
#' \item{nonaggression}{coded as (1) if ccode1 promised not to attack ccode2}
#' \item{entente}{coded as (1) if ccode1 agreed to consult with ccode2 if a crisis occurred}
#' \item{year}{the yearly data adds a variable for the observation year (not included in the directed-dyad, alliance-initiation data)}
#' \item{version}{version number of the data set (4.x)}
#' }
#'
#' @references Gibler, Douglas M. 2009. International military alliances, 1648-2008. CQ Press.  
#' (\url{https://dmgibler.people.ua.edu/alliance-data.html})
#' 
#' @examples
#' data(alliance)
"alliance"
