## ----setup, include = FALSE---------------------------------------------------------------------------------------------------------
future::plan("multicore")
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


## ----lm, eval = FALSE---------------------------------------------------------------------------------------------------------------
## stats::lm(formula = wt ~ mpg, data = mtcars)


## ----cor, eval = FALSE--------------------------------------------------------------------------------------------------------------
## stats::cor(x = mtcars$wt, y = mtcars$mpg)


## ----cor.test, eval = FALSE---------------------------------------------------------------------------------------------------------
## stats::cor.test(formula = ~ wt + mpg, data = mtcars)


## ----utils, eval = FALSE, tidy = FALSE----------------------------------------------------------------------------------------------
## install.packages("ggstatsplot")


## ----github, eval = FALSE, tidy = FALSE---------------------------------------------------------------------------------------------
## remotes::install_github("IndrajeetPatil/ggstatsplot")


## ----load, eval = TRUE, warning=FALSE-----------------------------------------------------------------------------------------------
library(ggstatsplot)
library(ggplot2)


## ----ggbetweenstats_1, eval = FALSE-------------------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating
## )


## ----ggbetweenstats_1, ref.label = 'ggbetweenstats_1', echo = FALSE-----------------------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating
)


## ----ggbetweenstats_2, eval = FALSE-------------------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "np", #<<
##   pairwise.display = "ns" #<<
## )


## ----ggbetweenstats_2, ref.label = 'ggbetweenstats_2', echo = FALSE-----------------------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "np", #<<
  pairwise.display = "ns" #<<
)


## ----ggbetweenstats_3, eval = FALSE-------------------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "r",
##   outlier.tagging = TRUE, #<<
##   outlier.label = title #<<
## )


## ----ggbetweenstats_3, ref.label = 'ggbetweenstats_3', echo = FALSE-----------------------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "r",
  outlier.tagging = TRUE, #<<
  outlier.label = title #<<
)


## ----ggwithinstats_1, eval = FALSE--------------------------------------------------------------------------------------------------
## ggwithinstats(
##   data = WRS2::WineTasting,
##   x = Wine,
##   y = Taste
## )


## ----ggwithinstats_1, ref.label = 'ggwithinstats_1', echo = FALSE-------------------------------------------------------------------
ggwithinstats(
  data = WRS2::WineTasting,
  x = Wine,
  y = Taste
)


## ----gghistostats_1, eval = FALSE---------------------------------------------------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   test.value = 30 #<<
## )


## ----gghistostats_1, ref.label = 'gghistostats_1', echo = FALSE---------------------------------------------------------------------
gghistostats(
  data = movies_long,
  x = budget,
  test.value = 30 #<<
)


## ----ggdotplotstats_1, eval = FALSE-------------------------------------------------------------------------------------------------
## ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   test.value = 30 #<<
## )


## ----ggdotplotstats_1, ref.label = 'ggdotplotstats_1', echo = FALSE-----------------------------------------------------------------
ggdotplotstats(
  data = movies_long,
  x = budget,
  y = genre,
  test.value = 30 #<<
)


## ----ggscatterstats_1, eval = FALSE-------------------------------------------------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating
## )


## ----ggscatterstats_1, ref.label = 'ggscatterstats_1', echo = FALSE-----------------------------------------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating
)


## ----ggscatterstats_2, eval = FALSE-------------------------------------------------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "r",
##   label.var = title, #<<
##   label.expression = budget > 150 #<<
##   & rating > 7.5, #<<
##   marginal.type = "boxplot" #<<
## )


## ----ggscatterstats_2, ref.label = 'ggscatterstats_2', echo = FALSE-----------------------------------------------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "r",
  label.var = title, #<<
  label.expression = budget > 150 #<<
  & rating > 7.5, #<<
  marginal.type = "boxplot" #<<
)


## ----ggcorrmat_1, eval = FALSE------------------------------------------------------------------------------------------------------
## ggcorrmat(dplyr::starwars)


## ----ggcorrmat_1, ref.label = 'ggcorrmat_1', echo = FALSE---------------------------------------------------------------------------
ggcorrmat(dplyr::starwars)


## ----ggcorrmat_2--------------------------------------------------------------------------------------------------------------------
library(ggplot2) # for data

ggcorrmat(
  data = dplyr::select(msleep, sleep_rem, awake, brainwt),
  type = "bf",
  output = "dataframe" #<<
)


## ----ggpiestats_1, eval = FALSE-----------------------------------------------------------------------------------------------------
## ggpiestats(
##   data = as.data.frame(Titanic),
##   x = Class,
##   counts = Freq, #<<
##   label = "both" #<<
## )


## ----ggpiestats_1, ref.label = 'ggpiestats_1', echo = FALSE-------------------------------------------------------------------------
ggpiestats(
  data = as.data.frame(Titanic),
  x = Class,
  counts = Freq, #<<
  label = "both" #<<
)


## ----ggpiestats_2, eval = FALSE-----------------------------------------------------------------------------------------------------
## # let's use subset of data
## ggpiestats(
##   data = dplyr::filter(
##     .data = movies_long,
##     genre %in% c("Drama", "Comedy")
##   ),
##   x = mpaa,
##   y = genre
## )


## ----ggpiestats_2, ref.label = 'ggpiestats_2', echo = FALSE-------------------------------------------------------------------------
# let's use subset of data
ggpiestats(
  data = dplyr::filter(
    .data = movies_long,
    genre %in% c("Drama", "Comedy")
  ),
  x = mpaa,
  y = genre
)


## ----ggbarstats_1, eval = FALSE-----------------------------------------------------------------------------------------------------
## ggbarstats(
##   data = dplyr::filter(
##     .data = movies_long,
##     genre %in% c("Drama", "Comedy")
##   ),
##   x = mpaa,
##   y = genre
## )


## ----ggbarstats_1, ref.label = 'ggbarstats_1', echo = FALSE-------------------------------------------------------------------------
ggbarstats(
  data = dplyr::filter(
    .data = movies_long,
    genre %in% c("Drama", "Comedy")
  ),
  x = mpaa,
  y = genre
)


## ----ggcoefstats_1, eval = FALSE----------------------------------------------------------------------------------------------------
## # model
## mod <- stats::lm(
##   formula = rating ~ mpaa,
##   data = movies_long
## )
## 
## # plot
## ggcoefstats(mod)


## ----ggcoefstats_1, ref.label = 'ggcoefstats_1', echo = FALSE-----------------------------------------------------------------------
# model
mod <- stats::lm(
  formula = rating ~ mpaa,
  data = movies_long
)

# plot
ggcoefstats(mod)


## ----grouped_1, eval = FALSE--------------------------------------------------------------------------------------------------------
## grouped_ggpiestats(
##   data = mtcars,
##   x = cyl,
##   grouping.var = am #<<
## )


## ----grouped_1, ref.label = 'grouped_1', echo = FALSE-------------------------------------------------------------------------------
grouped_ggpiestats(
  data = mtcars,
  x = cyl,
  grouping.var = am #<<
)


## ----ggbetweenstats_4, eval = FALSE-------------------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   results.subtitle = FALSE,
##   ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
##   palette = "Darjeeling2", #<<
##   package = "wesanderson" #<<
## )


## ----ggbetweenstats_4, ref.label = 'ggbetweenstats_4', echo = FALSE-----------------------------------------------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  results.subtitle = FALSE,
  ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
  palette = "Darjeeling2", #<<
  package = "wesanderson" #<<
)


## ----ggbetweenstats_5, eval = FALSE-------------------------------------------------------------------------------------------------
## ggbetweenstats(
##   data = mtcars,
##   x = am,
##   y = wt,
##   type = "bf"
## ) +
##   scale_y_continuous(sec.axis = dup_axis()) #<<


## ----ggbetweenstats_5, ref.label = 'ggbetweenstats_5', echo = FALSE-----------------------------------------------------------------
ggbetweenstats(
  data = mtcars,
  x = am,
  y = wt,
  type = "bf"
) +
  scale_y_continuous(sec.axis = dup_axis()) #<<


## ----subtitle_1, eval = FALSE-------------------------------------------------------------------------------------------------------
## # using `ggstatsplot` for stats
## results <-
##   ggstatsplot::ggpiestats(
##     data = Titanic_full,
##     x = Survived,
##     y = Sex,
##     output = "subtitle" #<<
##   )
## 
## # using `ggiraphExtra` for plot
## ggiraphExtra::ggSpine( #<<
##   data = Titanic_full,
##   aes(x = Sex, fill = Survived),
##   addlabel = TRUE,
##   interactive = FALSE
## ) + labs(subtitle = results) #<<


## ----subtitle_1, ref.label = 'subtitle_1', echo = FALSE-----------------------------------------------------------------------------
# using `ggstatsplot` for stats
results <-
  ggstatsplot::ggpiestats(
    data = Titanic_full,
    x = Survived,
    y = Sex,
    output = "subtitle" #<<
  )

# using `ggiraphExtra` for plot
ggiraphExtra::ggSpine( #<<
  data = Titanic_full,
  aes(x = Sex, fill = Survived),
  addlabel = TRUE,
  interactive = FALSE
) + labs(subtitle = results) #<<


## ----type_p, eval = FALSE-----------------------------------------------------------------------------------------------------------
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


## ----type_np, eval = FALSE----------------------------------------------------------------------------------------------------------
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

