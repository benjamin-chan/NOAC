# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 14:53:25 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 86 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 89 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 63 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 90 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 102 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 101 </td> <td align="right"> 7131 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 126 </td> <td align="right"> 7133 </td> </tr>
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
<!-- Thu Feb 04 14:53:40 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 0.98) </td> <td> 0.62 (0.40, 0.96) </td> <td> 0.73 (0.51, 1.04) </td> <td> 0.93 (0.65, 1.35) </td> <td> 1.10 (0.75, 1.62) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.57 (1.02, 2.43) </td> <td>  </td> <td> 0.98 (0.72, 1.33) </td> <td> 1.14 (0.77, 1.70) </td> <td> 1.46 (0.97, 2.18) </td> <td> 1.71 (1.14, 2.61) </td> <td> 1.37 (1.00, 1.91) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.04, 2.47) </td> <td> 1.02 (0.75, 1.39) </td> <td>  </td> <td> 1.17 (0.79, 1.74) </td> <td> 1.50 (1.00, 2.23) </td> <td> 1.76 (1.16, 2.67) </td> <td> 1.41 (1.02, 1.95) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.96, 1.96) </td> <td> 0.88 (0.59, 1.30) </td> <td> 0.86 (0.57, 1.27) </td> <td>  </td> <td> 1.28 (1.02, 1.62) </td> <td> 1.50 (1.06, 2.15) </td> <td> 1.20 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.08 (0.74, 1.54) </td> <td> 0.68 (0.46, 1.03) </td> <td> 0.67 (0.45, 1.00) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 1.18 (0.83, 1.68) </td> <td> 0.94 (0.74, 1.19) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.91 (0.62, 1.34) </td> <td> 0.58 (0.38, 0.88) </td> <td> 0.57 (0.37, 0.86) </td> <td> 0.66 (0.47, 0.95) </td> <td> 0.85 (0.60, 1.21) </td> <td>  </td> <td> 0.80 (0.61, 1.04) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.51) </td> <td> 0.73 (0.52, 1.00) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.83 (0.66, 1.04) </td> <td> 1.06 (0.84, 1.35) </td> <td> 1.25 (0.96, 1.63) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.13131 0.1443 0.001443       0.001516
## d.Warfarin.Dabigatran_110_mg  0.31899 0.1663 0.001663       0.001908
## d.Warfarin.Dabigatran_150_mg  0.34144 0.1660 0.001660       0.001745
## d.Warfarin.Edoxaban_30_mg     0.18560 0.1148 0.001148       0.001260
## d.Warfarin.Edoxaban_60_mg    -0.06061 0.1219 0.001219       0.001249
## d.Warfarin.Rivaroxaban_20_mg -0.22425 0.1354 0.001354       0.001367
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.409882 -0.2293 -0.13304 -0.03403 0.15350
## d.Warfarin.Dabigatran_110_mg -0.002855  0.2070  0.31715  0.43031 0.64971
## d.Warfarin.Dabigatran_150_mg  0.018028  0.2308  0.34226  0.45100 0.66561
## d.Warfarin.Edoxaban_30_mg    -0.040203  0.1082  0.18573  0.26242 0.40970
## d.Warfarin.Edoxaban_60_mg    -0.297090 -0.1448 -0.06121  0.02177 0.17506
## d.Warfarin.Rivaroxaban_20_mg -0.486354 -0.3153 -0.22411 -0.13224 0.03788
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.951751  9.950205 19.901956 
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
