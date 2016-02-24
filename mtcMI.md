# NOAC network meta-analysis: MI
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("MI")
```

Tidy up the data.


```r
D <- tidyData(D)
write.csv(D, file="mtcMIData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 24 11:55:29 2016 -->
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
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 126 </td> <td align="right"> 7082 </td> </tr>
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
<!-- Wed Feb 24 11:55:46 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.42, 0.99) </td> <td> 0.62 (0.41, 0.96) </td> <td> 0.73 (0.51, 1.05) </td> <td> 0.93 (0.64, 1.35) </td> <td> 0.23 (0.01, 2.06) </td> <td> 1.11 (0.75, 1.64) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.57 (1.01, 2.41) </td> <td>  </td> <td> 0.97 (0.72, 1.32) </td> <td> 1.14 (0.78, 1.69) </td> <td> 1.46 (0.98, 2.18) </td> <td> 0.35 (0.01, 3.35) </td> <td> 1.74 (1.14, 2.65) </td> <td> 1.37 (1.00, 1.91) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.04, 2.47) </td> <td> 1.03 (0.76, 1.38) </td> <td>  </td> <td> 1.18 (0.79, 1.73) </td> <td> 1.50 (1.00, 2.23) </td> <td> 0.36 (0.01, 3.43) </td> <td> 1.79 (1.17, 2.70) </td> <td> 1.41 (1.02, 1.94) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.95, 1.96) </td> <td> 0.88 (0.59, 1.29) </td> <td> 0.85 (0.58, 1.27) </td> <td>  </td> <td> 1.28 (1.02, 1.61) </td> <td> 0.31 (0.01, 2.87) </td> <td> 1.52 (1.08, 2.16) </td> <td> 1.20 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.07 (0.74, 1.57) </td> <td> 0.69 (0.46, 1.02) </td> <td> 0.67 (0.45, 1.00) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 0.24 (0.01, 2.28) </td> <td> 1.19 (0.84, 1.70) </td> <td> 0.94 (0.75, 1.20) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 4.42 (0.49, 123.88) </td> <td> 2.83 (0.30, 79.40) </td> <td> 2.76 (0.29, 76.36) </td> <td> 3.24 (0.35, 89.93) </td> <td> 4.14 (0.44, 115.60) </td> <td>  </td> <td> 4.89 (0.53, 137.48) </td> <td> 3.90 (0.42, 108.67) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.90 (0.61, 1.33) </td> <td> 0.57 (0.38, 0.88) </td> <td> 0.56 (0.37, 0.86) </td> <td> 0.66 (0.46, 0.93) </td> <td> 0.84 (0.59, 1.19) </td> <td> 0.20 (0.01, 1.89) </td> <td>  </td> <td> 0.79 (0.60, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.52) </td> <td> 0.73 (0.52, 1.00) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.83 (0.66, 1.04) </td> <td> 1.06 (0.83, 1.34) </td> <td> 0.26 (0.01, 2.37) </td> <td> 1.26 (0.97, 1.66) </td> <td>  </td> </tr>
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
##                                  Mean     SD Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.12928 0.1448 0.001448       0.001493
## d.Warfarin.Dabigatran_110_mg  0.31960 0.1664 0.001664       0.001920
## d.Warfarin.Dabigatran_150_mg  0.34386 0.1653 0.001653       0.001715
## d.Warfarin.Edoxaban_30_mg     0.18625 0.1148 0.001148       0.001306
## d.Warfarin.Edoxaban_60_mg    -0.05889 0.1223 0.001223       0.001270
## d.Warfarin.Rivaroxaban_15_mg  1.48710 1.3907 0.013907       0.013879
## d.Warfarin.Rivaroxaban_20_mg -0.23469 0.1352 0.001352       0.001425
## 
## 2. Quantiles for each variable:
## 
##                                    2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.4155057 -0.2264 -0.12986 -0.03252 0.15402
## d.Warfarin.Dabigatran_110_mg -0.0001713  0.2070  0.31690  0.43221 0.64707
## d.Warfarin.Dabigatran_150_mg  0.0210779  0.2329  0.34502  0.45465 0.66408
## d.Warfarin.Edoxaban_30_mg    -0.0389017  0.1098  0.18466  0.26498 0.41018
## d.Warfarin.Edoxaban_60_mg    -0.2927280 -0.1412 -0.05977  0.02219 0.18293
## d.Warfarin.Rivaroxaban_15_mg -0.8613804  0.5319  1.36111  2.26232 4.68830
## d.Warfarin.Rivaroxaban_20_mg -0.5054032 -0.3250 -0.23433 -0.14278 0.02879
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.33446 12.16056 24.49502 
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
