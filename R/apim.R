





apim <- function(x, dat, dyadid, option = "indistinguishable"){
  
  
  if (lazyeval::is_formula(x)){
   
   mod <- gls(x, na.action=na.omit, 
        method="REML", verbose=TRUE, correlation=corCompSymm(form=~1|dyadid),
        data=dat)
   
   return(mod)
    
  }else {
    message("please enter a formula")
  }
  
}
