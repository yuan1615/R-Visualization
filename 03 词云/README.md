词云
================

## 加载包及数据

``` r
library(ggwordcloud)
data("love_words")
```

## 绘图

``` r
set.seed(1)
ggplot(love_words, aes(label = word, size = speakers, color = speakers)) + 
  geom_text_wordcloud(aes(angle = 45 * sample(-2:2, nrow(love_words),
                                              replace = TRUE,
                                              prob = c(1,1,4,1,1))),
                      mask = png::readPNG(system.file("extdata/hearth.png",
                                                      package = "ggwordcloud", mustWork = TRUE)),
                      rm_outside = TRUE) +
  scale_size_area(max_size = 40) +
  theme_minimal() +
  scale_color_gradient(low = 'darkred', high = 'red')
```

![wordcolud](https://github.com/yuan1615/R-Visualization/blob/master/03%20词云/wordcloud.png)
