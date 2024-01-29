\name{plot.bdw}
\alias{plot.bdw}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot a MCMC object of class 'bdw'
}
\description{
This function generates several diagnostics plots from a MCMC object of class 'bdw'
}
\usage{
\method{plot}{bdw}(x, est = Mode, prob = 0.95, adj = 2, r.outliers = TRUE,
density = FALSE, exc.tun = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    The object containing the MCMC results of class 'bdw'.
}
  \item{est}{The statistic that is used to estimate parameters from marginal densities. The default is 'mode'.
}
  \item{prob}{
   A numerical value in (0 , 1). Corresponding probability for Highest Posterior Density (HPD) interval.
}
  \item{adj}{
   A positive value. Measure of smoothness for densities. A higher value results in smoother density plots.
}
  \item{r.outliers}{
   Logical flag. If TRUE, a preprocessing procedure removes the outliers before showing the results.
}
  \item{density}{
  Logical flag. If TRUE, a density plot accompanies the HPD intervals.
}
  \item{exc.tun}{
  Logical flag. If TRUE and penalized=TRUE, the penalty parameter is excluded from the plots.
}
\item{\dots}{
  Other parameters that can be passed to standard plot() function.
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
\code{\link{summary.bdw}},
\code{\link{bdw.mc}}
}
\examples{
example(bdw)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ Reversible Jumps plot}% __ONLY ONE__ keyword
%\keyword{ Metropolise-Hasings plot}
\keyword{ HPD interval}
