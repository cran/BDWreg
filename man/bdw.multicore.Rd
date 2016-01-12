\name{bdw.mc}
\alias{bdw.mc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Producing several chains from a MCMC object of class 'bdw'
}
\description{
This function is equipped with multicore options to produce several chains from a MCMC of class 'bdw'
}
\usage{
bdw.mc(dw.object, n.repeat = 10, cores = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dw.object}{
 Object of class 'bdw'.
}
  \item{n.repeat}{
  The number of chains to be generated.
}
  \item{cores}{
  The number of processors. If set to zero then the procedure uses all cores.
}
}
%%\details{
%%This is a multicore function that uses all resources on the machine.
%%}
\value{
An object of class 'bdw'. All chains are combined into a list that is stored in an object named 'all'. The output of this function can be passed to plot() and summary().
}
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
\code{\link{summary.bdw}}
}
\examples{
\dontrun{
  #==== multicore example - estimating logit-DW(regQ,B) parameters using RJ and 5 chains ======
  #==== Two variables and four coefficients, including intercepts, are simulated and analysed
  set.seed(1234)
  n = 500
  x1 = runif(n = n, min = 0, max = 1.5)
  x2 = runif(n = n, min = 0, max = 1.5)

  theta0 = .6   #<<< true parameter
  theta1 =  0   #<<< true parameter
  theta2 = .34  #<<< true parameter

  lq = theta0 +  x1*theta1 + x2*theta2

  q = exp(lq - log(1+exp(lq)) )
  beta = 1.5

  y = c()
  for(i in 1:n){
    y[i] = BDWreg:::rdw(1,q = q[i],beta = beta)
  }

  data = data.frame(x1,x2,y) # <<<- data
  result = bdw(data = data              ,
               formula = y~.             ,
               RJ = TRUE                 ,
               initial = rep(.5,4)       ,
               iteration = 25000         ,
               reg.b = FALSE,reg.q = TRUE,
               v.scale = .1              ,
               q.par = c(0,1)            ,
               b.par = c(0,1)            ,
               dist.q = dnorm            ,
               dist.b = dnorm
  )
  result2 = bdw.mc(result,5) # <<<- multicore
  plot(result2)
  summary(result2)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ multicore }
