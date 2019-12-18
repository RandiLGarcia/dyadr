context("dyadr")

test_that("var_labels error works", {
  expect_error(var_labels(iris), "labels")})

test_that("apim error works", {
  expect_message(apim("x"), "please enter a formula")})

test_that("crsp output returns correct value", {
  if (require(nlme)) {
    apimi = gls(Satisfaction_A ~ Tension_A + SelfPos_P, 
                na.action=na.omit, 
                correlation=corCompSymm (form=~1|CoupleID),
                data=acipair)
    apimie = summary(gls(Satisfaction_A ~ 1, 
                         na.action=na.omit, 
                         correlation=corCompSymm (form=~1|CoupleID),
                         data=acipair))
    # sd of errors for the model or esd
    esd = as.numeric(apimi[6])
    # sd of errors for the empty model or esd0
    esd0 = as.numeric(apimie[6])
    # the R squared, using the crsp function                
    print(crsp(esd, esd0))
    expect_gt(crsp(esd,esd0),0.3)
  }
})

test_that("smallsummary returns output including Correlation", {
  apimi = nlme::gls(Satisfaction_A ~ Tension_A + SelfPos_P, 
              na.action=na.omit, 
              correlation=corCompSymm (form=~1|CoupleID),
              data=acipair)
  expect_output(smallsummary(apimi), "Correlation")})



