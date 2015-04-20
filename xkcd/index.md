Finding structure in xkcd comics with Latent Dirichlet Allocation
========================================================
author: Carson Sievert
date: December 10th, 2013
transition: rotate

What is xkcd?
========================================================
title:false

* __xkcd__ is self-proclaimed as a "a webcomic of romance, sarcasm, math, and language".

<div align="center">
  <img src="sports.png" width="600" height="600">
</div>

Each comic is a mixture of topics
========================================================
incremental:true

<div align="center">
  <img src="sports copy.png" width="700" height="800">
</div>

***

* "a", "of", and "to" are viewed as noninformative and are removed.
* This document's content is:
  * 4/17 math
  * 5/17 <font color="red">romance</font>
  * 5/17 <font color="blue">sarcasm</font>
  * 3/17 <font color="green">language</font>
* Each document has a unique pmf over all topics.
* Each topic has a unique pmf over all words.

Latent Dirichlet Allocation (LDA)
========================================================
incremental:true

Let $w_i$ denote the $i^{th}$ token where $i \in \{1, \dots, N\}$. For a fixed vocab $v \in \{1, \dots, V\}$ and number of topics $T$:

$P(w_i = v) = \sum_{j=1}^T P(w_i = v | z_i = j)P(z_i = j)$

* Let $\phi_i^{(j)} = P(w_i = v | z_i = j)$ and $\Phi$ the $V$ by $T$ matrix.
* For a given document $d_i \in \{1, \dots, D\}$), let $\theta_j^{(d_i)} = P(z_i = j)$ and $\Theta$ the $T$ by $D$ matrix.
* Assign (you guessed it) Dirichlet priors to both $\phi$ and $\theta$.
* With symmetric hyperparameters, we may integrate out $\phi$ and $\theta$ and use collapsed Gibbs to obtain samples from the target $p(\textbf{z}|\textbf{w}, T)$ and construct $\hat{\phi}$, $\hat{\theta}$.

Choosing # of Topics
========================================================
incremental:true

* Given the hyperparameters, one can find an "optimal" number of topics via Bayesian model selection:
$$
\max_T\{ p(T| \textbf{w}) \} = \max_T\{ p(\textbf{w}|T)p(T) \}
$$

* Using a uniform prior for $p(T)$ we have $\max_T p(\textbf{w}|T)$
* <font color="red">Problem:</font> Computing $p(\textbf{w}|T)$ requires summing over all possible assignments of words to topics (often infeasible).
* Griffiths & Steyvers ([2004](http://psiexp.ss.uci.edu/research/papers/sciencetopics.pdf)) approximate $p(\textbf{w}|T)$ via:
$$
p(w|T) \approx (\frac{1}{M} \sum^M_{m=1} p(\textbf{w} | \textbf{z}_m, T)^{-1})^{-1}
$$
where $\textbf{z}_m$ is the $m^{th}$ sample from the posterior $p(\textbf{z} | \textbf{w}, T)$


Likelihood as a function of T
========================================================

<div align="center">
  <img src="log-like.png" width="1000" height="600">
</div>


raw
========================================================
title:false

<div align="center">
  <img src="raw.png" width="1000" height="700">
</div>


prop1
========================================================
title:false

<div align="center">
  <img src="prop1.png" width="1000" height="700">
</div>

prop2
========================================================
title:false

<div align="center">
  <img src="prop2.png" width="1000" height="700">
</div>

prop3
========================================================
title:false

<div align="center">
  <img src="prop3.png" width="1000" height="700">
</div>

Interpreting topics
========================================================

* I need another 30 minutes to really do this justice...bear with me!

* Let's [look at](http://glimmer.rstudio.com/cpsievert/xkcd/) the most "relevant" keywords for topic 6. 

* Just in case...


```r
library(shiny)
runApp(system.file("shiny", "hover", package="LDAviz"))
```

