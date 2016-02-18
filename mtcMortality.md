# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Mortality")
```

Tidy up the data and bias the warfarin arm of ROCKET-AF to be similar to the Rivaroxaban arm.


```r
D <- tidyData(D)
D <- biasROCKETAF()
write.csv(D, file="mtcMortalityData.csv", row.names=FALSE)
print(xtable(D, digits=rep(0, 5)), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 17 22:06:33 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 603 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 669 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 737 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 773 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 839 </td> <td align="right"> 7036 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Rivaroxaban_15_mg </td> <td align="right"> 7 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Warfarin </td> <td align="right"> 5 </td> <td align="right"> 637 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 446 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 438 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 487 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 208 </td> <td align="right"> 7061 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 208 </td> <td align="right"> 7062 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_60_mg </td> <td align="right"> 1 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Warfarin </td> <td align="right"> 1 </td> <td align="right"> 129 </td> </tr>
   </table>

```r
network <- mtc.network(D)
```

Run the model using fixed-effects.



```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcMortality_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcMortalityOddsRatios.csv](mtcMortalityOddsRatios.csv).


```r
or <- combineResults()
write.csv(or, file="mtcMortalityOddsRatios.csv", row.names=FALSE)
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 17 22:06:50 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 15 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.98 (0.82, 1.16) </td> <td> 1.01 (0.84, 1.20) </td> <td> 1.03 (0.89, 1.21) </td> <td> 0.98 (0.84, 1.14) </td> <td> 0.62 (0.17, 2.03) </td> <td> 0.89 (0.71, 1.12) </td> <td> 0.89 (0.80, 1.00) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.02 (0.86, 1.22) </td> <td>  </td> <td> 1.03 (0.90, 1.18) </td> <td> 1.06 (0.89, 1.25) </td> <td> 1.00 (0.84, 1.18) </td> <td> 0.63 (0.17, 2.10) </td> <td> 0.91 (0.72, 1.15) </td> <td> 0.91 (0.80, 1.04) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.99 (0.83, 1.18) </td> <td> 0.97 (0.84, 1.12) </td> <td>  </td> <td> 1.02 (0.86, 1.21) </td> <td> 0.97 (0.81, 1.14) </td> <td> 0.62 (0.17, 2.03) </td> <td> 0.88 (0.70, 1.12) </td> <td> 0.88 (0.77, 1.01) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.97 (0.83, 1.13) </td> <td> 0.95 (0.80, 1.13) </td> <td> 0.98 (0.82, 1.16) </td> <td>  </td> <td> 0.95 (0.85, 1.05) </td> <td> 0.60 (0.17, 1.97) </td> <td> 0.86 (0.69, 1.08) </td> <td> 0.86 (0.77, 0.96) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.02 (0.88, 1.19) </td> <td> 1.00 (0.85, 1.19) </td> <td> 1.03 (0.87, 1.23) </td> <td> 1.06 (0.95, 1.18) </td> <td>  </td> <td> 0.64 (0.18, 2.08) </td> <td> 0.91 (0.73, 1.14) </td> <td> 0.91 (0.82, 1.01) </td> </tr>
  <tr> <td> Rivaroxaban 15 mg vs </td> <td> 1.60 (0.49, 5.76) </td> <td> 1.58 (0.48, 5.72) </td> <td> 1.61 (0.49, 5.83) </td> <td> 1.65 (0.51, 5.89) </td> <td> 1.57 (0.48, 5.62) </td> <td>  </td> <td> 1.43 (0.43, 5.23) </td> <td> 1.43 (0.44, 5.13) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.12 (0.90, 1.41) </td> <td> 1.10 (0.87, 1.39) </td> <td> 1.13 (0.89, 1.43) </td> <td> 1.16 (0.93, 1.44) </td> <td> 1.10 (0.88, 1.37) </td> <td> 0.70 (0.19, 2.31) </td> <td>  </td> <td> 1.00 (0.82, 1.21) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.12 (1.00, 1.26) </td> <td> 1.10 (0.96, 1.26) </td> <td> 1.13 (0.99, 1.30) </td> <td> 1.16 (1.04, 1.29) </td> <td> 1.10 (0.99, 1.22) </td> <td> 0.70 (0.19, 2.26) </td> <td> 1.00 (0.82, 1.21) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcMortality_files/figure-html/forest-1.png) ![](mtcMortality_files/figure-html/forest-2.png) ![](mtcMortality_files/figure-html/forest-3.png) ![](mtcMortality_files/figure-html/forest-4.png) ![](mtcMortality_files/figure-html/forest-5.png) ![](mtcMortality_files/figure-html/forest-6.png) ![](mtcMortality_files/figure-html/forest-7.png) 

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
##                                    Mean      SD  Naive SE Time-series SE
## d.Warfarin.Apixaban_5_mg     -0.1166606 0.05775 0.0005775      0.0005871
## d.Warfarin.Dabigatran_110_mg -0.0944741 0.06813 0.0006813      0.0007550
## d.Warfarin.Dabigatran_150_mg -0.1245292 0.06865 0.0006865      0.0006826
## d.Warfarin.Edoxaban_30_mg    -0.1473690 0.05414 0.0005414      0.0006284
## d.Warfarin.Edoxaban_60_mg    -0.0925141 0.05289 0.0005289      0.0005510
## d.Warfarin.Rivaroxaban_15_mg  0.3700503 0.62073 0.0062073      0.0064040
## d.Warfarin.Rivaroxaban_20_mg -0.0003725 0.09893 0.0009893      0.0009326
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%        50%      75%
## d.Warfarin.Apixaban_5_mg     -0.2294 -0.15606 -0.1162392 -0.07767
## d.Warfarin.Dabigatran_110_mg -0.2275 -0.14009 -0.0952269 -0.04954
## d.Warfarin.Dabigatran_150_mg -0.2617 -0.17008 -0.1237728 -0.07891
## d.Warfarin.Edoxaban_30_mg    -0.2556 -0.18362 -0.1471023 -0.11084
## d.Warfarin.Edoxaban_60_mg    -0.1968 -0.12801 -0.0929737 -0.05657
## d.Warfarin.Rivaroxaban_15_mg -0.8153 -0.04524  0.3549958  0.77847
## d.Warfarin.Rivaroxaban_20_mg -0.1947 -0.06672  0.0005585  0.06500
##                                  97.5%
## d.Warfarin.Apixaban_5_mg     -0.002951
## d.Warfarin.Dabigatran_110_mg  0.041279
## d.Warfarin.Dabigatran_150_mg  0.009836
## d.Warfarin.Edoxaban_30_mg    -0.041852
## d.Warfarin.Edoxaban_60_mg     0.010615
## d.Warfarin.Rivaroxaban_15_mg  1.635133
## d.Warfarin.Rivaroxaban_20_mg  0.193443
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 14.78915 13.15293 27.94208 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcMortality_files/figure-html/gelman-1.png) 

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

![](mtcMortality_files/figure-html/trace-1.png) ![](mtcMortality_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcMortality_files/figure-html/autocorr-1.png) ![](mtcMortality_files/figure-html/autocorr-2.png) ![](mtcMortality_files/figure-html/autocorr-3.png) ![](mtcMortality_files/figure-html/autocorr-4.png) 

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
## 4 Dabigatran_150_mg          Warfarin       NA       NA       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 71.17247 27.65110       NA
## 6    Edoxaban_30_mg          Warfarin 73.60783 33.58318       NA
## 7    Edoxaban_60_mg          Warfarin  0.00000  0.00000       NA
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

![](mtcMortality_files/figure-html/anohe-1.png) ![](mtcMortality_files/figure-html/anohe-2.png) ![](mtcMortality_files/figure-html/anohe-3.png) ![](mtcMortality_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/anohe-5.png) ![](mtcMortality_files/figure-html/anohe-6.png) ![](mtcMortality_files/figure-html/anohe-7.png) ![](mtcMortality_files/figure-html/anohe-8.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/anohe-9.png) ![](mtcMortality_files/figure-html/anohe-10.png) 
