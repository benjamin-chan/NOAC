# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 15:38:46 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 86 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 89 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 63 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 90 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 102 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 101 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 126 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 169 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 133 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 141 </td> <td align="right"> 7036 </td> </tr>
   </table>

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
<!-- Thu Feb 04 15:38:59 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.42, 0.98) </td> <td> 0.63 (0.41, 0.97) </td> <td> 0.73 (0.50, 1.05) </td> <td> 0.93 (0.64, 1.36) </td> <td> 1.10 (0.74, 1.61) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.56 (1.02, 2.41) </td> <td>  </td> <td> 0.98 (0.72, 1.31) </td> <td> 1.14 (0.77, 1.70) </td> <td> 1.46 (0.98, 2.18) </td> <td> 1.71 (1.13, 2.62) </td> <td> 1.37 (1.00, 1.90) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.03, 2.46) </td> <td> 1.02 (0.76, 1.38) </td> <td>  </td> <td> 1.16 (0.79, 1.74) </td> <td> 1.49 (0.99, 2.24) </td> <td> 1.75 (1.16, 2.67) </td> <td> 1.40 (1.02, 1.94) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.95, 1.98) </td> <td> 0.88 (0.59, 1.30) </td> <td> 0.86 (0.58, 1.27) </td> <td>  </td> <td> 1.28 (1.02, 1.62) </td> <td> 1.50 (1.06, 2.15) </td> <td> 1.21 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.08 (0.74, 1.56) </td> <td> 0.69 (0.46, 1.02) </td> <td> 0.67 (0.45, 1.01) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 1.18 (0.82, 1.69) </td> <td> 0.94 (0.74, 1.20) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.91 (0.62, 1.36) </td> <td> 0.58 (0.38, 0.88) </td> <td> 0.57 (0.37, 0.86) </td> <td> 0.66 (0.47, 0.95) </td> <td> 0.85 (0.59, 1.21) </td> <td>  </td> <td> 0.80 (0.61, 1.05) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.85, 1.52) </td> <td> 0.73 (0.53, 1.00) </td> <td> 0.71 (0.52, 0.98) </td> <td> 0.83 (0.66, 1.04) </td> <td> 1.06 (0.83, 1.34) </td> <td> 1.25 (0.95, 1.64) </td> <td>  </td> </tr>
   </table>

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
##                                 Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.1299 0.1470 0.001470       0.001507
## d.Warfarin.Dabigatran_110_mg  0.3166 0.1644 0.001644       0.001862
## d.Warfarin.Dabigatran_150_mg  0.3404 0.1649 0.001649       0.001694
## d.Warfarin.Edoxaban_30_mg     0.1885 0.1164 0.001164       0.001265
## d.Warfarin.Edoxaban_60_mg    -0.0581 0.1229 0.001229       0.001207
## d.Warfarin.Rivaroxaban_20_mg -0.2218 0.1365 0.001365       0.001441
## 
## 2. Quantiles for each variable:
## 
##                                    2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.4209293 -0.2280 -0.12955 -0.03022 0.15833
## d.Warfarin.Dabigatran_110_mg -0.0009944  0.2063  0.31464  0.42829 0.64108
## d.Warfarin.Dabigatran_150_mg  0.0176289  0.2297  0.33782  0.45236 0.66344
## d.Warfarin.Edoxaban_30_mg    -0.0365510  0.1096  0.18931  0.26676 0.41316
## d.Warfarin.Edoxaban_60_mg    -0.2958229 -0.1411 -0.05974  0.02626 0.18098
## d.Warfarin.Rivaroxaban_20_mg -0.4936262 -0.3139 -0.22128 -0.12964 0.04643
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.06943 10.06601 20.13544 
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
## 1     Apixaban_5_mg          Warfarin      NA      NA       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg      NA      NA       NA
## 3 Dabigatran_110_mg          Warfarin      NA      NA       NA
## 4 Dabigatran_150_mg          Warfarin      NA      NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg      NA      NA       NA
## 6    Edoxaban_30_mg          Warfarin      NA      NA       NA
## 7    Edoxaban_60_mg          Warfarin      NA      NA       NA
## 8 Rivaroxaban_20_mg          Warfarin      NA      NA       NA
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

![](mtcMI_files/figure-html/anohe-3.png) ![](mtcMI_files/figure-html/anohe-4.png) ![](mtcMI_files/figure-html/anohe-5.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/anohe-6.png) ![](mtcMI_files/figure-html/anohe-7.png) 
