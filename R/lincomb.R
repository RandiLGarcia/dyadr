#' @name lincomb
#' @title Tests of contrasts
#'
#For indistinguishable dyads,
#Gives the sum, difference and average of the Actor/Partner coefficients, 
#For distinguishable dyads,
#Provides the same output for members of the dyad separately.
# Standard errors and P-values of the same in a neat matrix
#'
#Improvements over original lincomb: 
#1 Removed requirement of numbers in function call for mapping to coefficients.
#2 Improved output with Sum, Diff and Avg in the same output in a neat matrix with appropriate headers.
#3 Added functionality of distinguishable dyads in the same.


#Example call - lincomb(Model,"dist") for distinguishable model.
#Example call - lincomb(Model,"indist") for indistinguishable model.


function (outp, dyad=c("dist","indist")) 

{
if (dyad == "indist") {
outp = summary(outp)
vsum = c(1,1,1)
vdiff=c(1,1,1)
vavg=c(1,1,1)

if(names(outp$coefficients)[1]=="(Intercept)"){
v1=2
v2=3
}
if(!names(outp$coefficients)[1]=="(Intercept)"){
v1=1
v2=2
}

    if (class(outp)[2] == "gls") {
        c1 = as.numeric(outp$coefficients[v1])
        c2 = as.numeric(outp$coefficients[v2])
        cccov = outp$varBeta[v2, v1]
    }
    if (class(outp)[2] == "lme") {
        c1 = as.numeric(outp$coefficients$fixed[v1])
        c2 = as.numeric(outp$coefficients$fixed[v2])
        cccov = outp$varFix[v2, v1]
    }
    c1se = outp$tTable[v1, 2]
    c2se = outp$tTable[v2, 2]

        vavg[1] = (c1 + c2)/2
 
        vsum[1] = c1 + c2
    
        vdiff[1] = c1 - c2
    
        vavg[2] = (c1se^2 + c2se^2 + 2 * cccov)/4

        vsum[2] = c1se^2 + c2se^2 + 2 * cccov
 
        vdiff[2] = c1se^2 + c2se^2 - 2 * cccov

	vavg [2] = sqrt(vavg[2])
	vsum[2] = sqrt(vsum[2])
	vdiff[2] = sqrt(vdiff[2])

	vavg[3] = 2 - 2 * pnorm(abs(vavg[1]/vavg[2]))
	vsum[3] = 2 - 2 * pnorm(abs(vsum[1]/vsum[2]))
	vdiff[3] = 2 - 2 * pnorm(abs(vdiff[1]/vdiff[2]))


	Output<-matrix(c(vsum,vdiff,vavg),nrow=3,ncol=3,byrow=TRUE)
	colnames (Output)=c("Coefficient","Std.Error","P-value")
	rownames(Output)=c("Sum of effects","Difference of effects","Average of effects")
	return(Output)

	}

if (dyad == "dist") {
require(abind)
outp = summary(outp)
vsumD1 = c(1,1,1)
vdiffD1=c(1,1,1)
vavgD1=c(1,1,1)

vsumD2 = c(1,1,1)
vdiffD2=c(1,1,1)
vavgD2=c(1,1,1)


D1 = as.character(names(outp$coefficients))[1]
D2 = as.character(names(outp$coefficients))[2]
NULLColD1<-c(D1,D1,D1)
NULLColD2<-c(D2,D2,D2)

P=as.character(grepl(D1,names(outp$coefficients)[3:6],fixed=TRUE))
if(P[1]=="TRUE" &P[3]=="TRUE"){
D11=3
D12=5
D21=4
D22=6}
if(P[1]=="TRUE" &P[2]=="TRUE"){
D11=3
D12=4
D21=5
D22=6}
if(P[1]=="TRUE" &P[4]=="TRUE"){
D11=3
D12=6
D21=4
D22=5}
  if (class(outp)[2] == "gls") {
        c11 = as.numeric(outp$coefficients[D11])
        c12 = as.numeric(outp$coefficients[D12])
	  c21 = as.numeric(outp$coefficients[D21])
        c22 = as.numeric(outp$coefficients[D22])

        cccov1 = outp$varBeta[D12, D11]
	  cccov2 = outp$varBeta[D22, D21]
    }
    if (class(outp)[2] == "lme") {
        c11 = as.numeric(outp$coefficients$fixed[D11])
        c12 = as.numeric(outp$coefficients$fixed[D12])
	  c21 = as.numeric(outp$coefficients$fixed[D21])
        c22 = as.numeric(outp$coefficients$fixed[D22])

        cccov1 = outp$varFix[D12, D11]
	  cccov2 = outp$varFix[D22, D21]

    }


	  c11se = outp$tTable[D11, 2]
    	  c12se = outp$tTable[D12, 2]
	  c21se = outp$tTable[D21, 2]
    	  c22se = outp$tTable[D22, 2]

	  vavgD1[1] = (c11 + c12)/2
 
        vsumD1[1] = c11 + c12
    
        vdiffD1[1] = c11 - c12

	  vavgD2[1] = (c21 + c22)/2
 
        vsumD2[1] = c21 + c22
    
        vdiffD2[1] = c21 - c22

	  vavgD1[2] = (c11se^2 + c12se^2 + 2 * cccov1)/4

        vsumD1[2] = c11se^2 + c12se^2 + 2 * cccov1
 
        vdiffD1[2] = c11se^2 + c12se^2 - 2 * cccov1
	  
	  vavgD2[2] = (c21se^2 + c22se^2 + 2 * cccov2)/4

        vsumD2[2] = c21se^2 + c22se^2 + 2 * cccov2
 
        vdiffD2[2] = c21se^2 + c22se^2 - 2 * cccov2

	  vavgD1 [2] = sqrt(vavgD1[2])
	  vsumD1[2] = sqrt(vsumD1[2])
	  vdiffD1[2] = sqrt(vdiffD1[2])
	  vavgD2 [2] = sqrt(vavgD2[2])
	  vsumD2[2] = sqrt(vsumD2[2])
	  vdiffD2[2] = sqrt(vdiffD2[2])

	  vavgD1[3] = 2 - 2 * pnorm(abs(vavgD1[1]/vavgD1[2]))
	  vsumD1[3] = 2 - 2 * pnorm(abs(vsumD1[1]/vsumD1[2]))
	  vdiffD1[3] = 2 - 2 * pnorm(abs(vdiffD1[1]/vdiffD1[2]))
	  vavgD2[3] = 2 - 2 * pnorm(abs(vavgD2[1]/vavgD2[2]))
	  vsumD2[3] = 2 - 2 * pnorm(abs(vsumD2[1]/vsumD2[2]))
	  vdiffD2[3] = 2 - 2 * pnorm(abs(vdiffD2[1]/vdiffD2[2]))
	

	OutputD1<-matrix(c(vsumD1,vdiffD1,vavgD1),nrow=3,ncol=3,byrow=TRUE)
	colnames (OutputD1)=c("Coefficient","Std.Error","P-value")
	rownames(OutputD1)=c("Sum of effects","Difference of effects","Average of effects")
	
	OutputD2<-matrix(c(vsumD1,vdiffD1,vavgD1),nrow=3,ncol=3,byrow=TRUE)
	colnames (OutputD2)=c("Coefficient","Std.Error","P-value")
	rownames(OutputD2)=c("Sum of effects","Difference of effects","Average of effects")
	
	return(list(D1,OutputD1,D2,OutputD2))

	}


}
