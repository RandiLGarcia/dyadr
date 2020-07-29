#' @name LRtestvar
#' @title Test the variance of a random effect
#'
#' @param outp the lme model object.
#' @param p string variable that you want to test the random variance component for.
#' @param ctrl an lmeControl object. Defaults to msMaxIter=10000, MaxIter=100000, msMaxEval=10000, returnObject=TRUE, niterEM=10000, nlmStepMax=1000.
#' @importFrom stringr str_locate str_remove str_remove_all str_c str_detect str_split
#' @importFrom stats as.formula formula logLik pchisq
#' @importFrom stringi stri_length
#' @examples 
#' \dontrun{
#' LRtestvar(dyadGC_full, "MTime")
#' }
#' @export
#'
LRtestvar <- function(outp, p, ctrl = defaultctrl) {
  defaultctrl <- lmeControl(
    msMaxIter = 10000,
    MaxIter = 100000,
    msMaxEval = 10000,
    returnObject = TRUE,
    niterEM = 10000,
    nlmStepMax = 1000
  )

  args <- as.character(outp$call)

  # relying on the -1 in the random effects
  new <- substr(
    str_remove(args[4], "~"),
    1,
    str_locate(str_remove(args[4], "~"), "-") - 1
  )

  ran_list <- str_remove_all(unlist(str_split(new, "\\+")), " ")
  ran_end <- substr(args[4], str_locate(args[4], "-"), stri_length(args[4]))

  # stripped formulas and data from model call
  out <- str_remove_all(substr(args[2], 1, str_locate(args[2], "~") - 1), " ")
  mfm <- as.formula(args[2])
  dat <- get(args[3])
  mcor <- formula(substr(args[5], str_locate(args[5], "~"), stri_length(args[5]) - 1))
  mwei <- formula(substr(args[6], str_locate(args[6], "~"), stri_length(args[6]) - 1))
  nact <- args[7]

  # different random effects
  mran_full <- formula(args[4])

  mran_omit <- formula(str_c("~", str_c(ran_list[!str_detect(ran_list, str_c("^", p, "$"))], collapse = "+"),
    ran_end,
    collapse = ""
  ))

  fm1 <- formula(str_remove_all(str_c("~",
    str_c(ran_list[!str_detect(ran_list, str_c("^", p, "$"))], collapse = "+"),
    "-1",
    collapse = ""
  ), " "))
  fm2 <- formula(str_remove_all(str_c("~",
    p,
    "-1",
    collapse = ""
  ), " "))

  dyd <- substr(args[4], str_locate(args[4], "\\|") + 1, stri_length(args[4]))
  dyd <- str_remove_all(dyd, " ")
  obs <- substr(args[5], str_locate(args[5], "/") + 1, stri_length(args[5]) - 1)

  dat$dyd <- dat[, dyd]
  dat$obs <- dat[, obs]

  mod_omit <- lme(mfm,
    data = dat,
    random = mran_omit,
    correlation = corCompSymm(form = mcor),
    weights = varIdent(form = mwei),
    na.action = nact,
    control = ctrl
  )

  mod_sep <- lme(mfm,
    data = dat,
    random = list(
      dyd =
        pdBlocked(list(fm1, fm2))
    ),
    correlation = corCompSymm(form = ~ 1 | dyd / obs),
    weights = varIdent(form = mwei),
    na.action = nact,
    control = ctrl
  )

  pvalCorrected <- function(chisq, df) {
    (pchisq(chisq, df, lower.tail = FALSE) + pchisq(chisq, df - 1, lower.tail = FALSE)) / 2
  }

  fff <- -2 * logLik(mod_omit)[1] + 2 * logLik(mod_sep)[1]

  return(data.frame(
    Outcome = out,
    VarComponent = p,
    Chi_Squared = -2 * logLik(mod_omit)[1] + 2 * logLik(mod_sep)[1],
    df = 1,
    p_value = pvalCorrected(as.numeric(fff), 1)
  ))
}

globalVariables(c("lmeControl", "pdBlocked", "varIdent"))
