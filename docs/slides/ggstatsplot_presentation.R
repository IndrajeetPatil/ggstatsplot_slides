## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  fig.width = 6, fig.height = 5, fig.retina = 2, fig.align = "center",
  out.width = "100%", dpi = 300,
  message = FALSE, warning = FALSE, cache = TRUE,
  autodep = TRUE, hiline = TRUE
)

knitr::opts_hooks$set(fig.callout = function(options) {
  if (options$fig.callout) {
    options$echo <- FALSE
    options$out.height <- "99%"
    options$fig.width <- 16
    options$fig.height <- 8
  }
  options
})

options(
  htmltools.dir.version = FALSE,
  width = 90,
  max.print = 9999,
  knitr.table.format = "html",
  crayon.enabled = TRUE
)

as_table <- function(...) knitr::kable(..., format = "html", digits = 3)

## ----lm, eval = FALSE----------------------------------------------------
## stats::lm(formula = wt ~ mpg, data = mtcars)

## ----cor, eval = FALSE---------------------------------------------------
## stats::cor(x = mtcars$wt, y = mtcars$mpg)

## ----cor.test, eval = FALSE----------------------------------------------
## stats::cor.test(formula = ~ wt + mpg, data = mtcars)

## ----utils, eval = FALSE, tidy = FALSE-----------------------------------
## utils::install.packages("ggstatsplot")

## ----github, eval = FALSE, tidy = FALSE----------------------------------
## library(devtools)
## devtools::install_github("IndrajeetPatil/ggstatsplot", dependencies = FALSE)

## ----load, eval = TRUE, warning=FALSE------------------------------------
library(ggstatsplot)
library(ggplot2)

## ----ggbetweenstats_1, eval = FALSE--------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "p", # default #<<
##   bf.message = TRUE, #<<
##   messages = FALSE
## )

## ----ggbetweenstats_1, ref.label = 'ggbetweenstats_1', echo = FALSE------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "p", # default #<<  
  bf.message = TRUE, #<<
  messages = FALSE
)

## ----ggbetweenstats_2, eval = FALSE--------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "np", #<<
##   mean.ci = TRUE, #<<
##   pairwise.comparisons = TRUE, #<<
##   pairwise.display = "ns", #<<
##   p.adjust.method = "fdr", #<<
##   messages = FALSE
## )

## ----ggbetweenstats_2, ref.label = 'ggbetweenstats_2', echo = FALSE------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "np", #<<
  mean.ci = TRUE, #<<
  pairwise.comparisons = TRUE, #<<
  pairwise.display = "ns", #<<
  p.adjust.method = "fdr", #<<
  messages = FALSE
)

## ----ggbetweenstats_3, eval = FALSE--------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "r", #<<
##   conf.level = 0.99, #<<
##   pairwise.comparisons = TRUE,
##   pairwise.annotation = "p",
##   outlier.tagging = TRUE, #<<
##   outlier.label = title, #<<
##   outlier.coef = 2, #<<
##   ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
##   palette = "Darjeeling2", #<<
##   package = "wesanderson", #<<
##   messages = FALSE
## )

## ----ggbetweenstats_3, ref.label = 'ggbetweenstats_3', echo = FALSE------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "r", #<<
  conf.level = 0.99, #<<
  pairwise.comparisons = TRUE,
  pairwise.annotation = "p", 
  outlier.tagging = TRUE, #<<
  outlier.label = title, #<<
  outlier.coef = 2, #<<
  ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
  palette = "Darjeeling2", #<<
  package = "wesanderson", #<<
  messages = FALSE
)

## ----ggbetweenstats_4, eval = FALSE--------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "bf", #<<
##   messages = FALSE
## ) +
##   scale_y_continuous(sec.axis = dup_axis()) #<<

## ----ggbetweenstats_4, ref.label = 'ggbetweenstats_4', echo = FALSE------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "bf", #<<
  messages = FALSE
) + 
  scale_y_continuous(sec.axis = dup_axis()) #<<

## ----ggscatterstats_1, eval = FALSE--------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "p", # default #<<
##   bf.message = TRUE, #<<
##   conf.level = 0.99, #<<
##   messages = FALSE
## )

## ----ggscatterstats_1, ref.label = 'ggscatterstats_1', echo = FALSE------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "p", # default #<<
  bf.message = TRUE, #<<
  conf.level = 0.99, #<<
  messages = FALSE
)

## ----ggscatterstats_2, eval = FALSE--------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   marginal = FALSE, #<<
##   method = "loess", #<<
##   results.subtitle = FALSE, #<<
##   centrality.para = "mean", #<<
##   label.var = title, #<<
##   label.expression = budget > 150 #<<
##                      & rating > 7.5, #<<
##   ggtheme = ggthemes::theme_stata(), #<<
##   ggstatsplot.layer = FALSE,
##   messages = FALSE
## )

## ----ggscatterstats_2, ref.label = 'ggscatterstats_2', echo = FALSE------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  marginal = FALSE, #<<
  method = "loess", #<<
  results.subtitle = FALSE, #<<
  centrality.para = "mean", #<<
  label.var = title, #<<
  label.expression = budget > 150 #<<
                     & rating > 7.5, #<<
  ggtheme = ggthemes::theme_stata(), #<<
  ggstatsplot.layer = FALSE,
  messages = FALSE
)

## ----ggcorrmat_1, eval = FALSE-------------------------------------------
## ggcorrmat(dplyr::starwars)

## ----ggcorrmat_1, ref.label = 'ggcorrmat_1', echo = FALSE----------------
ggcorrmat(dplyr::starwars)

## ----ggcorrmat_2, eval = FALSE-------------------------------------------
## ggcorrmat(
##   data = ggplot2::msleep,
##   cor.vars = sleep_cycle:bodywt,
##   type = "r",
##   matrix.type = "upper", #<<
##   p.adjust.method = "holm", #<<
##   colors = NULL,
##   package = "yarrr", #<<
##   palette = "southpark" #<<
## )

## ----ggcorrmat_2, ref.label = 'ggcorrmat_2', echo = FALSE----------------
ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_cycle:bodywt,
  type = "r",
  matrix.type = "upper", #<<
  p.adjust.method = "holm", #<<
  colors = NULL,
  package = "yarrr", #<<
  palette = "southpark" #<<
)

## ----gghistostats_1, eval = FALSE----------------------------------------
## ggstatsplot::gghistostats(
##   data = movies_long,
##   x = budget,
##   test.value = 50, #<<
##   bar.measure = "count", # default #<<
##   binwidth = 10,  #<<
##   bf.message = TRUE, #<<
##   messages = FALSE
## )

## ----gghistostats_1, ref.label = 'gghistostats_1', echo = FALSE----------
ggstatsplot::gghistostats(
  data = movies_long,    
  x = budget,
  test.value = 50, #<<
  bar.measure = "count", # default #<<
  binwidth = 10,  #<<
  bf.message = TRUE, #<<
  messages = FALSE
) 

## ----gghistostats_2, eval = FALSE----------------------------------------
## ggstatsplot::gghistostats(
##   data = movies_long,
##   x = budget,
##   type = "r",
##   test.value = 50,
##   test.value.size = TRUE, #<<
##   bar.measure = "mix", #<<
##   centrality.para = "median",
##   test.value.line = TRUE, #<<
##   normal.curve = TRUE, #<<
##   ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
##   ggstatsplot.layer = FALSE, #<<
##   messages = FALSE
## )

## ----gghistostats_2, ref.label = 'gghistostats_2', echo = FALSE----------
ggstatsplot::gghistostats(
  data = movies_long,    
  x = budget,
  type = "r",
  test.value = 50,
  test.value.size = TRUE, #<<
  bar.measure = "mix", #<<
  centrality.para = "median", 
  test.value.line = TRUE, #<<
  normal.curve = TRUE, #<<
  ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
  ggstatsplot.layer = FALSE, #<<
  messages = FALSE
) 

## ----ggdotplotstats_1, eval = FALSE--------------------------------------
## ggstatsplot::ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   test.value = 52, #<<
##   centrality.para = "median",
##   test.value.line = TRUE, #<<
##   test.value.color = "red", #<<
##   ggtheme = ggthemes::theme_par(),
##   messages = FALSE
## )

## ----ggdotplotstats_1, ref.label = 'ggdotplotstats_1', echo = FALSE------
ggstatsplot::ggdotplotstats(
  data = movies_long,
  x = budget,
  y = genre,
  test.value = 52, #<<     
  centrality.para = "median", 
  test.value.line = TRUE, #<<
  test.value.color = "red", #<<
  ggtheme = ggthemes::theme_par(),
  messages = FALSE
) 

## ----ggpiestats_1, eval = FALSE------------------------------------------
## # let's use subset of data
## ggpiestats(
##   data = dplyr::filter(movies_long,
##   genre %in% c("Drama", "Comedy", "Animated")),
##   main = genre,
##   condition = mpaa,
##   paired = FALSE, # default #<<
##   conf.level = 0.99, #<<
##   bf.message = TRUE, #<<
##   package = "ggsci",
##   palette = "default_ucscgb",
##   messages = FALSE
## )

## ----ggpiestats_1, ref.label = 'ggpiestats_1', echo = FALSE--------------
# let's use subset of data
ggpiestats(
  data = dplyr::filter(movies_long, 
  genre %in% c("Drama", "Comedy", "Animated")), 
  main = genre,
  condition = mpaa,
  paired = FALSE, # default #<< 
  conf.level = 0.99, #<<
  bf.message = TRUE, #<<
  package = "ggsci",
  palette = "default_ucscgb",
  messages = FALSE
)

## ----ggpiestats_2, eval = FALSE------------------------------------------
## ggpiestats(
##   data = as.data.frame(Titanic),
##   main = Survived, #<<
##   counts = Freq, #<<
##   slice.label = "both", #<<
##   messages = FALSE
## )

## ----ggpiestats_2, ref.label = 'ggpiestats_2', echo = FALSE--------------
ggpiestats(
  data = as.data.frame(Titanic), 
  main = Survived, #<<
  counts = Freq, #<<
  slice.label = "both", #<<
  messages = FALSE
)

## ----ggbarstats_1, eval = FALSE------------------------------------------
## ggbarstats(
##   data = movies_long,
##   main = genre,
##   condition = mpaa,
##   paired = FALSE, # default #<<
##   bf.message = TRUE, #<<
##   package = "ggsci",
##   palette = "default_igv",
##   caption = substitute(                       #<<
##     paste(italic("Source"), ": www.imdb.com") #<<
##   ),                                          #<<
##   messages = FALSE
## )

## ----ggbarstats_1, ref.label = 'ggbarstats_1', echo = FALSE--------------
ggbarstats(
  data = movies_long, 
  main = genre,
  condition = mpaa,
  paired = FALSE, # default #<<
  bf.message = TRUE, #<<
  package = "ggsci",
  palette = "default_igv",
  caption = substitute(                       #<< 
    paste(italic("Source"), ": www.imdb.com") #<<
  ),                                          #<<
  messages = FALSE
)

## ----ggcoefstats_1, eval = FALSE-----------------------------------------
## ggcoefstats(
##   stats::aov(
##     formula = rating ~ mpaa * genre,
##     data = movies_long
##   )
## )

## ----ggcoefstats_1, ref.label = 'ggcoefstats_1', echo = FALSE------------
ggcoefstats(
  stats::aov(
    formula = rating ~ mpaa * genre,
    data = movies_long
  )
) 

## ----ggcoefstats_2, results = "hide", fig.show = "hide"------------------
# dataframe with results
df <- tibble::tribble(
  ~term, ~estimate, ~std.error, ~statistic, ~p.value,
  "(Intercept)", 3.77, 0.165, 22.9, 1.49e-20,
  "x", -1.36, 0.258, -5.26, 1.13e-5
)

# plot
ggcoefstats(
  x = df,
  statistic = "z",
  exclude.intercept = FALSE
)

## ----ggcoefstats_3, results = "hide", fig.show = "hide"------------------
# made up data
meta_df <- tibble::tribble(
  ~term, ~estimate, ~std.error,
  "study_1", 0.111, 0.065,
  "study_2", -0.003, 0.258,
  "study_3", 0.001, 0.120,
  "study_4", 0.032, 0.022,
  "study_5", -0.765, 0.650,
  "study_6", -0.032, 0.058
)

# plot
ggcoefstats(
  x = meta_df,
  meta.analytic.effect = TRUE, #<<
  xlab = "estimate"
)

## ----grouped_1, eval = FALSE---------------------------------------------
## # for example
## grouped_ggpiestats(
##   data = mtcars,
##   main = cyl,
##   grouping.var = am, #<<
##   messages = FALSE
## )

## ----grouped_1, ref.label = 'grouped_1', echo = FALSE--------------------
# for example
grouped_ggpiestats(
  data = mtcars, 
  main = cyl,
  grouping.var = am, #<< 
  messages = FALSE
)

## ----subtitle_1, eval = FALSE--------------------------------------------
## # using `ggstatsplot` for stats
## results <- subtitle_contingency_tab(
##   data = Titanic_full,
##   main = Survived,
##   condition = Sex,
##   messages = FALSE
## )
## 
## # using `ggiraphExtra` for plot
## ggiraphExtra::ggSpine(
##   data = Titanic_full,
##   aes(x = Sex, fill = Survived),
##   addlabel = TRUE,
##   interactive = FALSE
## ) + labs(subtitle = results) # <<

## ----subtitle_1, ref.label = 'subtitle_1', echo = FALSE------------------
# using `ggstatsplot` for stats
results <- subtitle_contingency_tab(
  data = Titanic_full,
  main = Survived,
  condition = Sex,
  messages = FALSE
)

# using `ggiraphExtra` for plot
ggiraphExtra::ggSpine(
  data = Titanic_full,
  aes(x = Sex, fill = Survived),
  addlabel = TRUE,
  interactive = FALSE
) + labs(subtitle = results) # <<

