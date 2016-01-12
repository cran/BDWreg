\name{summary.bdw}
\alias{summary.bdw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summary for a MCMC object of class 'bdw'
}
\description{
This function produces result summaries from a MCMC object of class 'bdw'
}
\usage{
\method{summary}{bdw}(object, est = Mode, prob = 0.95, samp = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
  The object containing the MCMC results of class 'bdw'.
}
  \item{est}{
    The statistic that is used to estimate parameters from marginal densities. The default is 'mode'.
}
  \item{prob}{
   A numerical value in (0 , 1). Corresponding probability for Highest Posterior Density (HPD) interval. If either RJ=TRUE or penalized=TRUE, coefficients are marked as zero if corresponding prob\% HPD intervals contain zero.
}
  \item{samp}{
  Logical flag. If TRUE, analyse a sample instead of whole MCMC chain to save time.\cr
  * enable if object is created by 'bdw.mc' function.
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
  }
}
%%\details{
%%  ~~ If necessary, more details than the description above ~~
%%}
%%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%%}
%%\references{
%% ~put references to the literature/web site here ~
%%}
\author{
Hamed Haselimashhadi <hamedhaseli@gmail.com>
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bdw}},
\code{\link{plot.bdw}},
\code{\link{bdw.mc}}
}
\examples{
example(bdw)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%%\keyword{ BDW  summary}
%%\keyword{ Reversible-Jumps}% __ONLY ONE__ keyword
%%\keyword{ Metropolise-Hasings}

