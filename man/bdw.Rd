\name{bdw}
\alias{bdw}
%- Also NEEDS an '\alias' for EACH other topic documented here.
\title{
  Bayesian parameter estimation for discrete Weibull regression
}
\description{
  Bayesian estimation of the parameters for discrete Weibull regression. The conditional distribution of the response given the predictors is assumed to be DW with parameters q and beta dependent on the predictors.
}
\usage{
bdw(data, formula = NA, reg.q = FALSE, reg.b = FALSE,
  logit = TRUE, initial = c(.5,.5), iteration = 25000,
  v.scale = 0.1,RJ = FALSE,  dist.q = imp.d, dist.b = imp.d,
  q.par = c(0, 0), b.par = c(0, 0), penalized = FALSE,
  dist.l = imp.d, l.par = c(0, 0), bi.period = 0.25, cov = 1,
  sampling = c("bin"), est = Mode, fixed.l = -1,jeffrey = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
    A data frame containing the variables in the model. If not found in data, the variables are taken from the environment (formula).
}
  \item{formula}{
    An object of class "formula". A symbolic description of the model to be fitted.
}
  \item{reg.q}{
  Logical flag. If TRUE, the model includes a dependency of q on the predictors x, as explained in 'logit' argument.
}
  \item{reg.b}{
  Logical flag. If TRUE, the model includes a dependency of beta on the predictors x, given by:\cr\cr

  \deqn{log(\beta)= \gamma_0+\gamma_1X_1+\ldots+\gamma_pX_p.} \cr
If FALSE, beta(x) is constant.
}
  \item{logit}{
    Logical flag. If TRUE, the model includes a dependency of q on predictors via a logit transformation as explained below.       \cr\cr
    The conditional distribution of Y (response) given x (predictors) is assumed a DW(q(x),beta(x)).    \cr\cr
    If logit=TRUE & (reg.q=TRUE)
    \deqn{log(q/(1-q))=\theta_0+\theta_1 X_1+\ldots+\theta_pX_p.}    \cr\cr
    If logit=FALSE & (reg.q=TRUE)
    \deqn{log(-log(q))=\theta_0+\theta_1 X_1+\ldots+\theta_pX_p.}
}
  \item{initial}{
Vector of initial values for parameters. In all cases DW(q,B), DW(regQ,B), DW(q,rebB) and DW(regQ,regB) the first parameters correspond to q or corresponding regression coefficients and next is beta or corresponding regression coefficients. If penalized=TRUE then an extra value must be added for tuning parameter.
}
  \item{iteration}{
  Number of MCMC iterations.
}
  \item{v.scale}{
  The scale of the proposal function. Setting to lower values results in an increase in the acceptance rate of the sampler.
}
  \item{RJ}{
  Logical flag. If TRUE, Reversible-Jump sampling is used to draw samples from the posterior. Otherwise, a Metropolis-Hastings sampler applies.
}
  \item{dist.q}{
  Density function. Prior density for theta. If not set, an improper prior applies. Any two parameter density function is allowed, e.g. dnorm, dlaplace, dunif etc. Any customized density function must support log=TRUE flag.
}
  \item{dist.b}{
  Density function. Prior density for gamma. If not set, an improper prior applies. Any two parameter density function is allowed, e.g. dnorm, dlaplace, dunif etc. Any customized density function must support log=TRUE flag.
}
  \item{q.par}{
  A vector of length  two corresponding to the parameters of 'dist.q'. The default is set to c(0,0).
}
  \item{b.par}{
  A vector of length  two corresponding to the parameters of 'dist.b'. The default is set to c(0,0).
}
  \item{penalized}{
  logical flag. If TRUE, an hyper-parameter inducing shrinkage is considered. In this case, prior must be set to an informative prior, e.g. Gaussian, Laplace. See also 'l.par' and 'dist.l' below.
}
  \item{dist.l}{
    Density function. Hyper prior for penalty term. If not set, an improper prior is used. Any non-negative two parameter density function is allowed, e.g.  dgamma, dbeta,... Any customized density function must support log=TRUE flag.
}
  \item{l.par}{
   A vector of length  two corresponding to the parameters of the hyper-prior 'dist.l'. The default is set to c(0,0).
}
  \item{bi.period}{
  A numeric value in (0,1) indicating the burn-in period of the MCMC chain. The default is set to 0.25 meaning that  25\%  of values remove from the beginning of the output chain. See 'sampling'.
}
  \item{cov}{
  A value in \{1,2,3,4\}. If set to 1 then the adaptive-MH is performed; 2: an independent uniform proposal; 3: an independent Laplace proposal and 4: an independent Gaussian proposal. The default is 1. If cov=1 then the scale of the proposal is adapted from the data.
}
  \item{sampling}{
  Choose between independent (indp), systematic (syst) and burn-in (bin). If set to indp then the chain is not ordered! The default is 'bin'. Sampling interval for Systematic sampling is calculated from iteration(1-bi.period). Similarly for indp the number of samples is computed from iteration(1-bi.period).
}
  \item{est}{
  Statistic. The statistic that is used to estimate the parameters from marginal densities. Possible values are: mode, mean, median or any customized univariate measure of location. The default is 'mode'.
}
  \item{fixed.l}{
  A positive number. Set to a positive value corresponding to a parameter that does not need estimation. Set to any negative value to disable this option.
}
  \item{jeffrey}{
  A logical flag. Set to a TRUE to use Jeffrey prior. Notice that MCMC based on Jeffrey can take considerably long time and the results in the most cases are worse than using an improper flat (=1) prior.
}

%%\item{\dots}{
%%
%%  }
}
%%\details{

%%}
\value{
    \item{res}{Estimation of the parameters from marginal densities using the statistic specified in 'est'.}
    \item{chain}{A list of values including sampler configurations.}
    \item{chain}{Including estimation of marginal densities}
    \item{acceptance.rate}{Acceptance rate of sampler}
    \item{RejAccChain}{A zero-one vector reporting rejection (0) and acceptance (1) of the samples}
    \item{error}{Total number of errors during the sampling procedure}
    \item{minf}{Minimum loglikelihood among all iterations}
    \item{minState}{Coefficients corresponding to minimum loglikelihood}
    \item{lb}{The number of gamma parameters}
    \item{lq}{The number of theta parameters}
    \item{model.chain}{If RJ=TRUE then this chain contains acceptance (+values) and rejection (-values) of models}
    \item{duration}{Time elapsed until completion of the sampling procedure}
}
\references{
Haselimashhadi, Vinciotti and Yu (2015), A new Bayesian regression model for counts in medicine.
}
\author{
Hamed Haselimashhadi <hamedhaseli@gmail.com>
}
%%\note{
%%  ~~further notes~~
%%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{plot.bdw}},
\code{\link{summary.bdw}},
\code{\link{bdw.mc}}
}
\examples{
set.seed(123)
#========== example 1 - estimating DW parameters under logit transformation ==========
q = .41    # <<< true parameters
b = 1.1    # <<< true parameters
y = BDWreg:::rdw(n = 200,q = q,beta = b) #<<< generating data
result  = bdw(data = y, v.scale = .10,initial = c(.5,.5),iteration = 8000 )
plot(result)
summary(result)


\dontrun{
  #==== example 2 - estimating logit-DW(regQ,beta) parameters using RJ ======
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
  result2 = bdw(data = data              ,
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
  plot(result2)
  summary(result2)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ Discrete Weibull regression}
\keyword{ Reversible-Jumps }
\keyword{ Metropolise-Hasings}
