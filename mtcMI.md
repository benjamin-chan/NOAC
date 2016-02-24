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
write.csv(D, file="mtcMIData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 24 10:40:05 2016 -->
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
<!-- Wed Feb 24 10:40:20 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.64 (0.41, 1.00) </td> <td> 0.62 (0.40, 0.97) </td> <td> 0.73 (0.50, 1.04) </td> <td> 0.93 (0.64, 1.35) </td> <td> 0.23 (0.01, 2.14) </td> <td> 1.11 (0.75, 1.64) </td> <td> 0.88 (0.66, 1.17) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.57 (1.00, 2.43) </td> <td>  </td> <td> 0.98 (0.73, 1.32) </td> <td> 1.14 (0.76, 1.70) </td> <td> 1.46 (0.96, 2.19) </td> <td> 0.36 (0.01, 3.38) </td> <td> 1.74 (1.13, 2.64) </td> <td> 1.38 (0.99, 1.90) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.60 (1.03, 2.50) </td> <td> 1.02 (0.76, 1.38) </td> <td>  </td> <td> 1.17 (0.78, 1.72) </td> <td> 1.49 (1.00, 2.24) </td> <td> 0.37 (0.01, 3.43) </td> <td> 1.78 (1.17, 2.71) </td> <td> 1.41 (1.02, 1.96) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 1.37 (0.96, 1.99) </td> <td> 0.87 (0.59, 1.32) </td> <td> 0.86 (0.58, 1.28) </td> <td>  </td> <td> 1.28 (1.02, 1.61) </td> <td> 0.31 (0.01, 2.90) </td> <td> 1.52 (1.07, 2.16) </td> <td> 1.20 (0.97, 1.51) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.08 (0.74, 1.56) </td> <td> 0.68 (0.46, 1.04) </td> <td> 0.67 (0.45, 1.00) </td> <td> 0.78 (0.62, 0.98) </td> <td>  </td> <td> 0.25 (0.01, 2.26) </td> <td> 1.19 (0.83, 1.71) </td> <td> 0.94 (0.74, 1.20) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 4.35 (0.47, 119.49) </td> <td> 2.79 (0.30, 74.14) </td> <td> 2.71 (0.29, 73.60) </td> <td> 3.18 (0.35, 85.13) </td> <td> 4.05 (0.44, 111.45) </td> <td>  </td> <td> 4.85 (0.52, 129.50) </td> <td> 3.80 (0.43, 103.73) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.90 (0.61, 1.34) </td> <td> 0.58 (0.38, 0.88) </td> <td> 0.56 (0.37, 0.86) </td> <td> 0.66 (0.46, 0.93) </td> <td> 0.84 (0.59, 1.20) </td> <td> 0.21 (0.01, 1.94) </td> <td>  </td> <td> 0.79 (0.61, 1.03) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.14 (0.86, 1.52) </td> <td> 0.73 (0.53, 1.01) </td> <td> 0.71 (0.51, 0.98) </td> <td> 0.83 (0.66, 1.03) </td> <td> 1.06 (0.84, 1.35) </td> <td> 0.26 (0.01, 2.34) </td> <td> 1.26 (0.97, 1.64) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.13083 0.1466 0.001466       0.001501
## d.Warfarin.Dabigatran_110_mg  0.31771 0.1679 0.001679       0.001899
## d.Warfarin.Dabigatran_150_mg  0.34127 0.1687 0.001687       0.001743
## d.Warfarin.Edoxaban_30_mg     0.18638 0.1136 0.001136       0.001228
## d.Warfarin.Edoxaban_60_mg    -0.05878 0.1218 0.001218       0.001229
## d.Warfarin.Rivaroxaban_15_mg  1.49179 1.4110 0.014110       0.014109
## d.Warfarin.Rivaroxaban_20_mg -0.23358 0.1349 0.001349       0.001463
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%     25%      50%      75%   97.5%
## d.Warfarin.Apixaban_5_mg     -0.42146 -0.2295 -0.12963 -0.03136 0.15458
## d.Warfarin.Dabigatran_110_mg -0.01108  0.2057  0.31861  0.43071 0.64299
## d.Warfarin.Dabigatran_150_mg  0.01690  0.2235  0.34019  0.45513 0.67162
## d.Warfarin.Edoxaban_30_mg    -0.03414  0.1090  0.18494  0.26328 0.40887
## d.Warfarin.Edoxaban_60_mg    -0.29829 -0.1403 -0.06005  0.02327 0.18024
## d.Warfarin.Rivaroxaban_15_mg -0.85180  0.5297  1.33564  2.29297 4.64175
## d.Warfarin.Rivaroxaban_20_mg -0.49318 -0.3243 -0.23374 -0.14315 0.03263
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 12.37242 12.19493 24.56735 
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
