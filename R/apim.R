#' @name apim
#' @title actor-partner interdependence model
#'
#' will run the apim on indistinguishable dyads eventualy 
#' 
#' even more stuff about the apim
#'
#' @param x is a function with form y ~ x.
#'
#' @details some additional details about these functions

#' @export
apim <- function(x, dat, dyadid, option = "indistinguishable"){
  
    if (lazyeval::is_formula(x)){
      
      mod <- gls(x, na.action=na.omit, 
                 method="REML", verbose=TRUE, correlation=eval(parse(text=paste0("corCompSymm(form=~1|", dyadid, ")"))),
                 data=dat)
      
      return(mod)
      
    }else {
      message("please enter a formula")
    }
  
}
