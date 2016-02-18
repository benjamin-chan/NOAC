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

Tidy up the data and bias the warfarin arm of ROCKET-AF to be similar to the Rivaroxaban arm.


```r
D <- tidyData(D)
D <- biasROCKETAF()
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
<!-- Thu Feb 18 10:48:47 2016 -->
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
  <tr> <td> ROCKET-AF </td> <td> Warfarin </td> <td align="right"> 347 </td> <td align="right"> 7090 </td> </tr>
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
<!-- Thu Feb 18 10:49:04 2016 -->
<table border=1>
<tr> <th> treatment </th> <th> Apixaban 5 mg </th> <th> Dabigatran 110 mg </th> <th> Dabigatran 150 mg </th> <th> Edoxaban 30 mg </th> <th> Edoxaban 60 mg </th> <th> Rivaroxaban 20 mg </th> <th> Warfarin </th>  </tr>
  <tr> <td> Apixaban 5 mg vs </td> <td>  </td> <td> 0.86 (0.70, 1.06) </td> <td> 0.74 (0.60, 0.91) </td> <td> 1.49 (1.20, 1.83) </td> <td> 0.88 (0.72, 1.07) </td> <td> 0.60 (0.49, 0.74) </td> <td> 0.69 (0.60, 0.80) </td> </tr>
  <tr> <td> Dabigatran 110 mg vs </td> <td> 1.16 (0.94, 1.43) </td> <td>  </td> <td> 0.86 (0.74, 1.01) </td> <td> 1.72 (1.40, 2.14) </td> <td> 1.02 (0.83, 1.25) </td> <td> 0.70 (0.57, 0.87) </td> <td> 0.80 (0.69, 0.93) </td> </tr>
  <tr> <td> Dabigatran 150 mg vs </td> <td> 1.35 (1.10, 1.66) </td> <td> 1.16 (0.99, 1.36) </td> <td>  </td> <td> 2.00 (1.62, 2.48) </td> <td> 1.18 (0.97, 1.44) </td> <td> 0.81 (0.66, 1.00) </td> <td> 0.93 (0.81, 1.08) </td> </tr>
  <tr> <td> Edoxaban 30 mg vs </td> <td> 0.67 (0.55, 0.83) </td> <td> 0.58 (0.47, 0.72) </td> <td> 0.50 (0.40, 0.62) </td> <td>  </td> <td> 0.59 (0.50, 0.69) </td> <td> 0.41 (0.33, 0.50) </td> <td> 0.47 (0.40, 0.54) </td> </tr>
  <tr> <td> Edoxaban 60 mg vs </td> <td> 1.14 (0.93, 1.39) </td> <td> 0.98 (0.80, 1.20) </td> <td> 0.85 (0.69, 1.03) </td> <td> 1.69 (1.44, 1.99) </td> <td>  </td> <td> 0.69 (0.56, 0.84) </td> <td> 0.79 (0.69, 0.90) </td> </tr>
  <tr> <td> Rivaroxaban 20 mg vs </td> <td> 1.66 (1.35, 2.04) </td> <td> 1.43 (1.15, 1.77) </td> <td> 1.23 (1.00, 1.52) </td> <td> 2.46 (2.00, 3.07) </td> <td> 1.46 (1.20, 1.78) </td> <td>  </td> <td> 1.15 (0.99, 1.33) </td> </tr>
  <tr> <td> Warfarin vs </td> <td> 1.45 (1.25, 1.67) </td> <td> 1.25 (1.07, 1.45) </td> <td> 1.07 (0.92, 1.24) </td> <td> 2.14 (1.85, 2.50) </td> <td> 1.27 (1.11, 1.45) </td> <td> 0.87 (0.75, 1.01) </td> <td>  </td> </tr>
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
## d.Warfarin.Apixaban_5_mg     -0.36857 0.07416 0.0007416      0.0007853
## d.Warfarin.Dabigatran_110_mg -0.22080 0.07683 0.0007683      0.0008776
## d.Warfarin.Dabigatran_150_mg -0.07039 0.07497 0.0007497      0.0007543
## d.Warfarin.Edoxaban_30_mg    -0.76396 0.07776 0.0007776      0.0010085
## d.Warfarin.Edoxaban_60_mg    -0.23789 0.06744 0.0006744      0.0006753
## d.Warfarin.Rivaroxaban_20_mg  0.13834 0.07592 0.0007592      0.0007798
## 
## 2. Quantiles for each variable:
## 
##                                  2.5%     25%      50%      75%    97.5%
## d.Warfarin.Apixaban_5_mg     -0.51184 -0.4192 -0.36868 -0.31896 -0.22344
## d.Warfarin.Dabigatran_110_mg -0.37157 -0.2725 -0.22054 -0.16897 -0.07055
## d.Warfarin.Dabigatran_150_mg -0.21568 -0.1212 -0.07077 -0.02061  0.07842
## d.Warfarin.Edoxaban_30_mg    -0.91595 -0.8163 -0.76282 -0.71039 -0.61402
## d.Warfarin.Edoxaban_60_mg    -0.36878 -0.2830 -0.23894 -0.19220 -0.10357
## d.Warfarin.Rivaroxaban_20_mg -0.00737  0.0869  0.13871  0.18926  0.28789
## 
## 
## $DIC
##     Dbar       pD      DIC 
## 17.58545 12.24824 29.83369 
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
## 1     Apixaban_5_mg          Warfarin 99.94299 80.10149       NA
## 2 Dabigatran_110_mg Dabigatran_150_mg       NA       NA       NA
## 3 Dabigatran_110_mg          Warfarin       NA       NA       NA
## 4 Dabigatran_150_mg          Warfarin  0.00000  0.00000       NA
## 5    Edoxaban_30_mg    Edoxaban_60_mg 99.82000 90.07944       NA
## 6    Edoxaban_30_mg          Warfarin 97.76665  0.00000       NA
## 7    Edoxaban_60_mg          Warfarin 99.67346 96.04941       NA
## 8 Rivaroxaban_20_mg          Warfarin       NA       NA       NA
## 
## Global I-squared:
## -------------------------
## 
##    i2.pair  i2.cons
## 1 99.54916 70.80408
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
