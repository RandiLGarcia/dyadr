#' #' Alliance Data
#'
#'Data from Gibler (2009) paper about International military alliances 
#' contains the alliance dataset distributed by directed-dyad, 
#' with one observation for each directed-dyad alliance initiation, 
#' with data on 414 countries. 
#'
#' @docType data
#'
#' @usage data(alliance)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @references Gibler, Douglas M. 2009. International military alliances, 1648-2008. CQ Press.  
#' (\href{https://dmgibler.people.ua.edu/alliance-data.html})
#' 
#' @examples
#' data(alliance)
#' \donttest{iplotCurves(defense, nonaggression)}
"alliance"