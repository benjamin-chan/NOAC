# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 15:38:00 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 182 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 134 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 199 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 212 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 265 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 188 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 241 </td> <td align="right"> 7090 </td> </tr>
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
<!-- Thu Feb 04 15:38:13 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.87 (0.66, 1.14) </td> <td> 1.20 (0.90, 1.61) </td> <td> 0.72 (0.56, 0.94) </td> <td> 1.02 (0.78, 1.34) </td> <td> 1.02 (0.78, 1.34) </td> <td> 0.79 (0.66, 0.95) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.15 (0.87, 1.52) </td> <td>  </td> <td> 1.39 (1.11, 1.73) </td> <td> 0.83 (0.63, 1.09) </td> <td> 1.17 (0.89, 1.55) </td> <td> 1.18 (0.89, 1.56) </td> <td> 0.91 (0.74, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.83 (0.62, 1.11) </td> <td> 0.72 (0.58, 0.90) </td> <td>  </td> <td> 0.60 (0.45, 0.80) </td> <td> 0.85 (0.63, 1.13) </td> <td> 0.85 (0.63, 1.14) </td> <td> 0.66 (0.53, 0.82) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.38 (1.07, 1.80) </td> <td> 1.20 (0.92, 1.58) </td> <td> 1.66 (1.26, 2.21) </td> <td>  </td> <td> 1.41 (1.16, 1.71) </td> <td> 1.42 (1.08, 1.84) </td> <td> 1.10 (0.92, 1.31) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 0.98 (0.75, 1.28) </td> <td> 0.85 (0.64, 1.13) </td> <td> 1.18 (0.88, 1.59) </td> <td> 0.71 (0.58, 0.86) </td> <td>  </td> <td> 1.01 (0.76, 1.32) </td> <td> 0.78 (0.64, 0.95) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.98 (0.75, 1.28) </td> <td> 0.85 (0.64, 1.12) </td> <td> 1.18 (0.87, 1.58) </td> <td> 0.71 (0.54, 0.93) </td> <td> 0.99 (0.76, 1.31) </td> <td>  </td> <td> 0.78 (0.64, 0.94) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.26 (1.05, 1.52) </td> <td> 1.09 (0.89, 1.35) </td> <td> 1.52 (1.22, 1.90) </td> <td> 0.91 (0.76, 1.09) </td> <td> 1.28 (1.05, 1.56) </td> <td> 1.29 (1.06, 1.57) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.23255 0.09379 0.0009379      0.0009896
## d.Warfarin.Dabigatran_110_mg -0.09120 0.10515 0.0010515      0.0011176
## d.Warfarin.Dabigatran_150_mg -0.41763 0.11339 0.0011339      0.0011340
## d.Warfarin.Edoxaban_30_mg     0.09246 0.09225 0.0009225      0.0009876
## d.Warfarin.Edoxaban_60_mg    -0.24899 0.10010 0.0010010      0.0009826
## d.Warfarin.Rivaroxaban_20_mg -0.25452 0.09942 0.0009942      0.0010445
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.41596 -0.29521 -0.23346 -0.16846 -0.04920
## d.Warfarin.Dabigatran_110_mg -0.29822 -0.16285 -0.09073 -0.02056  0.11216
## d.Warfarin.Dabigatran_150_mg -0.64074 -0.49374 -0.41705 -0.34168 -0.19484
## d.Warfarin.Edoxaban_30_mg    -0.08815  0.02987  0.09261  0.15430  0.27005
## d.Warfarin.Edoxaban_60_mg    -0.44446 -0.31647 -0.24778 -0.18174 -0.05288
## d.Warfarin.Rivaroxaban_20_mg -0.44917 -0.32227 -0.25373 -0.18810 -0.05753
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.05895 10.05806 20.11701 
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
