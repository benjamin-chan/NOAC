# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Fri Feb 05 12:54:21 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 182 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 134 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 199 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 212 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 265 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 269 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 306 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 253 </td> <td align="right"> 7002 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 182 </td> <td align="right"> 7012 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 232 </td> <td align="right"> 7012 </td> </tr>
   </table>

Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcStroke_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcStrokeOddsRatios.csv](mtcStrokeOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcStrokeOddsRatios.csv", row.names=FALSE)
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Fri Feb 05 12:54:34 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.87 (0.66, 1.14) </td> <td> 1.20 (0.90, 1.61) </td> <td> 0.72 (0.56, 0.93) </td> <td> 1.02 (0.78, 1.33) </td> <td> 0.90 (0.70, 1.15) </td> <td> 0.79 (0.66, 0.95) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.15 (0.87, 1.51) </td> <td>  </td> <td> 1.38 (1.11, 1.74) </td> <td> 0.83 (0.63, 1.09) </td> <td> 1.17 (0.88, 1.55) </td> <td> 1.04 (0.80, 1.36) </td> <td> 0.91 (0.74, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.83 (0.62, 1.11) </td> <td> 0.72 (0.57, 0.90) </td> <td>  </td> <td> 0.60 (0.45, 0.80) </td> <td> 0.85 (0.63, 1.14) </td> <td> 0.75 (0.57, 0.99) </td> <td> 0.66 (0.53, 0.82) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.39 (1.07, 1.80) </td> <td> 1.21 (0.92, 1.59) </td> <td> 1.66 (1.26, 2.22) </td> <td>  </td> <td> 1.41 (1.16, 1.71) </td> <td> 1.25 (0.98, 1.61) </td> <td> 1.10 (0.92, 1.32) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 0.98 (0.75, 1.29) </td> <td> 0.85 (0.65, 1.13) </td> <td> 1.18 (0.88, 1.58) </td> <td> 0.71 (0.58, 0.86) </td> <td>  </td> <td> 0.89 (0.69, 1.15) </td> <td> 0.78 (0.64, 0.95) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.11 (0.87, 1.42) </td> <td> 0.96 (0.73, 1.25) </td> <td> 1.33 (1.01, 1.75) </td> <td> 0.80 (0.62, 1.02) </td> <td> 1.12 (0.87, 1.45) </td> <td>  </td> <td> 0.88 (0.74, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.26 (1.05, 1.52) </td> <td> 1.10 (0.90, 1.35) </td> <td> 1.51 (1.22, 1.90) </td> <td> 0.91 (0.76, 1.09) </td> <td> 1.28 (1.05, 1.57) </td> <td> 1.14 (0.97, 1.35) </td> <td>  </td> </tr>
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
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.23335 0.09423 0.0009423      0.0009650
## d.Warfarin.Dabigatran_110_mg -0.09280 0.10430 0.0010430      0.0011642
## d.Warfarin.Dabigatran_150_mg -0.41620 0.11387 0.0011387      0.0011777
## d.Warfarin.Edoxaban_30_mg     0.09354 0.09300 0.0009300      0.0010205
## d.Warfarin.Edoxaban_60_mg    -0.24955 0.10020 0.0010020      0.0009941
## d.Warfarin.Rivaroxaban_20_mg -0.13260 0.08536 0.0008536      0.0008792
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.41651 -0.29676 -0.23340 -0.16935 -0.04743
## d.Warfarin.Dabigatran_110_mg -0.29846 -0.16314 -0.09356 -0.02298  0.11058
## d.Warfarin.Dabigatran_150_mg -0.63982 -0.49290 -0.41506 -0.33799 -0.19718
## d.Warfarin.Edoxaban_30_mg    -0.08706  0.03162  0.09327  0.15594  0.27974
## d.Warfarin.Edoxaban_60_mg    -0.44867 -0.31699 -0.24799 -0.18192 -0.05351
## d.Warfarin.Rivaroxaban_20_mg -0.29905 -0.18986 -0.13339 -0.07373  0.03320
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.05021 10.04896 20.09917 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcStroke_files/figure-html/gelman-1.png) 

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

![](mtcStroke_files/figure-html/trace-1.png) ![](mtcStroke_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcStroke_files/figure-html/autocorr-1.png) ![](mtcStroke_files/figure-html/autocorr-2.png) ![](mtcStroke_files/figure-html/autocorr-3.png) ![](mtcStroke_files/figure-html/autocorr-4.png) 

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

![](mtcStroke_files/figure-html/anohe-1.png) ![](mtcStroke_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/anohe-3.png) ![](mtcStroke_files/figure-html/anohe-4.png) ![](mtcStroke_files/figure-html/anohe-5.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/anohe-6.png) ![](mtcStroke_files/figure-html/anohe-7.png) 
