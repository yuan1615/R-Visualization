利用ggpmisc在图中加注释
================

为了更好的直观展示数据特性，让分析人员更清晰发现一些规律，为深层次建立模型奠定基础。

## 例1：利用stat\_peaks标记峰值

``` r
library(ggpmisc)
library(ggrepel)

ggplot(lynx, as.numeric = FALSE) + geom_line() +
  stat_peaks(colour = "red") +
  stat_peaks(geom = "text", colour = "red", angle = 66,
             hjust = -0.1, x.label.fmt = "%Y") +
  stat_peaks(geom = "rug", colour = "red", sides = "b") +
  expand_limits(y = 8000)
```

![plot1](https://github.com/yuan1615/R-Visualization/tree/master/04%20%E6%8B%9F%E5%90%88%E6%9B%B2%E7%BA%BF%E7%AA%81%E5%87%BA%E6%98%BE%E7%A4%BA/ggpmisc-example_files/figure-gfm/stat_peaks-1.png)

## 例2：利用stat\_poly\_eq将拟合公式标注到图中

``` r
formula <- y ~ x + I(x^2)
ggplot(cars, aes(speed, dist)) +
  geom_point() +
  stat_fit_deviations(method = "lm", formula = formula, colour = "red") +
  geom_smooth(method = "lm", formula = formula) +
  stat_poly_eq(aes(label =  paste(stat(eq.label), stat(adj.rr.label), stat(AIC.label), sep = "*\", \"*")),
               formula = formula, parse = TRUE)
```

![plot2](https://github.com/yuan1615/R-Visualization/tree/master/04%20%E6%8B%9F%E5%90%88%E6%9B%B2%E7%BA%BF%E7%AA%81%E5%87%BA%E6%98%BE%E7%A4%BA/ggpmisc-example_files/figure-gfm/stat_poly_eq-1.png)

## 例3：利用stat\_fit\_tb()将表格放到图中

``` r
formula <- y ~ x + I(x^2)
ggplot(cars, aes(speed, dist)) +
  geom_point() +
  geom_smooth(method = "lm", formula = formula) +
  stat_fit_tb(method = "lm",
              method.args = list(formula = formula),
              tb.type = "fit.anova",
              tb.vars = c(Effect = "term",
                          "df",
                          "M.S." = "meansq",
                          "italic(F)" = "statistic",
                          "italic(P)" = "p.value"),
              label.y.npc = "top", label.x.npc = "left",
              size = 5,
              parse = TRUE)
```

![plot3](https://github.com/yuan1615/R-Visualization/tree/master/04%20%E6%8B%9F%E5%90%88%E6%9B%B2%E7%BA%BF%E7%AA%81%E5%87%BA%E6%98%BE%E7%A4%BA/ggpmisc-example_files/figure-gfm/stat_fit_tb-1.png)

## 例4：在图中加入子图

``` r
library(tibble)
p <- ggplot(mtcars, aes(factor(cyl), mpg, colour = factor(cyl))) +
  stat_boxplot() +
  labs(y = NULL) +
  theme_bw(9) + theme(legend.position = "none")
df <- tibble(x = 0.01, y = 0.015, plot = list(p))
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point() +
  geom_plot_npc(data = df, mapping = aes(npcx = x, npcy = y, label = plot),
                vjust = 0, hjust = 0) +
  expand_limits(y = 0, x = 0)
```
![plot4](https://github.com/yuan1615/R-Visualization/tree/master/04%20%E6%8B%9F%E5%90%88%E6%9B%B2%E7%BA%BF%E7%AA%81%E5%87%BA%E6%98%BE%E7%A4%BA/ggpmisc-example_files/figure-gfm/geom_plot_npc-1.png)


## 例5：数据放到坐标系中标出离群点

``` r
ggplot(quadrant_example.df, aes(logFC.x, logFC.y)) +
  geom_point(alpha = 0.3) +
  geom_quadrant_lines() +
  stat_quadrant_counts() +
  stat_dens2d_filter(color = "red", keep.fraction = 0.03) +
  stat_dens2d_labels(aes(label = gene), keep.fraction = 0.03,
                     geom = "text_repel", size = 2, colour = "red") +
  scale_x_logFC(name = "Transcript abundance after A%unit") +
  scale_y_logFC(name = "Transcript abundance after B%unit")
```

![plot5](https://github.com/yuan1615/R-Visualization/tree/master/04%20%E6%8B%9F%E5%90%88%E6%9B%B2%E7%BA%BF%E7%AA%81%E5%87%BA%E6%98%BE%E7%A4%BA/ggpmisc-example_files/figure-gfm/geom_quadrant-1.png)
