## ----setup, include = FALSE-------------------------------------------------------------
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


## ----lm, eval = FALSE-------------------------------------------------------------------
## stats::lm(formula = wt ~ mpg, data = mtcars)


## ----cor, eval = FALSE------------------------------------------------------------------
## stats::cor(x = mtcars$wt, y = mtcars$mpg)


## ----cor.test, eval = FALSE-------------------------------------------------------------
## stats::cor.test(formula = ~ wt + mpg, data = mtcars)


## ----utils, eval = FALSE, tidy = FALSE--------------------------------------------------
## install.packages("ggstatsplot")


## ----github, eval = FALSE, tidy = FALSE-------------------------------------------------
## library(remotes)
## remotes::install_github("IndrajeetPatil/ggstatsplot", dependencies = FALSE)


## ----load, eval = TRUE, warning=FALSE---------------------------------------------------
library(ggstatsplot)
library(ggplot2)


## ----ggbetweenstats_1, eval = FALSE-----------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa, # > 2 groups #<<
##   y = rating,
##   type = "p", # default #<<
## )


## ----ggbetweenstats_1, ref.label = 'ggbetweenstats_1', echo = FALSE---------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa, # > 2 groups #<<
  y = rating,
  type = "p", # default #<<
)


## ----ggbetweenstats_2, eval = FALSE-----------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "np", #<<
##   mean.ci = TRUE, #<<
##   pairwise.display = "ns", #<<
##   p.adjust.method = "fdr", #<<
## )


## ----ggbetweenstats_2, ref.label = 'ggbetweenstats_2', echo = FALSE---------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "np", #<<
  mean.ci = TRUE, #<<
  pairwise.display = "ns", #<<
  p.adjust.method = "fdr", #<<
)


## ----ggbetweenstats_3, eval = FALSE-----------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "r", #<<
##   outlier.tagging = TRUE, #<<
##   outlier.label = title, #<<
##   outlier.coef = 2, #<<
##   ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
##   palette = "Darjeeling2", #<<
##   package = "wesanderson", #<<
## )


## ----ggbetweenstats_3, ref.label = 'ggbetweenstats_3', echo = FALSE---------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "r", #<<
  outlier.tagging = TRUE, #<<
  outlier.label = title, #<<
  outlier.coef = 2, #<<
  ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
  palette = "Darjeeling2", #<<
  package = "wesanderson", #<<
)


## ----ggbetweenstats_4, eval = FALSE-----------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "bf", #<<
## ) +
##   scale_y_continuous(sec.axis = dup_axis()) #<<


## ----ggbetweenstats_4, ref.label = 'ggbetweenstats_4', echo = FALSE---------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "bf", #<<
) +
  scale_y_continuous(sec.axis = dup_axis()) #<<


## ----ggbetweenstats_5, eval = FALSE-----------------------------------------------------
## ggbetweenstats(
##   data = mtcars,
##   x = am, # 2 groups #<<
##   y = wt
## )


## ----ggbetweenstats_5, ref.label = 'ggbetweenstats_5', echo = FALSE---------------------
ggbetweenstats(
  data = mtcars,
  x = am, # 2 groups #<<
  y = wt
)


## ----ggwithinstats_1, eval = FALSE------------------------------------------------------
## ggwithinstats(
##   data = WRS2::WineTasting,
##   x = Wine,
##   y = Taste
## )


## ----ggwithinstats_1, ref.label = 'ggwithinstats_1', echo = FALSE-----------------------
ggwithinstats(
  data = WRS2::WineTasting,
  x = Wine,
  y = Taste
)


## ----ggscatterstats_1, eval = FALSE-----------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "p", # default #<<<
## )


## ----ggscatterstats_1, ref.label = 'ggscatterstats_1', echo = FALSE---------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "p", # default #<<<
)


## ----ggscatterstats_2, eval = FALSE-----------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "r",
##   label.var = title, #<<
##   label.expression = budget > 150 #<<
##   & rating > 7.5, #<<
##   marginal.type = "density", #<<
## )


## ----ggscatterstats_2, ref.label = 'ggscatterstats_2', echo = FALSE---------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "r",
  label.var = title, #<<
  label.expression = budget > 150 #<<
  & rating > 7.5, #<<
  marginal.type = "density", #<<
)


## ----ggscatterstats_3, results = "hide", fig.show = "hide"------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  method = "gam", #<<
  formula = y ~ s(x, k = 3) #<<
)


## ----ggcorrmat_1, eval = FALSE----------------------------------------------------------
## ggcorrmat(dplyr::starwars)


## ----ggcorrmat_1, ref.label = 'ggcorrmat_1', echo = FALSE-------------------------------
ggcorrmat(dplyr::starwars)


## ----ggcorrmat_2, eval = FALSE----------------------------------------------------------
## ggcorrmat(
##   data = ggplot2::msleep,
##   cor.vars = sleep_cycle:bodywt,
##   output = "dataframe" #<<
## )


## ----ggcorrmat_2, ref.label = 'ggcorrmat_2', echo = FALSE-------------------------------
ggcorrmat(
  data = ggplot2::msleep,
  cor.vars = sleep_cycle:bodywt,
  output = "dataframe" #<<
)


## ----gghistostats_1, eval = FALSE-------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   test.value = 30, #<<
## )


## ----gghistostats_1, ref.label = 'gghistostats_1', echo = FALSE-------------------------
gghistostats(
  data = movies_long,
  x = budget,
  test.value = 30, #<<
)


## ----ggdotplotstats_1, eval = FALSE-----------------------------------------------------
## ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   effsize.type = "d",
##   test.value = 52, #<<
##   centrality.para = "median",
##   test.value.line = TRUE, #<<
##   ggtheme = ggthemes::theme_par(),
## )


## ----ggdotplotstats_1, ref.label = 'ggdotplotstats_1', echo = FALSE---------------------
ggdotplotstats(
  data = movies_long,
  x = budget,
  y = genre,
  effsize.type = "d",
  test.value = 52, #<<
  centrality.para = "median",
  test.value.line = TRUE, #<<
  ggtheme = ggthemes::theme_par(),
)


## ----ggpiestats_1, eval = FALSE---------------------------------------------------------
## # let's use subset of data
## ggpiestats(
##   data = dplyr::filter(
##     .data = movies_long,
##     genre %in% c("Drama", "Comedy")
##   ),
##   x = mpaa,
##   y = genre
## )


## ----ggpiestats_1, ref.label = 'ggpiestats_1', echo = FALSE-----------------------------
# let's use subset of data
ggpiestats(
  data = dplyr::filter(
    .data = movies_long,
    genre %in% c("Drama", "Comedy")
  ),
  x = mpaa,
  y = genre
)


## ----ggpiestats_2, eval = FALSE---------------------------------------------------------
## ggpiestats(
##   data = as.data.frame(Titanic),
##   x = Survived, #<<
##   counts = Freq, #<<
##   label = "both" #<<
## )


## ----ggpiestats_2, ref.label = 'ggpiestats_2', echo = FALSE-----------------------------
ggpiestats(
  data = as.data.frame(Titanic),
  x = Survived, #<<
  counts = Freq, #<<
  label = "both" #<<
)


## ----ggbarstats_1, eval = FALSE---------------------------------------------------------
## ggbarstats(
##   data = movies_long,
##   x = genre,
##   y = mpaa,
##   package = "ggsci",
##   palette = "default_igv",
## )


## ----ggbarstats_1, ref.label = 'ggbarstats_1', echo = FALSE-----------------------------
ggbarstats(
  data = movies_long,
  x = genre,
  y = mpaa,
  package = "ggsci",
  palette = "default_igv",
)


## ----ggcoefstats_1, eval = FALSE--------------------------------------------------------
## # model
## mod <- stats::aov(
##   formula = rating ~ mpaa * genre,
##   data = movies_long
## )
## 
## # plot
## ggcoefstats(mod)


## ----ggcoefstats_1, ref.label = 'ggcoefstats_1', echo = FALSE---------------------------
# model
mod <- stats::aov(
  formula = rating ~ mpaa * genre,
  data = movies_long
)

# plot
ggcoefstats(mod)


## ----ggcoefstats_2, eval = FALSE--------------------------------------------------------
## # dataframe with results
## df <-
##   broom::tidy(
##     x = stats::lm(wt ~ am * cyl, mtcars),
##     conf.int = TRUE
##   )
## 
## # plot
## # `statistic` argument decides label format
## ggcoefstats(
##   x = df,
##   statistic = "t" #<<
## )


## ----ggcoefstats_2, ref.label = 'ggcoefstats_2', echo = FALSE---------------------------
# dataframe with results
df <-
  broom::tidy(
    x = stats::lm(wt ~ am * cyl, mtcars),
    conf.int = TRUE
  )

# plot
# `statistic` argument decides label format
ggcoefstats(
  x = df,
  statistic = "t" #<<
)


## ----ggcoefstats_3, eval = FALSE--------------------------------------------------------
## # made up data
## meta_df <-
##   tibble::tribble(
##     ~term, ~estimate, ~std.error,
##     "study_1", 0.111, 0.065,
##     "study_2", -0.003, 0.258,
##     "study_3", 0.001, 0.120,
##     "study_4", 0.032, 0.022,
##     "study_5", -0.765, 0.650
##   )
## 
## # plot
## ggcoefstats(
##   x = meta_df,
##   meta.analytic.effect = TRUE, #<<
##   stats.labels = FALSE,
##   bf.message = FALSE,
##   conf.int = FALSE
## )


## ----ggcoefstats_3, ref.label = 'ggcoefstats_3', echo = FALSE---------------------------
# made up data
meta_df <-
  tibble::tribble(
    ~term, ~estimate, ~std.error,
    "study_1", 0.111, 0.065,
    "study_2", -0.003, 0.258,
    "study_3", 0.001, 0.120,
    "study_4", 0.032, 0.022,
    "study_5", -0.765, 0.650
  )

# plot
ggcoefstats(
  x = meta_df,
  meta.analytic.effect = TRUE, #<<
  stats.labels = FALSE,
  bf.message = FALSE,
  conf.int = FALSE
)


## ----grouped_1, eval = FALSE------------------------------------------------------------
## # only one additional argument
## grouped_ggpiestats(
##   data = mtcars,
##   x = cyl,
##   grouping.var = am, #<<
##   results.subtitle = FALSE, #<<
## )


## ----grouped_1, ref.label = 'grouped_1', echo = FALSE-----------------------------------
# only one additional argument
grouped_ggpiestats(
  data = mtcars,
  x = cyl,
  grouping.var = am, #<<
  results.subtitle = FALSE, #<<
)


## ----subtitle_1, eval = FALSE-----------------------------------------------------------
## # using `ggstatsplot` for stats
## results <-
##   ggstatsplot::ggpiestats(
##     data = Titanic_full,
##     x = Survived,
##     y = Sex,
##     output = "subtitle", #<<
##   )
## 
## # using `ggiraphExtra` for plot
## ggiraphExtra::ggSpine( #<<
##   data = Titanic_full,
##   aes(x = Sex, fill = Survived),
##   addlabel = TRUE,
##   interactive = FALSE
## ) + labs(subtitle = results) #<<


## ----subtitle_1, ref.label = 'subtitle_1', echo = FALSE---------------------------------
# using `ggstatsplot` for stats
results <-
  ggstatsplot::ggpiestats(
    data = Titanic_full,
    x = Survived,
    y = Sex,
    output = "subtitle", #<<
  )

# using `ggiraphExtra` for plot
ggiraphExtra::ggSpine( #<<
  data = Titanic_full,
  aes(x = Sex, fill = Survived),
  addlabel = TRUE,
  interactive = FALSE
) + labs(subtitle = results) #<<


## ----type_p, eval = FALSE---------------------------------------------------------------
## # anova
## ggbetweenstats(
##   data = mtcars,
##   x = cyl,
##   y = wt,
##   type = "p" #<<
## )
## 
## # correlation analysis
## ggscatterstats(
##   data = mtcars,
##   x = wt,
##   y = mpg,
##   type = "p" #<<
## )
## 
## # t-test
## gghistostats(
##   data = mtcars,
##   x = wt,
##   test.value = 2,
##   type = "p" #<<
## )


## ----type_np, eval = FALSE--------------------------------------------------------------
## # anova
## ggbetweenstats(
##   data = mtcars,
##   x = cyl,
##   y = wt,
##   type = "np" #<<
## )
## 
## # correlation analysis
## ggscatterstats(
##   data = mtcars,
##   x = wt,
##   y = mpg,
##   type = "np" #<<
## )
## 
## # t-test
## gghistostats(
##   data = mtcars,
##   x = wt,
##   test.value = 2,
##   type = "np" #<<
## )

