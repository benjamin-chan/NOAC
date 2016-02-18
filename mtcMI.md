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
<!-- Thu Feb 18 10:47:49 2016 -->
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
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 113 </td> <td align="right"> 7082 </td> </tr>
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
<!-- Thu Feb 18 10:48:05 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 0.98) </td> <td> 0.62 (0.41, 0.96) </td> <td> 0.73 (0.51, 1.04) </td> <td> 0.93 (0.64, 1.34) </td> <td> 0.23 (0.01, 2.06) </td> <td> 0.99 (0.66, 1.46) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.56 (1.02, 2.41) </td> <td>  </td> <td> 0.98 (0.72, 1.31) </td> <td> 1.14 (0.76, 1.70) </td> <td> 1.46 (0.97, 2.19) </td> <td> 0.36 (0.01, 3.22) </td> <td> 1.56 (1.02, 2.38) </td> <td> 1.38 (0.99, 1.90) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.04, 2.47) </td> <td> 1.02 (0.76, 1.39) </td> <td>  </td> <td> 1.17 (0.78, 1.73) </td> <td> 1.50 (0.99, 2.23) </td> <td> 0.37 (0.01, 3.38) </td> <td> 1.59 (1.04, 2.44) </td> <td> 1.41 (1.02, 1.95) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.96, 1.98) </td> <td> 0.88 (0.59, 1.32) </td> <td> 0.85 (0.58, 1.28) </td> <td>  </td> <td> 1.28 (1.02, 1.60) </td> <td> 0.32 (0.01, 2.88) </td> <td> 1.36 (0.96, 1.94) </td> <td> 1.21 (0.96, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.07 (0.75, 1.56) </td> <td> 0.68 (0.46, 1.03) </td> <td> 0.67 (0.45, 1.01) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 0.25 (0.01, 2.25) </td> <td> 1.06 (0.74, 1.53) </td> <td> 0.94 (0.74, 1.20) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 4.37 (0.49, 123.01) </td> <td> 2.78 (0.31, 77.06) </td> <td> 2.70 (0.30, 75.17) </td> <td> 3.15 (0.35, 88.67) </td> <td> 4.05 (0.44, 114.46) </td> <td>  </td> <td> 4.32 (0.48, 117.89) </td> <td> 3.84 (0.44, 104.07) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.01 (0.68, 1.50) </td> <td> 0.64 (0.42, 0.98) </td> <td> 0.63 (0.41, 0.96) </td> <td> 0.73 (0.51, 1.04) </td> <td> 0.94 (0.66, 1.34) </td> <td> 0.23 (0.01, 2.06) </td> <td>  </td> <td> 0.89 (0.68, 1.16) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.52) </td> <td> 0.73 (0.53, 1.01) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.83 (0.66, 1.05) </td> <td> 1.06 (0.84, 1.34) </td> <td> 0.26 (0.01, 2.28) </td> <td> 1.13 (0.86, 1.48) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.12885 0.1454 0.001454       0.001481
## d.Warfarin.Dabigatran_110_mg  0.31966 0.1667 0.001667       0.001894
## d.Warfarin.Dabigatran_150_mg  0.34363 0.1667 0.001667       0.001755
## d.Warfarin.Edoxaban_30_mg     0.18835 0.1158 0.001158       0.001250
## d.Warfarin.Edoxaban_60_mg    -0.05809 0.1210 0.001210       0.001210
## d.Warfarin.Rivaroxaban_15_mg  1.48697 1.4004 0.014004       0.013870
## d.Warfarin.Rivaroxaban_20_mg -0.12008 0.1381 0.001381       0.001445
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%  97.5%
## d.Warfarin.Apixaban_5_mg     -0.418105 -0.2252 -0.12739 -0.03129 0.1552
## d.Warfarin.Dabigatran_110_mg -0.008752  0.2081  0.31859  0.43247 0.6401
## d.Warfarin.Dabigatran_150_mg  0.018477  0.2309  0.34379  0.45470 0.6676
## d.Warfarin.Edoxaban_30_mg    -0.044049  0.1112  0.18736  0.26721 0.4132
## d.Warfarin.Edoxaban_60_mg    -0.295776 -0.1392 -0.05861  0.02293 0.1786
## d.Warfarin.Rivaroxaban_15_mg -0.824447  0.5277  1.34653  2.29181 4.6451
## d.Warfarin.Rivaroxaban_20_mg -0.392253 -0.2149 -0.11950 -0.02524 0.1476
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.35509 12.17475 24.52984 
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
