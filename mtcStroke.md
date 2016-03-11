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
<!-- Fri Mar 11 13:33:57 2016 -->
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
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_30_mg </td> <td align="right"> 1 </td> <td align="right"> 235 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_60_mg </td> <td align="right"> 1 </td> <td align="right"> 234 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Warfarin </td> <td align="right"> 4 </td> <td align="right"> 250 </td> </tr>
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
<!-- Fri Mar 11 13:34:21 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.85 (0.65, 1.13) </td> <td> 1.18 (0.89, 1.58) </td> <td> 0.72 (0.56, 0.93) </td> <td> 1.01 (0.78, 1.33) </td> <td> 1.62 (0.78, 3.53) </td> <td> 0.90 (0.70, 1.15) </td> <td> 0.78 (0.65, 0.94) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.17 (0.89, 1.54) </td> <td>  </td> <td> 1.39 (1.11, 1.73) </td> <td> 0.85 (0.64, 1.11) </td> <td> 1.19 (0.89, 1.58) </td> <td> 1.91 (0.91, 4.20) </td> <td> 1.05 (0.81, 1.37) </td> <td> 0.91 (0.75, 1.12) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.85 (0.63, 1.13) </td> <td> 0.72 (0.58, 0.90) </td> <td>  </td> <td> 0.61 (0.46, 0.81) </td> <td> 0.86 (0.64, 1.15) </td> <td> 1.38 (0.65, 3.04) </td> <td> 0.76 (0.58, 1.00) </td> <td> 0.66 (0.53, 0.82) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.39 (1.07, 1.79) </td> <td> 1.18 (0.90, 1.55) </td> <td> 1.64 (1.23, 2.19) </td> <td>  </td> <td> 1.41 (1.16, 1.71) </td> <td> 2.26 (1.09, 4.96) </td> <td> 1.24 (0.97, 1.58) </td> <td> 1.08 (0.90, 1.30) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 0.99 (0.75, 1.28) </td> <td> 0.84 (0.63, 1.12) </td> <td> 1.16 (0.87, 1.57) </td> <td> 0.71 (0.59, 0.86) </td> <td>  </td> <td> 1.61 (0.77, 3.55) </td> <td> 0.88 (0.68, 1.14) </td> <td> 0.77 (0.63, 0.93) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 0.62 (0.28, 1.27) </td> <td> 0.52 (0.24, 1.10) </td> <td> 0.72 (0.33, 1.53) </td> <td> 0.44 (0.20, 0.92) </td> <td> 0.62 (0.28, 1.30) </td> <td>  </td> <td> 0.55 (0.25, 1.15) </td> <td> 0.48 (0.22, 0.97) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.12 (0.87, 1.42) </td> <td> 0.95 (0.73, 1.24) </td> <td> 1.32 (1.00, 1.74) </td> <td> 0.80 (0.63, 1.03) </td> <td> 1.13 (0.88, 1.46) </td> <td> 1.82 (0.87, 3.97) </td> <td>  </td> <td> 0.87 (0.74, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.28 (1.07, 1.54) </td> <td> 1.09 (0.89, 1.34) </td> <td> 1.51 (1.22, 1.90) </td> <td> 0.92 (0.77, 1.10) </td> <td> 1.30 (1.07, 1.58) </td> <td> 2.09 (1.03, 4.49) </td> <td> 1.15 (0.97, 1.35) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.24733 0.09240 0.0009240      0.0009278
## d.Warfarin.Dabigatran_110_mg -0.08861 0.10447 0.0010447      0.0011234
## d.Warfarin.Dabigatran_150_mg -0.41523 0.11347 0.0011347      0.0011348
## d.Warfarin.Edoxaban_30_mg     0.07957 0.09185 0.0009185      0.0009861
## d.Warfarin.Edoxaban_60_mg    -0.26319 0.09990 0.0009990      0.0010309
## d.Warfarin.Rivaroxaban_15_mg -0.74350 0.37619 0.0037619      0.0040845
## d.Warfarin.Rivaroxaban_20_mg -0.13845 0.08420 0.0008420      0.0008744
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.42908 -0.30879 -0.24698 -0.18590 -0.06436
## d.Warfarin.Dabigatran_110_mg -0.28910 -0.16014 -0.08891 -0.01767  0.11708
## d.Warfarin.Dabigatran_150_mg -0.63941 -0.49246 -0.41439 -0.33948 -0.19510
## d.Warfarin.Edoxaban_30_mg    -0.09982  0.01773  0.07888  0.14077  0.26133
## d.Warfarin.Edoxaban_60_mg    -0.45797 -0.33051 -0.26314 -0.19605 -0.06927
## d.Warfarin.Rivaroxaban_15_mg -1.50170 -0.99311 -0.73546 -0.48789 -0.02640
## d.Warfarin.Rivaroxaban_20_mg -0.30371 -0.19476 -0.13757 -0.08164  0.02842
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 21.17032 15.02406 36.19439 
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
##                  t1                t2   i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 92.807234 87.74565       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg        NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin        NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.000000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.000000  0.00000       NA
## 6    Edoxaban_30_mg          Warfarin 50.590657 56.65298       NA
## 7    Edoxaban_60_mg          Warfarin  8.635681 25.25060       NA
## 8 Rivaroxaban_15_mg          Warfarin        NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin  0.000000  0.00000       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair i2.cons
## 1 19.42027       0
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
