# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 15:39:32 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 322 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 375 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 397 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 148 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 256 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 395 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 386 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 254 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 418 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 524 </td> <td align="right"> 7036 </td> </tr>
   </table>

`Run the model using fixed-effects.


```r
M <- mtc.model(network, type="consistency", linearModel=effect)
plot(M)
```

![](mtcBleeding_files/figure-html/network-1.png) 

```r
results <- mtc.run(M, n.adapt=nAdapt, n.iter=nIter, thin=thin)
```

# Summary

Direct and indirect odds ratios and 95% confidence bounds are stored in
[mtcBleedingOddsRatios.csv](mtcBleedingOddsRatios.csv).


```r
or <- combineResults(outcomeBleeding=TRUE)
write.csv(or, file="mtcBleedingOddsRatios.csv", row.names=FALSE)
print(xtable(or), type="html", include.rownames=FALSE)
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 15:39:45 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.71 (0.55, 0.91) </td> <td> 0.61 (0.48, 0.78) </td> <td> 1.22 (0.94, 1.58) </td> <td> 0.72 (0.57, 0.92) </td> <td> 0.55 (0.43, 0.71) </td> <td> 0.57 (0.46, 0.69) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.41 (1.09, 1.81) </td> <td>  </td> <td> 0.86 (0.74, 1.01) </td> <td> 1.72 (1.38, 2.15) </td> <td> 1.02 (0.83, 1.25) </td> <td> 0.78 (0.64, 0.96) </td> <td> 0.80 (0.69, 0.93) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.64 (1.28, 2.10) </td> <td> 1.16 (0.99, 1.35) </td> <td>  </td> <td> 2.00 (1.61, 2.47) </td> <td> 1.19 (0.97, 1.44) </td> <td> 0.91 (0.74, 1.11) </td> <td> 0.93 (0.80, 1.08) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.82 (0.63, 1.06) </td> <td> 0.58 (0.47, 0.72) </td> <td> 0.50 (0.40, 0.62) </td> <td>  </td> <td> 0.59 (0.50, 0.70) </td> <td> 0.45 (0.37, 0.56) </td> <td> 0.47 (0.40, 0.54) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.38 (1.08, 1.76) </td> <td> 0.98 (0.80, 1.20) </td> <td> 0.84 (0.69, 1.03) </td> <td> 1.68 (1.44, 1.99) </td> <td>  </td> <td> 0.76 (0.63, 0.93) </td> <td> 0.79 (0.69, 0.90) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.81 (1.41, 2.32) </td> <td> 1.28 (1.04, 1.57) </td> <td> 1.10 (0.90, 1.35) </td> <td> 2.20 (1.78, 2.73) </td> <td> 1.31 (1.07, 1.59) </td> <td>  </td> <td> 1.03 (0.89, 1.18) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.76 (1.44, 2.16) </td> <td> 1.25 (1.07, 1.45) </td> <td> 1.07 (0.93, 1.24) </td> <td> 2.15 (1.85, 2.50) </td> <td> 1.27 (1.11, 1.46) </td> <td> 0.98 (0.85, 1.13) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.56636 0.10351 0.0010351      0.0011297
## d.Warfarin.Dabigatran_110_mg -0.22111 0.07739 0.0007739      0.0008770
## d.Warfarin.Dabigatran_150_mg -0.07128 0.07453 0.0007453      0.0007658
## d.Warfarin.Edoxaban_30_mg    -0.76415 0.07851 0.0007851      0.0009627
## d.Warfarin.Edoxaban_60_mg    -0.24222 0.06822 0.0006822      0.0006831
## d.Warfarin.Rivaroxaban_20_mg  0.02530 0.07338 0.0007338      0.0007378
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.7722 -0.63529 -0.56774 -0.49646 -0.36486
## d.Warfarin.Dabigatran_110_mg -0.3722 -0.27342 -0.22110 -0.16909 -0.06930
## d.Warfarin.Dabigatran_150_mg -0.2181 -0.12100 -0.07111 -0.02137  0.07335
## d.Warfarin.Edoxaban_30_mg    -0.9176 -0.81760 -0.76367 -0.71011 -0.61323
## d.Warfarin.Edoxaban_60_mg    -0.3767 -0.28765 -0.24171 -0.19633 -0.10769
## d.Warfarin.Rivaroxaban_20_mg -0.1194 -0.02393  0.02530  0.07509  0.16791
## 
## 
## $DIC
##      Dbar        pD       DIC 
##  9.995292  9.994505 19.989797 
## 
## attr(,"class")
## [1] "summary.mtc.result"
```

Sampler diagnostics.


```r
gelman.plot(results)
```

![](mtcBleeding_files/figure-html/gelman-1.png) 

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

![](mtcBleeding_files/figure-html/trace-1.png) ![](mtcBleeding_files/figure-html/trace-2.png) 


```r
autocorr.plot(results$samples)
```

![](mtcBleeding_files/figure-html/autocorr-1.png) ![](mtcBleeding_files/figure-html/autocorr-2.png) ![](mtcBleeding_files/figure-html/autocorr-3.png) ![](mtcBleeding_files/figure-html/autocorr-4.png) 

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

![](mtcBleeding_files/figure-html/anohe-1.png) ![](mtcBleeding_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcBleeding_files/figure-html/anohe-3.png) ![](mtcBleeding_files/figure-html/anohe-4.png) ![](mtcBleeding_files/figure-html/anohe-5.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/anohe-6.png) ![](mtcBleeding_files/figure-html/anohe-7.png) 
