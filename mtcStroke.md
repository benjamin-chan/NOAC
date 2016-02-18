# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Strokeembolism")
```

Tidy up the data and bias the warfarin arm of ROCKET-AF to be similar to the Rivaroxaban arm.


```r
D <- tidyData(D)
D <- biasROCKETAF()
write.csv(D, file="mtcStrokeData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 17 22:07:40 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 212 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 265 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 3 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 253 </td> <td align="right"> 7002 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 182 </td> <td align="right"> 7012 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 232 </td> <td align="right"> 7012 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Rivaroxaban_15_mg </td> <td align="right"> 11 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Warfarin </td> <td align="right"> 22 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> Mao, 2014 </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 5 </td> <td align="right"> 177 </td> </tr>
  <tr> <td> Mao, 2014 </td> <td> Warfarin </td> <td align="right"> 7 </td> <td align="right"> 176 </td> </tr>
  <tr> <td> PETRO </td> <td> Dabigatran_150_mg </td> <td align="right"> 0 </td> <td align="right"> 166 </td> </tr>
  <tr> <td> PETRO </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 70 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 182 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 134 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 199 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 269 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 269 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_60_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 129 </td> </tr>
   </table>

```r
network <- mtc.network(D)
```

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
<!-- Wed Feb 17 22:07:59 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.65, 1.13) </td> <td> 1.18 (0.88, 1.57) </td> <td> 0.71 (0.55, 0.93) </td> <td> 1.00 (0.76, 1.31) </td> <td> 1.63 (0.77, 3.59) </td> <td> 0.79 (0.61, 1.01) </td> <td> 0.78 (0.65, 0.94) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.17 (0.89, 1.54) </td> <td>  </td> <td> 1.38 (1.10, 1.74) </td> <td> 0.83 (0.63, 1.10) </td> <td> 1.17 (0.88, 1.55) </td> <td> 1.90 (0.90, 4.28) </td> <td> 0.92 (0.70, 1.20) </td> <td> 0.91 (0.74, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.84 (0.64, 1.13) </td> <td> 0.72 (0.58, 0.91) </td> <td>  </td> <td> 0.60 (0.46, 0.81) </td> <td> 0.85 (0.63, 1.14) </td> <td> 1.38 (0.65, 3.07) </td> <td> 0.67 (0.50, 0.88) </td> <td> 0.66 (0.53, 0.83) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.40 (1.08, 1.81) </td> <td> 1.20 (0.91, 1.59) </td> <td> 1.66 (1.24, 2.20) </td> <td>  </td> <td> 1.41 (1.15, 1.71) </td> <td> 2.29 (1.09, 5.07) </td> <td> 1.10 (0.86, 1.42) </td> <td> 1.10 (0.91, 1.31) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.00 (0.76, 1.31) </td> <td> 0.85 (0.64, 1.13) </td> <td> 1.18 (0.87, 1.58) </td> <td> 0.71 (0.59, 0.87) </td> <td>  </td> <td> 1.63 (0.77, 3.60) </td> <td> 0.78 (0.60, 1.02) </td> <td> 0.78 (0.64, 0.95) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 0.61 (0.28, 1.29) </td> <td> 0.53 (0.23, 1.11) </td> <td> 0.72 (0.33, 1.54) </td> <td> 0.44 (0.20, 0.91) </td> <td> 0.61 (0.28, 1.29) </td> <td>  </td> <td> 0.48 (0.22, 1.01) </td> <td> 0.48 (0.22, 0.99) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.27 (0.99, 1.63) </td> <td> 1.09 (0.83, 1.42) </td> <td> 1.50 (1.13, 1.99) </td> <td> 0.91 (0.70, 1.17) </td> <td> 1.28 (0.98, 1.66) </td> <td> 2.07 (0.99, 4.57) </td> <td>  </td> <td> 0.99 (0.83, 1.18) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.28 (1.06, 1.53) </td> <td> 1.10 (0.89, 1.34) </td> <td> 1.51 (1.21, 1.88) </td> <td> 0.91 (0.76, 1.09) </td> <td> 1.28 (1.05, 1.57) </td> <td> 2.09 (1.01, 4.49) </td> <td> 1.01 (0.85, 1.20) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcStroke_files/figure-html/forest-1.png) ![](mtcStroke_files/figure-html/forest-2.png) ![](mtcStroke_files/figure-html/forest-3.png) ![](mtcStroke_files/figure-html/forest-4.png) ![](mtcStroke_files/figure-html/forest-5.png) ![](mtcStroke_files/figure-html/forest-6.png) ![](mtcStroke_files/figure-html/forest-7.png) 

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
##                                   Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.245664 0.09306 0.0009306      0.0009629
## d.Warfarin.Dabigatran_110_mg -0.090024 0.10423 0.0010423      0.0011669
## d.Warfarin.Dabigatran_150_mg -0.414015 0.11238 0.0011238      0.0012034
## d.Warfarin.Edoxaban_30_mg     0.091294 0.09341 0.0009341      0.0010130
## d.Warfarin.Edoxaban_60_mg    -0.249339 0.10122 0.0010122      0.0009981
## d.Warfarin.Rivaroxaban_15_mg -0.739766 0.37981 0.0037981      0.0042151
## d.Warfarin.Rivaroxaban_20_mg -0.007019 0.08743 0.0008743      0.0009004
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%       50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42798 -0.30842 -0.245948 -0.18297 -0.06082
## d.Warfarin.Dabigatran_110_mg -0.29584 -0.15984 -0.090826 -0.01881  0.11417
## d.Warfarin.Dabigatran_150_mg -0.63252 -0.48810 -0.413452 -0.33960 -0.19163
## d.Warfarin.Edoxaban_30_mg    -0.08955  0.02793  0.090882  0.15442  0.27378
## d.Warfarin.Edoxaban_60_mg    -0.45106 -0.31690 -0.248529 -0.18190 -0.05322
## d.Warfarin.Rivaroxaban_15_mg -1.50261 -0.98817 -0.735387 -0.48022 -0.01258
## d.Warfarin.Rivaroxaban_20_mg -0.18163 -0.06631 -0.006918  0.05292  0.16155
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 18.07008 14.03939 32.10947 
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
##                  t1                t2  i2.pair   i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 98.88289 91.978243       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA        NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA        NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.000000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.00000  0.000000       NA
## 6    Edoxaban_30_mg          Warfarin  0.00000  0.000000       NA
## 7    Edoxaban_60_mg          Warfarin  0.00000  0.000000       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA        NA       NA
## 9 Rivaroxaban_20_mg          Warfarin 15.70505  3.857863       NA
## 
## Global I-squared:
## -------------------------
## 
##   i2.pair   i2.cons
## 1  84.716 0.8130118
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcStroke_files/figure-html/anohe-1.png) ![](mtcStroke_files/figure-html/anohe-2.png) ![](mtcStroke_files/figure-html/anohe-3.png) ![](mtcStroke_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcStroke_files/figure-html/anohe-5.png) ![](mtcStroke_files/figure-html/anohe-6.png) ![](mtcStroke_files/figure-html/anohe-7.png) ![](mtcStroke_files/figure-html/anohe-8.png) 

```
## Consistency model:
```

![](mtcStroke_files/figure-html/anohe-9.png) ![](mtcStroke_files/figure-html/anohe-10.png) 
