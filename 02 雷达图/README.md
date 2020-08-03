雷达图
================

## 加载包及数据

``` r
library(ggradar)
library(dplyr)
library(scales)
library(tibble)

mtcars_radar <- mtcars %>% 
  as_tibble(rownames = "group") %>% 
  mutate_at(vars(-group), rescale) %>% 
  tail(4) %>% 
  select(1:8)
mtcars_radar
```

    ## # A tibble: 4 x 8
    ##   group            mpg   cyl  disp    hp  drat    wt   qsec
    ##   <chr>          <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>  <dbl>
    ## 1 Ford Pantera L 0.230   1   0.698 0.749 0.673 0.424 0     
    ## 2 Ferrari Dino   0.396   0.5 0.184 0.435 0.396 0.321 0.119 
    ## 3 Maserati Bora  0.196   1   0.573 1     0.359 0.526 0.0119
    ## 4 Volvo 142E     0.468   0   0.124 0.201 0.622 0.324 0.488

## 绘图

``` r
ggradar(mtcars_radar)
```
![雷达图](https://github.com/yuan1615/R-Visualization/blob/master/02%20雷达图/雷达图.png)
