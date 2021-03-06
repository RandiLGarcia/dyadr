% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphMod.R
\name{graphMod}
\alias{graphMod}
\title{Graph a Moderation Effect}
\usage{
graphMod(
  data,
  x,
  y,
  mod,
  highMod,
  lowMod,
  int,
  slp,
  hlab = "High",
  llab = "Low"
)
}
\arguments{
\item{data}{the data.}

\item{x}{the x variable given as data$x.}

\item{y}{the y variable given as data$y.}

\item{mod}{the moderator given as data$mod.}

\item{highMod}{the model ran with HIGH_mod (can be gls or lme objects).}

\item{lowMod}{the model ran with LOW_mod (can be gls or lme objects).}

\item{int}{coefficient position of the y-intercept.}

\item{slp}{coefficient position of the slope of x.}

\item{hlab}{text label for "high" level of moderator.}

\item{llab}{text label for "low" level of moderator.}
}
\description{
Graph a Moderation Effect
}
\details{
This is function only works for numerical-numerical interactions. It returns a ggplot object.
}
