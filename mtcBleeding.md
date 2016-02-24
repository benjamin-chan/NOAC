# NOAC network meta-analysis: Bleeding
Benjamin Chan  
`r Sys.time()`  

[Back](README.md) to main page.

Read data.


```r
D <- readSheet("Bleeding")
D <- D[!is.na(label)]
D <- D[,
       `:=` (nWarfarin = as.numeric(nWarfarin),
             yWarfarin = as.numeric(yWarfarin))]
```

Tidy up the data.


```r
D <- tidyData(D)
```

Hard-code data corrections to the PETRO study.

> From: Marian McDonagh  
> Sent: Friday, February 05, 2016 5:00 PM  
> To: Benjamin Chan  
> Subject: Re: Checking data for meta-analysis  
> 
> It looks like this was a dose-ranging studies with multiple arms.
> The only relevant one here had 0 events in the dabigatran 150 group (N = 100),
> and of course 0 in the warfarin group (N = 70).


```r
D <- D[study == "PETRO" & treatment == "Dabigatran_300_mg",
       `:=` (treatment = "Dabigatran_150_mg",
             responders = 0,
             sampleSize = 100)]
```

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Wed Feb 24 11:56:28 2016 -->
<table border=1>
<tr> <th> study </th> <th> treatment </th> <th> responders </th> <th> sampleSize </th>  </tr>
  <tr> <td> ARISTOTLE </td> <td> Apixaban_5_mg </td> <td align="right"> 327 </td> <td align="right"> 9088 </td> </tr>
  <tr> <td> ARISTOTLE </td> <td> Warfarin </td> <td align="right"> 462 </td> <td align="right"> 9052 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Apixaban_5_mg </td> <td align="right"> 0 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ARISTOTLE-J </td> <td> Warfarin </td> <td align="right"> 1 </td> <td align="right"> 74 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_30_mg </td> <td align="right"> 254 </td> <td align="right"> 7034 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Edoxaban_60_mg </td> <td align="right"> 418 </td> <td align="right"> 7035 </td> </tr>
  <tr> <td> ENGAGE AF-TIMI </td> <td> Warfarin </td> <td align="right"> 524 </td> <td align="right"> 7036 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Rivaroxaban_15_mg </td> <td align="right">  </td> <td align="right"> 639 </td> </tr>
  <tr> <td> J-ROCKET </td> <td> Warfarin </td> <td align="right">  </td> <td align="right"> 639 </td> </tr>
  <tr> <td> PETRO </td> <td> Dabigatran_150_mg </td> <td align="right"> 0 </td> <td align="right"> 100 </td> </tr>
  <tr> <td> PETRO </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 70 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_110_mg </td> <td align="right"> 322 </td> <td align="right"> 6015 </td> </tr>
  <tr> <td> RE-LY </td> <td> Dabigatran_150_mg </td> <td align="right"> 375 </td> <td align="right"> 6076 </td> </tr>
  <tr> <td> RE-LY </td> <td> Warfarin </td> <td align="right"> 397 </td> <td align="right"> 6022 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Rivaroxaban_20_mg </td> <td align="right"> 395 </td> <td align="right"> 7081 </td> </tr>
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 386 </td> <td align="right"> 7090 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_30_mg </td> <td align="right"> 0 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Edoxaban_60_mg </td> <td align="right"> 2 </td> <td align="right"> 131 </td> </tr>
  <tr> <td> Yamashita, 2012 </td> <td> Warfarin </td> <td align="right"> 0 </td> <td align="right"> 129 </td> </tr>
   </table>

Run the model using fixed-effects.



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
<!-- Wed Feb 24 11:56:46 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.70, 1.07) </td> <td> 0.74 (0.60, 0.91) </td> <td> 1.49 (1.21, 1.84) </td> <td> 0.88 (0.72, 1.07) </td> <td> 0.67 (0.55, 0.83) </td> <td> 0.69 (0.60, 0.80) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.16 (0.94, 1.43) </td> <td>  </td> <td> 0.86 (0.74, 1.00) </td> <td> 1.72 (1.39, 2.13) </td> <td> 1.02 (0.83, 1.24) </td> <td> 0.78 (0.63, 0.96) </td> <td> 0.80 (0.69, 0.93) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.34 (1.10, 1.66) </td> <td> 1.16 (1.00, 1.36) </td> <td>  </td> <td> 2.00 (1.63, 2.47) </td> <td> 1.18 (0.97, 1.44) </td> <td> 0.91 (0.74, 1.12) </td> <td> 0.93 (0.81, 1.08) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.67 (0.54, 0.83) </td> <td> 0.58 (0.47, 0.72) </td> <td> 0.50 (0.40, 0.61) </td> <td>  </td> <td> 0.59 (0.50, 0.69) </td> <td> 0.45 (0.37, 0.56) </td> <td> 0.46 (0.40, 0.54) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.14 (0.94, 1.38) </td> <td> 0.98 (0.81, 1.21) </td> <td> 0.85 (0.69, 1.03) </td> <td> 1.70 (1.45, 1.99) </td> <td>  </td> <td> 0.77 (0.63, 0.94) </td> <td> 0.79 (0.69, 0.90) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.48 (1.21, 1.82) </td> <td> 1.28 (1.04, 1.58) </td> <td> 1.10 (0.89, 1.35) </td> <td> 2.21 (1.79, 2.72) </td> <td> 1.30 (1.06, 1.58) </td> <td>  </td> <td> 1.03 (0.89, 1.18) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.44 (1.25, 1.67) </td> <td> 1.25 (1.07, 1.45) </td> <td> 1.07 (0.92, 1.24) </td> <td> 2.15 (1.85, 2.51) </td> <td> 1.27 (1.11, 1.44) </td> <td> 0.97 (0.84, 1.12) </td> <td>  </td> </tr>
   </table>

# Forest plots, NOAC vs NOAC



```r
noac <- unique(D[treatment != "Warfarin", treatment])
for (i in 1:length(noac)) {
  forest(relative.effect(results, noac[i], noac[1:length(noac) != i]))
}
```

![](mtcBleeding_files/figure-html/forest-1.png) ![](mtcBleeding_files/figure-html/forest-2.png) ![](mtcBleeding_files/figure-html/forest-3.png) ![](mtcBleeding_files/figure-html/forest-4.png) ![](mtcBleeding_files/figure-html/forest-5.png) ![](mtcBleeding_files/figure-html/forest-6.png) 

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
## d.Warfarin.Apixaban_5_mg     -0.36774 0.07377 0.0007377      0.0007691
## d.Warfarin.Dabigatran_110_mg -0.22178 0.07793 0.0007793      0.0009070
## d.Warfarin.Dabigatran_150_mg -0.07059 0.07483 0.0007483      0.0007542
## d.Warfarin.Edoxaban_30_mg    -0.76627 0.07849 0.0007849      0.0010191
## d.Warfarin.Edoxaban_60_mg    -0.23693 0.06791 0.0006791      0.0006906
## d.Warfarin.Rivaroxaban_20_mg  0.02614 0.07383 0.0007383      0.0007082
## 
## 2. Quantiles for each variable:
## 
##                                 2.5%      25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.5111 -0.41693 -0.36742 -0.31750 -0.22396
## d.Warfarin.Dabigatran_110_mg -0.3715 -0.27482 -0.22191 -0.16818 -0.07133
## d.Warfarin.Dabigatran_150_mg -0.2151 -0.12161 -0.07157 -0.01978  0.07970
## d.Warfarin.Edoxaban_30_mg    -0.9211 -0.81969 -0.76578 -0.71265 -0.61623
## d.Warfarin.Edoxaban_60_mg    -0.3680 -0.28351 -0.23651 -0.19116 -0.10405
## d.Warfarin.Rivaroxaban_20_mg -0.1172 -0.02363  0.02715  0.07580  0.16949
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.54566 12.20444 29.75010 
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
##                  t1                t2  i2.pair  i2.cons incons.p
## 1     Apixaban_5_mg          Warfarin 99.94482 80.93891       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin 31.18393  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 99.82166 90.50714       NA
## 6    Edoxaban_30_mg          Warfarin 96.73704  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 99.72202 95.94218       NA
## 8 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 99.56601 70.82293
```

```r
plot(anohe)
```

```
## Analysis of heterogeneity -- convergence plots
## Unrelated Study Effects (USE) model:
```

![](mtcBleeding_files/figure-html/anohe-1.png) ![](mtcBleeding_files/figure-html/anohe-2.png) ![](mtcBleeding_files/figure-html/anohe-3.png) ![](mtcBleeding_files/figure-html/anohe-4.png) 

```
## Unrelated Mean Effects (UME) model:
```

![](mtcBleeding_files/figure-html/anohe-5.png) ![](mtcBleeding_files/figure-html/anohe-6.png) ![](mtcBleeding_files/figure-html/anohe-7.png) 

```
## Consistency model:
```

![](mtcBleeding_files/figure-html/anohe-8.png) ![](mtcBleeding_files/figure-html/anohe-9.png) 
