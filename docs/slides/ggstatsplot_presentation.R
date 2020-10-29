## ----setup, include = FALSE--------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  fig.width = 7, 
  fig.height = 5, 
  fig.retina = 2, 
  fig.align = "center",
  out.width = "100%", 
  dpi = 300,
  message = FALSE, 
  warning = FALSE, 
  cache = TRUE,
  autodep = TRUE, 
  hiline = TRUE
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


## ----lm, eval = FALSE--------------------------------------------------------------------------------------------------
## stats::lm(formula = wt ~ mpg, data = mtcars)


## ----cor, eval = FALSE-------------------------------------------------------------------------------------------------
## stats::cor(x = mtcars$wt, y = mtcars$mpg)


## ----cor.test, eval = FALSE--------------------------------------------------------------------------------------------
## stats::cor.test(formula = ~ wt + mpg, data = mtcars)


## ----utils, eval = FALSE, tidy = FALSE---------------------------------------------------------------------------------
## install.packages("ggstatsplot")


## ----github, eval = FALSE, tidy = FALSE--------------------------------------------------------------------------------
## library(remotes)
## remotes::install_github("IndrajeetPatil/ggstatsplot", dependencies = FALSE)


## ----load, eval = TRUE, warning=FALSE----------------------------------------------------------------------------------
library(ggstatsplot)
library(ggplot2)


## ----ggbetweenstats_1, eval = FALSE------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa, # > 2 groups #<<
##   y = rating,
##   type = "p", # default #<<
##   messages = FALSE
## )


## ----ggbetweenstats_1, ref.label = 'ggbetweenstats_1', echo = FALSE----------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa, # > 2 groups #<<
  y = rating,
  type = "p", # default #<<
  messages = FALSE
)


## ----ggbetweenstats_1_copy, eval = FALSE-------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating
## )


## ----ggbetweenstats_2, eval = FALSE------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "np", # <<
##   mean.ci = TRUE, # <<
##   pairwise.display = "ns", # <<
##   p.adjust.method = "fdr", # <<
##   messages = FALSE
## )


## ----ggbetweenstats_2, ref.label = 'ggbetweenstats_2', echo = FALSE----------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "np", # <<
  mean.ci = TRUE, # <<
  pairwise.display = "ns", # <<
  p.adjust.method = "fdr", # <<
  messages = FALSE
)


## ----ggbetweenstats_3, eval = FALSE------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "r", # <<
##   outlier.tagging = TRUE, # <<
##   outlier.label = title, # <<
##   outlier.coef = 2, # <<
##   ggtheme = hrbrthemes::theme_ipsum_tw(), # <<
##   palette = "Darjeeling2", # <<
##   package = "wesanderson", # <<
##   messages = FALSE
## )


## ----ggbetweenstats_3, ref.label = 'ggbetweenstats_3', echo = FALSE----------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "r", # <<
  outlier.tagging = TRUE, # <<
  outlier.label = title, # <<
  outlier.coef = 2, # <<
  ggtheme = hrbrthemes::theme_ipsum_tw(), # <<
  palette = "Darjeeling2", # <<
  package = "wesanderson", # <<
  messages = FALSE
)


## ----ggbetweenstats_4, eval = FALSE------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "bf", # <<
##   messages = FALSE
## ) +
##   scale_y_continuous(sec.axis = dup_axis()) # <<


## ----ggbetweenstats_4, ref.label = 'ggbetweenstats_4', echo = FALSE----------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "bf", # <<
  messages = FALSE
) +
  scale_y_continuous(sec.axis = dup_axis()) # <<


## ----ggbetweenstats_5, eval = FALSE------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = mtcars,
##   x = am, # 2 groups #<<
##   y = wt,
##   type = "p", # default #<<
##   messages = FALSE
## )


## ----ggbetweenstats_5, ref.label = 'ggbetweenstats_5', echo = FALSE----------------------------------------------------
ggbetweenstats(
  data = mtcars,
  x = am, # 2 groups #<<
  y = wt,
  type = "p", # default #<<
  messages = FALSE
)


## ----ggwithinstats_1, eval = FALSE-------------------------------------------------------------------------------------
## ggwithinstats(
##   data = WRS2::WineTasting,
##   x = Wine,
##   y = Taste,
##   ggtheme = hrbrthemes::theme_ipsum_tw(), # <<
##   ggstatsplot.layer = FALSE,
##   messages = FALSE
## )


## ----ggwithinstats_1, ref.label = 'ggwithinstats_1', echo = FALSE------------------------------------------------------
ggwithinstats(
  data = WRS2::WineTasting,
  x = Wine,
  y = Taste,
  ggtheme = hrbrthemes::theme_ipsum_tw(), # <<
  ggstatsplot.layer = FALSE,
  messages = FALSE
)


## ----ggwithinstats_1_copy, eval = FALSE--------------------------------------------------------------------------------
## ggwithinstats(
##   data = WRS2::WineTasting,
##   x = Wine, # > 2 groups #<<
##   y = Taste,
##   ggtheme = hrbrthemes::theme_ipsum_tw(), # <<
##   ggstatsplot.layer = FALSE,
##   messages = FALSE
## )


## ----ggwithinstats_2, eval = FALSE-------------------------------------------------------------------------------------
## ggwithinstats(
##   data = iris_long,
##   x = attribute, # 2 groups #<<
##   y = value,
##   type = "r", # <<
##   messages = FALSE
## )


## ----ggwithinstats_2, ref.label = 'ggwithinstats_2', echo = FALSE------------------------------------------------------
ggwithinstats(
  data = iris_long,
  x = attribute, # 2 groups #<<
  y = value,
  type = "r", # <<
  messages = FALSE
)


## ----ggscatterstats_1, eval = FALSE------------------------------------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "p", # default #<<<
##   messages = FALSE
## )


## ----ggscatterstats_1, ref.label = 'ggscatterstats_1', echo = FALSE----------------------------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "p", # default #<<<
  messages = FALSE
)


## ----ggscatterstats_1_copy, eval = FALSE-------------------------------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating
## )


## ----ggscatterstats_2, eval = FALSE------------------------------------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "r",
##   label.var = title, # <<
##   label.expression = budget > 150 # <<
##   & rating > 7.5, # <<
##   marginal.type = "density", # <<
##   messages = FALSE
## )


## ----ggscatterstats_2, ref.label = 'ggscatterstats_2', echo = FALSE----------------------------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "r",
  label.var = title, # <<
  label.expression = budget > 150 # <<
  & rating > 7.5, # <<
  marginal.type = "density", # <<
  messages = FALSE
)


## ----ggscatterstats_3, results = "hide", fig.show = "hide"-------------------------------------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  marginal = FALSE,
  method = "gam", # <<
  formula = y ~ s(x, k = 3), # <<
  centrality.para = "mean", # <<
  messages = FALSE
)


## ----ggcorrmat_1, eval = FALSE-----------------------------------------------------------------------------------------
## ggcorrmat(dplyr::starwars)


## ----ggcorrmat_1, ref.label = 'ggcorrmat_1', echo = FALSE--------------------------------------------------------------
ggcorrmat(dplyr::starwars)


## ----ggcorrmat_1_copy, eval = FALSE------------------------------------------------------------------------------------
## ggcorrmat(dplyr::starwars)


## ----ggcorrmat_2, eval = FALSE-----------------------------------------------------------------------------------------
## ggcorrmat(
##   data = ggplot2::msleep,
##   cor.vars = sleep_cycle:bodywt,
##   type = "r",
##   matrix.type = "upper", # <<
##   p.adjust.method = "holm"
## )


## ----ggcorrmat_2, ref.label = 'ggcorrmat_2', echo = FALSE--------------------------------------------------------------
ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_cycle:bodywt,
  type = "r",
  matrix.type = "upper", # <<
  p.adjust.method = "holm"
)


## ----gghistostats_1, eval = FALSE--------------------------------------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   test.value = 50, # <<
##   messages = FALSE
## )


## ----gghistostats_1, ref.label = 'gghistostats_1', echo = FALSE--------------------------------------------------------
gghistostats(
  data = movies_long,
  x = budget,
  test.value = 50, # <<
  messages = FALSE
)


## ----gghistostats_2, eval = FALSE--------------------------------------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   effsize.type = "d",
##   test.value = 50,
##   bar.measure = "mix", # <<
##   centrality.para = "median",
##   test.value.line = TRUE, # <<
##   normal.curve = TRUE, # <<
##   ggtheme = hrbrthemes::theme_ipsum_tw(),
##   ggstatsplot.layer = FALSE,
##   messages = FALSE
## )


## ----gghistostats_2, ref.label = 'gghistostats_2', echo = FALSE--------------------------------------------------------
gghistostats(
  data = movies_long,
  x = budget,
  effsize.type = "d",
  test.value = 50,
  bar.measure = "mix", # <<
  centrality.para = "median",
  test.value.line = TRUE, # <<
  normal.curve = TRUE, # <<
  ggtheme = hrbrthemes::theme_ipsum_tw(),
  ggstatsplot.layer = FALSE,
  messages = FALSE
)


## ----gghistostats_2_copy, eval = FALSE---------------------------------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   effsize.type = "d",
##   test.value = 50,
##   test.value.size = TRUE,
##   bar.measure = "mix",
##   centrality.para = "median",
##   test.value.line = TRUE,
##   normal.curve = TRUE
## )


## ----ggdotplotstats_1, eval = FALSE------------------------------------------------------------------------------------
## ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   effsize.type = "d",
##   test.value = 52, # <<
##   centrality.para = "median",
##   test.value.line = TRUE, # <<
##   ggtheme = ggthemes::theme_par(),
##   messages = FALSE
## )


## ----ggdotplotstats_1, ref.label = 'ggdotplotstats_1', echo = FALSE----------------------------------------------------
ggdotplotstats(
  data = movies_long,
  x = budget,
  y = genre,
  effsize.type = "d",
  test.value = 52, # <<
  centrality.para = "median",
  test.value.line = TRUE, # <<
  ggtheme = ggthemes::theme_par(),
  messages = FALSE
)


## ----ggdotplotstats_1_copy, eval = FALSE-------------------------------------------------------------------------------
## ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   effsize.type = "d",
##   test.value = 52,
##   centrality.para = "median",
##   test.value.line = TRUE
## )


## ----ggpiestats_1, eval = FALSE----------------------------------------------------------------------------------------
## # let's use subset of data
## ggpiestats(
##   data = dplyr::filter(
##     .data = movies_long,
##     genre %in% c("Drama", "Comedy", "Animated")
##   ),
##   x = genre,
##   y = mpaa,
##   messages = FALSE
## )


## ----ggpiestats_1, ref.label = 'ggpiestats_1', echo = FALSE------------------------------------------------------------
# let's use subset of data
ggpiestats(
  data = dplyr::filter(
    .data = movies_long,
    genre %in% c("Drama", "Comedy", "Animated")
  ),
  x = genre,
  y = mpaa,
  messages = FALSE
)


## ----ggpiestats_1_copy, eval = FALSE-----------------------------------------------------------------------------------
## # let's use subset of data
## ggpiestats(
##   data = dplyr::filter(
##     movies_long,
##     genre %in% c("Drama", "Comedy", "Animated")
##   ),
##   x = genre,
##   y = mpaa
## )


## ----ggpiestats_2, eval = FALSE----------------------------------------------------------------------------------------
## ggpiestats(
##   data = as.data.frame(Titanic),
##   x = Survived, # <<
##   counts = Freq, # <<
##   slice.label = "both", # <<
##   messages = FALSE
## )


## ----ggpiestats_2, ref.label = 'ggpiestats_2', echo = FALSE------------------------------------------------------------
ggpiestats(
  data = as.data.frame(Titanic),
  x = Survived, # <<
  counts = Freq, # <<
  slice.label = "both", # <<
  messages = FALSE
)


## ----ggbarstats_1, eval = FALSE----------------------------------------------------------------------------------------
## ggbarstats(
##   data = movies_long,
##   x = genre,
##   y = mpaa,
##   package = "ggsci",
##   palette = "default_igv",
##   messages = FALSE
## )


## ----ggbarstats_1, ref.label = 'ggbarstats_1', echo = FALSE------------------------------------------------------------
ggbarstats(
  data = movies_long,
  x = genre,
  y = mpaa,
  package = "ggsci",
  palette = "default_igv",
  messages = FALSE
)


## ----ggbarstats_1_copy, eval = FALSE-----------------------------------------------------------------------------------
## ggbarstats(
##   data = movies_long,
##   x = genre,
##   y = mpaa,
##   package = "ggsci",
##   palette = "default_igv",
##   messages = FALSE
## )


## ----ggcoefstats_1, eval = FALSE---------------------------------------------------------------------------------------
## # model
## mod <- stats::aov(
##   formula = rating ~ mpaa * genre,
##   data = movies_long
## )
## 
## # plot
## ggcoefstats(mod)


## ----ggcoefstats_1, ref.label = 'ggcoefstats_1', echo = FALSE----------------------------------------------------------
# model
mod <- stats::aov(
  formula = rating ~ mpaa * genre,
  data = movies_long
)

# plot
ggcoefstats(mod)


## ----ggcoefstats_1_copy, eval = FALSE----------------------------------------------------------------------------------
## # model
## mod <- stats::aov(
##   formula = rating ~ mpaa * genre,
##   data = movies_long
## )
## 
## # plot
## ggcoefstats(mod)


## ----ggcoefstats_2, results = "hide", fig.show = "hide"----------------------------------------------------------------
# dataframe with results
df <- tibble::tribble(
  ~term, ~estimate, ~std.error, ~statistic, ~p.value,
  "(Intercept)", 3.77, 0.165, 22.9, 1.49e-20,
  "x", -1.36, 0.258, -5.26, 1.13e-5
)

# plot
# `statistic` argument decides label format
ggcoefstats(
  x = df,
  statistic = "z", # <<
  exclude.intercept = FALSE
)


## ----ggcoefstats_3, results = "hide", fig.show = "hide"----------------------------------------------------------------
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
  meta.analytic.effect = TRUE, # <<
  bf.message = TRUE, # <<
  xlab = "estimate"
)


## ----grouped_1, eval = FALSE-------------------------------------------------------------------------------------------
## # only one additional argument
## grouped_ggpiestats(
##   data = mtcars,
##   x = cyl,
##   grouping.var = am, # <<
##   results.subtitle = FALSE, # <<
##   messages = FALSE
## )


## ----grouped_1, ref.label = 'grouped_1', echo = FALSE------------------------------------------------------------------
# only one additional argument
grouped_ggpiestats(
  data = mtcars,
  x = cyl,
  grouping.var = am, # <<
  results.subtitle = FALSE, # <<
  messages = FALSE
)


## ----subtitle_1, eval = FALSE------------------------------------------------------------------------------------------
## # using `ggstatsplot` for stats
## results <-
##   ggstatsplot::ggpiestats(
##     data = Titanic_full,
##     x = Survived,
##     y = Sex,
##     output = "subtitle", # <<
##     messages = FALSE
##   )
## 
## # using `ggiraphExtra` for plot
## ggiraphExtra::ggSpine( # <<
##   data = Titanic_full,
##   aes(x = Sex, fill = Survived),
##   addlabel = TRUE,
##   interactive = FALSE
## ) + labs(subtitle = results) # <<


## ----subtitle_1, ref.label = 'subtitle_1', echo = FALSE----------------------------------------------------------------
# using `ggstatsplot` for stats
results <-
  ggstatsplot::ggpiestats(
    data = Titanic_full,
    x = Survived,
    y = Sex,
    output = "subtitle", # <<
    messages = FALSE
  )

# using `ggiraphExtra` for plot
ggiraphExtra::ggSpine( # <<
  data = Titanic_full,
  aes(x = Sex, fill = Survived),
  addlabel = TRUE,
  interactive = FALSE
) + labs(subtitle = results) # <<


## ----type_p, eval = FALSE----------------------------------------------------------------------------------------------
## # anova
## ggbetweenstats(
##   data = mtcars,
##   x = cyl,
##   y = wt,
##   type = "p" # <<
## )
## 
## # correlation analysis
## ggscatterstats(
##   data = mtcars,
##   x = wt,
##   y = mpg,
##   type = "p" # <<
## )
## 
## # t-test
## gghistostats(
##   data = mtcars,
##   x = wt,
##   test.value = 2,
##   type = "p" # <<
## )


## ----type_np, eval = FALSE---------------------------------------------------------------------------------------------
## # anova
## ggbetweenstats(
##   data = mtcars,
##   x = cyl,
##   y = wt,
##   type = "np" # <<
## )
## 
## # correlation analysis
## ggscatterstats(
##   data = mtcars,
##   x = wt,
##   y = mpg,
##   type = "np" # <<
## )
## 
## # t-test
## gghistostats(
##   data = mtcars,
##   x = wt,
##   test.value = 2,
##   type = "np" # <<
## )

