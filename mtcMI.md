# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("MI")
```

Tidy up the data and bias the warfarin arm of ROCKET-AF to be similar to the Rivaroxaban arm.


```r
D <- tidyData(D)
D <- biasROCKETAF()
write.csv(D, file="mtcMIData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 17 22:09:09 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 90 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 102 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 169 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 133 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 141 </td> <td align="right"> 7036 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Rivaroxaban_15_mg </td> <td align="right"> 3 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Warfarin </td> <td align="right"> 1 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 86 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 89 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 63 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 100 </td> <td align="right"> 7061 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 100 </td> <td align="right"> 7082 </td> </tr>
   </table>

```r
network <- mtc.network(D)
```

Run the model using fixed-effects.



```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMI_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcMIOddsRatios.csv](mtcMIOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcMIOddsRatios.csv", row.names=FALSE)
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 17 22:09:23 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 0.99) </td> <td> 0.62 (0.40, 0.96) </td> <td> 0.73 (0.50, 1.04) </td> <td> 0.93 (0.64, 1.35) </td> <td> 0.22 (0.01, 2.17) </td> <td> 0.88 (0.59, 1.32) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.57 (1.01, 2.43) </td> <td>  </td> <td> 0.97 (0.72, 1.31) </td> <td> 1.14 (0.77, 1.68) </td> <td> 1.45 (0.97, 2.16) </td> <td> 0.35 (0.01, 3.37) </td> <td> 1.37 (0.88, 2.09) </td> <td> 1.37 (0.99, 1.90) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.04, 2.47) </td> <td> 1.03 (0.76, 1.38) </td> <td>  </td> <td> 1.17 (0.79, 1.73) </td> <td> 1.50 (1.00, 2.24) </td> <td> 0.36 (0.01, 3.52) </td> <td> 1.40 (0.91, 2.15) </td> <td> 1.41 (1.02, 1.94) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.96, 1.99) </td> <td> 0.88 (0.59, 1.30) </td> <td> 0.86 (0.58, 1.27) </td> <td>  </td> <td> 1.28 (1.01, 1.61) </td> <td> 0.31 (0.01, 2.95) </td> <td> 1.20 (0.84, 1.72) </td> <td> 1.20 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.07 (0.74, 1.56) </td> <td> 0.69 (0.46, 1.03) </td> <td> 0.67 (0.45, 1.00) </td> <td> 0.78 (0.62, 0.99) </td> <td>  </td> <td> 0.24 (0.01, 2.32) </td> <td> 0.94 (0.65, 1.36) </td> <td> 0.94 (0.75, 1.20) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 4.50 (0.46, 122.54) </td> <td> 2.89 (0.30, 81.13) </td> <td> 2.80 (0.28, 76.76) </td> <td> 3.25 (0.34, 90.86) </td> <td> 4.14 (0.43, 117.93) </td> <td>  </td> <td> 3.91 (0.40, 111.79) </td> <td> 3.92 (0.41, 108.25) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.14 (0.76, 1.70) </td> <td> 0.73 (0.48, 1.13) </td> <td> 0.71 (0.46, 1.09) </td> <td> 0.83 (0.58, 1.19) </td> <td> 1.06 (0.73, 1.55) </td> <td> 0.26 (0.01, 2.48) </td> <td>  </td> <td> 1.00 (0.76, 1.33) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.85, 1.52) </td> <td> 0.73 (0.53, 1.02) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.83 (0.66, 1.04) </td> <td> 1.06 (0.83, 1.34) </td> <td> 0.26 (0.01, 2.42) </td> <td> 1.00 (0.75, 1.32) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcMI_files/figure-html/forest-1.png) ![](mtcMI_files/figure-html/forest-2.png) ![](mtcMI_files/figure-html/forest-3.png) ![](mtcMI_files/figure-html/forest-4.png) ![](mtcMI_files/figure-html/forest-5.png) ![](mtcMI_files/figure-html/forest-6.png) ![](mtcMI_files/figure-html/forest-7.png) 

# Diagnostics



```r
summary(results)
```

```
## $measure
## [1] "Log Odds Ratio"
## 
## $summaries
## 
## Iterations = 5010:30000
## Thinning interval = 10 
## Number of chains = 4 
## Sample size per chain = 2500 
## 
## 1. Empirical mean and standard deviation for each variable,
##    plus standard error of the mean:
## 
##                                   Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.128887 0.1469 0.001469       0.001471
## d.Warfarin.Dabigatran_110_mg  0.317495 0.1672 0.001672       0.002004
## d.Warfarin.Dabigatran_150_mg  0.343653 0.1640 0.001640       0.001740
## d.Warfarin.Edoxaban_30_mg     0.187594 0.1154 0.001154       0.001268
## d.Warfarin.Edoxaban_60_mg    -0.058278 0.1219 0.001219       0.001257
## d.Warfarin.Rivaroxaban_15_mg  1.500934 1.4010 0.014010       0.014448
## d.Warfarin.Rivaroxaban_20_mg  0.003312 0.1438 0.001438       0.001473
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%       50%      75%  97.5%
## d.Warfarin.Apixaban_5_mg     -0.41993 -0.22677 -0.127512 -0.02842 0.1585
## d.Warfarin.Dabigatran_110_mg -0.01489  0.20524  0.316328  0.43238 0.6428
## d.Warfarin.Dabigatran_150_mg  0.02277  0.23485  0.343496  0.45341 0.6638
## d.Warfarin.Edoxaban_30_mg    -0.03696  0.10933  0.186459  0.26499 0.4137
## d.Warfarin.Edoxaban_60_mg    -0.29343 -0.14043 -0.061007  0.02200 0.1822
## d.Warfarin.Rivaroxaban_15_mg -0.88305  0.56154  1.365500  2.28589 4.6844
## d.Warfarin.Rivaroxaban_20_mg -0.27766 -0.09281  0.001397  0.09934 0.2862
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.35407 12.16580 24.51987 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMI_files/figure-html/gelman-1.png) 

```r
gelman.diag(results)
```

```
## Potential scale reduction factors:
## 
##                              Point est. Upper C.I.
## d.Warfarin.Apixaban_5_mg              1          1
## d.Warfarin.Dabigatran_110_mg          1          1
## d.Warfarin.Dabigatran_150_mg          1          1
## d.Warfarin.Edoxaban_30_mg             1          1
## d.Warfarin.Edoxaban_60_mg             1          1
## d.Warfarin.Rivaroxaban_15_mg          1          1
## d.Warfarin.Rivaroxaban_20_mg          1          1
## 
## Multivariate psrf
## 
## 1
```


```r
plot(results)
```

![](mtcMI_files/figure-html/trace-1.png) ![](mtcMI_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcMI_files/figure-html/autocorr-1.png) ![](mtcMI_files/figure-html/autocorr-2.png) ![](mtcMI_files/figure-html/autocorr-3.png) ![](mtcMI_files/figure-html/autocorr-4.png) 

Assess the degree of heterogeneity and inconsistency.


```r
anohe <- mtc.anohe(network, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```


```r
summary(anohe)
```

```
## Analysis of heterogeneity
## =========================
## 
## Per-comparison I-squared:
## -------------------------
## 
##                  t1                t2 i2.pair i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin       0       0       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg      NA      NA       NA
## 3 Dabigatran_110_mg          Warfarin      NA      NA       NA
## 4 Dabigatran_150_mg          Warfarin      NA      NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg      NA      NA       NA
## 6    Edoxaban_30_mg          Warfarin      NA      NA       NA
## 7    Edoxaban_60_mg          Warfarin      NA      NA       NA
## 8 Rivaroxaban_15_mg          Warfarin      NA      NA       NA
## 9 Rivaroxaban_20_mg          Warfarin      NA      NA       NA
## 
## Global I-squared:
## -------------------------
## 
##   i2.pair i2.cons
## 1       0       0
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcMI_files/figure-html/anohe-1.png) ![](mtcMI_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/anohe-3.png) ![](mtcMI_files/figure-html/anohe-4.png) ![](mtcMI_files/figure-html/anohe-5.png) ![](mtcMI_files/figure-html/anohe-6.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/anohe-7.png) ![](mtcMI_files/figure-html/anohe-8.png) 
