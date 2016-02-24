# NOAC network meta-analysis: Stroke
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Strokeembolism")
```

Tidy up the data.


```r
D <- tidyData(D)
write.csv(D, file="mtcStrokeData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 24 11:54:12 2016 -->
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
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 306 </td> <td align="right"> 7090 </td> </tr>
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
<!-- Wed Feb 24 11:54:33 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.65, 1.12) </td> <td> 1.19 (0.89, 1.57) </td> <td> 0.71 (0.55, 0.92) </td> <td> 1.00 (0.77, 1.31) </td> <td> 1.62 (0.78, 3.59) </td> <td> 0.90 (0.70, 1.15) </td> <td> 0.78 (0.65, 0.94) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.17 (0.89, 1.54) </td> <td>  </td> <td> 1.38 (1.11, 1.74) </td> <td> 0.83 (0.63, 1.10) </td> <td> 1.17 (0.88, 1.56) </td> <td> 1.88 (0.90, 4.19) </td> <td> 1.05 (0.81, 1.37) </td> <td> 0.91 (0.75, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.84 (0.64, 1.13) </td> <td> 0.72 (0.58, 0.90) </td> <td>  </td> <td> 0.60 (0.45, 0.80) </td> <td> 0.85 (0.63, 1.13) </td> <td> 1.37 (0.64, 3.04) </td> <td> 0.76 (0.57, 1.00) </td> <td> 0.66 (0.53, 0.82) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.40 (1.09, 1.80) </td> <td> 1.20 (0.91, 1.58) </td> <td> 1.66 (1.24, 2.22) </td> <td>  </td> <td> 1.41 (1.16, 1.70) </td> <td> 2.27 (1.11, 5.00) </td> <td> 1.26 (0.98, 1.61) </td> <td> 1.10 (0.92, 1.32) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.00 (0.76, 1.30) </td> <td> 0.85 (0.64, 1.13) </td> <td> 1.18 (0.88, 1.60) </td> <td> 0.71 (0.59, 0.86) </td> <td>  </td> <td> 1.61 (0.77, 3.57) </td> <td> 0.89 (0.69, 1.16) </td> <td> 0.78 (0.64, 0.95) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 0.62 (0.28, 1.28) </td> <td> 0.53 (0.24, 1.11) </td> <td> 0.73 (0.33, 1.55) </td> <td> 0.44 (0.20, 0.90) </td> <td> 0.62 (0.28, 1.29) </td> <td>  </td> <td> 0.56 (0.26, 1.15) </td> <td> 0.48 (0.22, 0.98) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.11 (0.87, 1.43) </td> <td> 0.95 (0.73, 1.24) </td> <td> 1.32 (1.00, 1.74) </td> <td> 0.79 (0.62, 1.02) </td> <td> 1.12 (0.86, 1.45) </td> <td> 1.80 (0.87, 3.92) </td> <td>  </td> <td> 0.87 (0.74, 1.02) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.28 (1.07, 1.54) </td> <td> 1.10 (0.89, 1.34) </td> <td> 1.52 (1.22, 1.90) </td> <td> 0.91 (0.76, 1.09) </td> <td> 1.28 (1.05, 1.56) </td> <td> 2.07 (1.02, 4.46) </td> <td> 1.15 (0.98, 1.36) </td> <td>  </td> </tr>
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
##                                  Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.24687 0.09335 0.0009335      0.0009826
## d.Warfarin.Dabigatran_110_mg -0.09156 0.10364 0.0010364      0.0011158
## d.Warfarin.Dabigatran_150_mg -0.41732 0.11422 0.0011422      0.0011650
## d.Warfarin.Edoxaban_30_mg     0.09161 0.09226 0.0009226      0.0009783
## d.Warfarin.Edoxaban_60_mg    -0.24956 0.10106 0.0010106      0.0010044
## d.Warfarin.Rivaroxaban_15_mg -0.73379 0.37800 0.0037800      0.0041384
## d.Warfarin.Rivaroxaban_20_mg -0.13778 0.08437 0.0008437      0.0008602
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.43274 -0.30779 -0.24663 -0.18461 -0.06472
## d.Warfarin.Dabigatran_110_mg -0.29425 -0.16053 -0.09085 -0.02283  0.11398
## d.Warfarin.Dabigatran_150_mg -0.64114 -0.49555 -0.41825 -0.33970 -0.19632
## d.Warfarin.Edoxaban_30_mg    -0.08781  0.03039  0.09095  0.15268  0.27440
## d.Warfarin.Edoxaban_60_mg    -0.44698 -0.31798 -0.25040 -0.18177 -0.05196
## d.Warfarin.Rivaroxaban_15_mg -1.49475 -0.98637 -0.72549 -0.47423 -0.01986
## d.Warfarin.Rivaroxaban_20_mg -0.30641 -0.19367 -0.13752 -0.08003  0.02376
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.85573 14.04352 31.89925 
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 98.80897 92.89074       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.00000  0.00000       NA
## 6    Edoxaban_30_mg          Warfarin  0.00000  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin  0.00000  0.00000       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin  0.00000  0.00000       NA
## 
## Global I-squared:
## -------------------------
## 
##   i2.pair  i2.cons
## 1 83.6066 7.310264
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
