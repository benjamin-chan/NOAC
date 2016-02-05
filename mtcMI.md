# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Fri Feb 05 12:55:07 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 86 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 89 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 63 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 90 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 102 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 100 </td> <td align="right"> 7061 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 126 </td> <td align="right"> 7082 </td> </tr>
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
<!-- Fri Feb 05 12:55:19 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 0.97) </td> <td> 0.63 (0.41, 0.96) </td> <td> 0.73 (0.51, 1.05) </td> <td> 0.93 (0.64, 1.36) </td> <td> 1.11 (0.75, 1.63) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.56 (1.03, 2.43) </td> <td>  </td> <td> 0.98 (0.73, 1.32) </td> <td> 1.14 (0.78, 1.71) </td> <td> 1.46 (0.98, 2.18) </td> <td> 1.73 (1.14, 2.64) </td> <td> 1.38 (0.99, 1.91) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.05, 2.46) </td> <td> 1.02 (0.76, 1.37) </td> <td>  </td> <td> 1.17 (0.79, 1.75) </td> <td> 1.49 (1.00, 2.24) </td> <td> 1.77 (1.16, 2.71) </td> <td> 1.40 (1.01, 1.96) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.38 (0.95, 1.96) </td> <td> 0.87 (0.58, 1.29) </td> <td> 0.86 (0.57, 1.27) </td> <td>  </td> <td> 1.28 (1.02, 1.60) </td> <td> 1.52 (1.06, 2.16) </td> <td> 1.20 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.07 (0.74, 1.56) </td> <td> 0.69 (0.46, 1.02) </td> <td> 0.67 (0.45, 1.00) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 1.19 (0.83, 1.70) </td> <td> 0.94 (0.74, 1.19) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.90 (0.61, 1.33) </td> <td> 0.58 (0.38, 0.88) </td> <td> 0.57 (0.37, 0.86) </td> <td> 0.66 (0.46, 0.94) </td> <td> 0.84 (0.59, 1.20) </td> <td>  </td> <td> 0.79 (0.61, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.50) </td> <td> 0.73 (0.52, 1.01) </td> <td> 0.71 (0.51, 0.99) </td> <td> 0.83 (0.66, 1.04) </td> <td> 1.06 (0.84, 1.35) </td> <td> 1.26 (0.97, 1.65) </td> <td>  </td> </tr>
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12878 0.1443 0.001443       0.001507
## d.Warfarin.Dabigatran_110_mg  0.31959 0.1662 0.001662       0.001919
## d.Warfarin.Dabigatran_150_mg  0.34147 0.1666 0.001666       0.001762
## d.Warfarin.Edoxaban_30_mg     0.18608 0.1153 0.001153       0.001257
## d.Warfarin.Edoxaban_60_mg    -0.05909 0.1218 0.001218       0.001248
## d.Warfarin.Rivaroxaban_20_mg -0.23056 0.1360 0.001360       0.001371
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.408554 -0.2262 -0.12889 -0.03147 0.15547
## d.Warfarin.Dabigatran_110_mg -0.005489  0.2080  0.31878  0.43137 0.64755
## d.Warfarin.Dabigatran_150_mg  0.013574  0.2282  0.33984  0.45314 0.67205
## d.Warfarin.Edoxaban_30_mg    -0.039349  0.1076  0.18633  0.26457 0.40947
## d.Warfarin.Edoxaban_60_mg    -0.303067 -0.1408 -0.05873  0.02487 0.17707
## d.Warfarin.Rivaroxaban_20_mg -0.498371 -0.3217 -0.23002 -0.13735 0.03289
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.995676  9.993919 19.989596 
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
