#' @name testvar
#' @title Test the variance of a random effect
#'
#' @param ovar the outcome variable in quotes.
#' @param xx string set of fixed variables separated by comma (program assumes two intercept).
#' @param yy string set of random variables separated by comma (program assumes no  intercept in the usual sense); last item on the list is tested (the first two arguments are the same here, but they do not have to be; there might be more items in the fixed part.
#' @param dset the dataset.
#' @param DID  the dyad ID in quotes.
#' @param obs  the observation ID variable in quotes. This is a unique number for each dyad-measurement.
#' @param dvv the distinguishing variable in quotes.
#' @param ctrl an lmeControl object. Defaults to msMaxIter=10000, MaxIter=100000, msMaxEval=10000, returnObject=TRUE, niterEM=10000, nlmStepMax=1000.
#' @importFrom stats pchisq
#' @examples
#' \dontrun{
#' testvar(
#'   "AConflict", "man,woman,MTime,WTime",
#'   "man,woman,WTime,MTime", "kashy_ppp", "DYADID", "obsid", "GenderS"
#' )
#' }
#' @export
#'
testvar <- function(ovar, xx, yy, dset, DID, obs, dvv, ctrl = defaultctrl) {
  defaultctrl <- lmeControl(
    msMaxIter = 10000,
    MaxIter = 100000,
    msMaxEval = 10000,
    returnObject = TRUE,
    niterEM = 10000,
    nlmStepMax = 1000
  )

  xxx <- as.list(strsplit(xx, ",")[[1]])
  basp <- NULL
  basp <- xxx[1]

  for (i in 1:length(xxx))
  {
    if (i > 1) basp <- paste0(basp, "+", xxx[[i]])
  }

  basp <- as.formula(paste0(ovar, " ~ ", basp, "-1"))


  yyy <- as.list(strsplit(yy, ",")[[1]])
  bats <- paste0(yyy[1])
  pop <- length(yyy) - 1

  for (i in 1:pop)
  {
    if (i > 1) {
      bats <- paste0(bats, "+", yyy[[i]])
    }
  }

  bats <- paste0(bats, "-1")

  dset$DID <- dset[, DID]
  dset$obs <- dset[, obs]
  dset$dvv <- dset[, dvv]
  rline <- as.formula(paste0("random = ~ ", bats, "-1 |DID"))

  lll <- yyy
  lll[length(yyy)] <- NULL
  qq <- as.formula(paste("~ ", paste(lll, collapse = "+"), paste("-1")))
  pp <- as.formula(paste("~ ", paste(yyy[4], collapse = "+"), paste("-1")))


  fullrun <- lme(basp,
    data = dset,
    rline,
    correlation = corCompSymm(form = ~ 1 | DID / obs),
    weights = varIdent(form = ~ 1 | dvv),
    na.action = na.omit,
    control = ctrl
  )


  parrun <- lme(basp,
    data = dset,
    random = list(DID = pdBlocked(list(qq, pp))),
    correlation = corCompSymm(form = ~ 1 | DID / obs),
    weights = varIdent(form = ~ 1 | dvv),
    na.action = na.omit,
    control = ctrl
  )


  vvxx <- NULL

  vvxx[3] <- -2 * logLik(fullrun)[1] + 2 * logLik(parrun)[1]



  vvxx[1] <- ovar
  vvxx[2] <- yyy[length(yyy)]
  vvxx[4] <- 1
  vvxx[5] <- {
    (pchisq(as.numeric(vvxx[3]), as.numeric(vvxx[4]), lower.tail = FALSE)
    + pchisq(as.numeric(vvxx[3]), as.numeric(vvxx[4]) - 1, lower.tail = FALSE)) / 2
  }

  names(vvxx) <- c("Outcome", "Variance Component Tested", "Chi Squared", "df", "p value")

  return(vvxx)
}

globalVariables(c("lme"))
