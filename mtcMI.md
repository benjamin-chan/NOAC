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
<!-- Fri Mar 11 19:36:58 2016 -->
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
  <tr> <td> PETRO </td> <td> Dabigatran_150_mg </td> <td align="right"> 0 </td> <td align="right"> 100 </td> </tr>
  <tr> <td> PETRO </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 70 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 86 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 89 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 63 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 100 </td> <td align="right"> 7061 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 126 </td> <td align="right"> 7082 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_30_mg </td> <td align="right"> 2 </td> <td align="right"> 235 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Edoxaban_60_mg </td> <td align="right"> 2 </td> <td align="right"> 234 </td> </tr>
  <tr> <td> Weitz, 2010 </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 250 </td> </tr>
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
<!-- Fri Mar 11 19:37:17 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 0.99) </td> <td> 0.62 (0.40, 0.95) </td> <td> 0.72 (0.50, 1.04) </td> <td> 0.91 (0.63, 1.33) </td> <td> 0.22 (0.01, 2.10) </td> <td> 1.10 (0.74, 1.63) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.56 (1.01, 2.43) </td> <td>  </td> <td> 0.97 (0.72, 1.31) </td> <td> 1.12 (0.76, 1.66) </td> <td> 1.43 (0.96, 2.14) </td> <td> 0.35 (0.01, 3.31) </td> <td> 1.72 (1.14, 2.63) </td> <td> 1.37 (0.99, 1.91) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.61 (1.05, 2.49) </td> <td> 1.03 (0.76, 1.39) </td> <td>  </td> <td> 1.15 (0.78, 1.72) </td> <td> 1.47 (0.99, 2.19) </td> <td> 0.36 (0.01, 3.35) </td> <td> 1.77 (1.17, 2.72) </td> <td> 1.41 (1.02, 1.97) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.40 (0.96, 1.99) </td> <td> 0.89 (0.60, 1.32) </td> <td> 0.87 (0.58, 1.28) </td> <td>  </td> <td> 1.27 (1.01, 1.60) </td> <td> 0.31 (0.01, 2.87) </td> <td> 1.54 (1.08, 2.18) </td> <td> 1.22 (0.98, 1.53) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.10 (0.75, 1.58) </td> <td> 0.70 (0.47, 1.04) </td> <td> 0.68 (0.46, 1.01) </td> <td> 0.78 (0.63, 0.99) </td> <td>  </td> <td> 0.24 (0.01, 2.26) </td> <td> 1.21 (0.84, 1.72) </td> <td> 0.96 (0.76, 1.21) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 4.46 (0.48, 147.69) </td> <td> 2.83 (0.30, 96.44) </td> <td> 2.76 (0.30, 97.17) </td> <td> 3.21 (0.35, 106.62) </td> <td> 4.09 (0.44, 140.05) </td> <td>  </td> <td> 4.95 (0.52, 158.60) </td> <td> 3.92 (0.43, 130.90) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.91 (0.61, 1.34) </td> <td> 0.58 (0.38, 0.88) </td> <td> 0.56 (0.37, 0.86) </td> <td> 0.65 (0.46, 0.93) </td> <td> 0.83 (0.58, 1.19) </td> <td> 0.20 (0.01, 1.93) </td> <td>  </td> <td> 0.79 (0.61, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.52) </td> <td> 0.73 (0.52, 1.01) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.82 (0.65, 1.02) </td> <td> 1.04 (0.82, 1.32) </td> <td> 0.26 (0.01, 2.32) </td> <td> 1.26 (0.97, 1.65) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.13238 0.1469 0.001469       0.001480
## d.Warfarin.Dabigatran_110_mg  0.31637 0.1660 0.001660       0.001884
## d.Warfarin.Dabigatran_150_mg  0.34313 0.1657 0.001657       0.001733
## d.Warfarin.Edoxaban_30_mg     0.19868 0.1150 0.001150       0.001261
## d.Warfarin.Edoxaban_60_mg    -0.04281 0.1209 0.001209       0.001209
## d.Warfarin.Rivaroxaban_15_mg  1.52227 1.4308 0.014308       0.014180
## d.Warfarin.Rivaroxaban_20_mg -0.23082 0.1363 0.001363       0.001415
## 
## 2. Quantiles for each variable:
## 
##                                   2.5%     25%      50%      75%  97.5%
## d.Warfarin.Apixaban_5_mg     -0.416809 -0.2318 -0.13351 -0.03344 0.1552
## d.Warfarin.Dabigatran_110_mg -0.006932  0.2031  0.31456  0.42575 0.6463
## d.Warfarin.Dabigatran_150_mg  0.023456  0.2343  0.34160  0.45189 0.6756
## d.Warfarin.Edoxaban_30_mg    -0.023816  0.1218  0.19600  0.27595 0.4242
## d.Warfarin.Edoxaban_60_mg    -0.276129 -0.1246 -0.04235  0.03876 0.1937
## d.Warfarin.Rivaroxaban_15_mg -0.840381  0.5518  1.36647  2.31548 4.8744
## d.Warfarin.Rivaroxaban_20_mg -0.501259 -0.3212 -0.23069 -0.14066 0.0326
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 16.72944 13.30167 30.03111 
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin  0.00000  0.00000       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg  0.00000  0.00000       NA
## 6    Edoxaban_30_mg          Warfarin 65.23798 69.34853       NA
## 7    Edoxaban_60_mg          Warfarin 54.94396 69.88462       NA
## 8 Rivaroxaban_15_mg          Warfarin       NA       NA       NA
## 9 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
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

![](mtcMI_files/figure-html/anohe-1.png) ![](mtcMI_files/figure-html/anohe-2.png) ![](mtcMI_files/figure-html/anohe-3.png) ![](mtcMI_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMI_files/figure-html/anohe-5.png) ![](mtcMI_files/figure-html/anohe-6.png) ![](mtcMI_files/figure-html/anohe-7.png) ![](mtcMI_files/figure-html/anohe-8.png) 

```
## Consistency model:
```

![](mtcMI_files/figure-html/anohe-9.png) ![](mtcMI_files/figure-html/anohe-10.png) 
