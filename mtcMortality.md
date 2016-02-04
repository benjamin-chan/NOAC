# NOAC network meta-analysis: Mortality
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Clean up the data (do not show the code).

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Feb 04 15:37:15 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 446 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 438 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 487 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 603 </td> <td align="right"> 9120 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 669 </td> <td align="right"> 9081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 208 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 250 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 737 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 773 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 839 </td> <td align="right"> 7036 </td> </tr>
   </table>

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
<!-- Thu Feb 04 15:37:27 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.98 (0.82, 1.16) </td> <td> 1.01 (0.84, 1.20) </td> <td> 1.03 (0.88, 1.20) </td> <td> 0.97 (0.83, 1.14) </td> <td> 1.07 (0.86, 1.34) </td> <td> 0.89 (0.79, 1.00) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.02 (0.86, 1.22) </td> <td>  </td> <td> 1.03 (0.90, 1.18) </td> <td> 1.05 (0.89, 1.25) </td> <td> 1.00 (0.84, 1.18) </td> <td> 1.10 (0.87, 1.39) </td> <td> 0.91 (0.80, 1.04) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 0.99 (0.83, 1.19) </td> <td> 0.97 (0.84, 1.11) </td> <td>  </td> <td> 1.02 (0.86, 1.21) </td> <td> 0.97 (0.82, 1.15) </td> <td> 1.07 (0.85, 1.34) </td> <td> 0.88 (0.77, 1.01) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.97 (0.83, 1.14) </td> <td> 0.95 (0.80, 1.12) </td> <td> 0.98 (0.83, 1.16) </td> <td>  </td> <td> 0.95 (0.85, 1.05) </td> <td> 1.05 (0.84, 1.30) </td> <td> 0.87 (0.78, 0.96) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.03 (0.88, 1.20) </td> <td> 1.00 (0.85, 1.18) </td> <td> 1.03 (0.87, 1.22) </td> <td> 1.05 (0.95, 1.17) </td> <td>  </td> <td> 1.10 (0.89, 1.36) </td> <td> 0.91 (0.82, 1.01) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 0.93 (0.74, 1.16) </td> <td> 0.91 (0.72, 1.14) </td> <td> 0.94 (0.74, 1.18) </td> <td> 0.96 (0.77, 1.19) </td> <td> 0.91 (0.73, 1.13) </td> <td>  </td> <td> 0.83 (0.69, 1.00) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.12 (1.00, 1.26) </td> <td> 1.10 (0.96, 1.25) </td> <td> 1.13 (0.99, 1.30) </td> <td> 1.15 (1.04, 1.29) </td> <td> 1.10 (0.99, 1.21) </td> <td> 1.21 (1.00, 1.46) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.11683 0.05814 0.0005814      0.0005626
## d.Warfarin.Dabigatran_110_mg -0.09296 0.06777 0.0006777      0.0007801
## d.Warfarin.Dabigatran_150_mg -0.12469 0.06827 0.0006827      0.0006828
## d.Warfarin.Edoxaban_30_mg    -0.14406 0.05395 0.0005395      0.0006082
## d.Warfarin.Edoxaban_60_mg    -0.09122 0.05298 0.0005298      0.0005322
## d.Warfarin.Rivaroxaban_20_mg -0.18851 0.09603 0.0009603      0.0009603
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%     25%      50%      75%     97.5%
## d.Warfarin.Apixaban_5_mg     -0.2320 -0.1552 -0.11666 -0.07774 -0.004645
## d.Warfarin.Dabigatran_110_mg -0.2245 -0.1388 -0.09290 -0.04726  0.037732
## d.Warfarin.Dabigatran_150_mg -0.2589 -0.1699 -0.12515 -0.07871  0.009219
## d.Warfarin.Edoxaban_30_mg    -0.2512 -0.1804 -0.14384 -0.10671 -0.040486
## d.Warfarin.Edoxaban_60_mg    -0.1947 -0.1269 -0.09084 -0.05535  0.011346
## d.Warfarin.Rivaroxaban_20_mg -0.3767 -0.2534 -0.18832 -0.12416 -0.001262
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 10.02604 10.02389 20.04994 
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

![](mtcMortality_files/figure-html/anohe-1.png) ![](mtcMortality_files/figure-html/anohe-2.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcMortality_files/figure-html/anohe-3.png) ![](mtcMortality_files/figure-html/anohe-4.png) ![](mtcMortality_files/figure-html/anohe-5.png) 

```
## Consistency model:
```

![](mtcMortality_files/figure-html/anohe-6.png) ![](mtcMortality_files/figure-html/anohe-7.png) 
