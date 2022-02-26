## ----setup, include=FALSE---------------------------------------------------------------
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


## ----xaringanExtra-search, echo=FALSE---------------------------------------------------
xaringanExtra::use_search(show_icon = TRUE)


## ----utils, eval=FALSE------------------------------------------------------------------
## install.packages("ggstatsplot")


## ----github, eval=FALSE-----------------------------------------------------------------
## remotes::install_github("IndrajeetPatil/ggstatsplot")


## ----load, eval=TRUE, warning=FALSE-----------------------------------------------------
library(ggstatsplot)
library(ggplot2)


## ----ggbetweenstats_1, eval=FALSE-------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating
## )


## ----ggbetweenstats_1, ref.label='ggbetweenstats_1', echo=FALSE-------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating
)


## ----ggbetweenstats_2, eval=FALSE-------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   type = "r", #<<
##   outlier.tagging = TRUE, #<<
##   outlier.label = title #<<
## )


## ----ggbetweenstats_2, ref.label='ggbetweenstats_2', echo=FALSE-------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  type = "r", #<<
  outlier.tagging = TRUE, #<<
  outlier.label = title #<<
)


## ----ggwithinstats_1, eval=FALSE--------------------------------------------------------
## ggwithinstats(
##   data = WRS2::WineTasting,
##   x = Wine,
##   y = Taste
## )


## ----ggwithinstats_1, ref.label='ggwithinstats_1', echo=FALSE---------------------------
ggwithinstats(
  data = WRS2::WineTasting,
  x = Wine,
  y = Taste
)


## ----gghistostats_1, eval=FALSE---------------------------------------------------------
## gghistostats(
##   data = movies_long,
##   x = budget,
##   test.value = 30 #<<
## )


## ----gghistostats_1, ref.label='gghistostats_1', echo=FALSE-----------------------------
gghistostats(
  data = movies_long,
  x = budget,
  test.value = 30 #<<
)


## ----ggdotplotstats_1, eval=FALSE-------------------------------------------------------
## ggdotplotstats(
##   data = movies_long,
##   x = budget,
##   y = genre,
##   test.value = 30 #<<
## )


## ----ggdotplotstats_1, ref.label='ggdotplotstats_1', echo=FALSE-------------------------
ggdotplotstats(
  data = movies_long,
  x = budget,
  y = genre,
  test.value = 30 #<<
)


## ----ggscatterstats_1, eval=FALSE-------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating
## )


## ----ggscatterstats_1, ref.label='ggscatterstats_1', echo=FALSE-------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating
)


## ----ggscatterstats_2, eval=FALSE-------------------------------------------------------
## ggscatterstats(
##   data = movies_long,
##   x = budget,
##   y = rating,
##   type = "r",
##   label.var = title, #<<
##   label.expression = budget > 150 #<<
##   & rating > 7.5 #<<
## )


## ----ggscatterstats_2, ref.label='ggscatterstats_2', echo=FALSE-------------------------
ggscatterstats(
  data = movies_long,
  x = budget,
  y = rating,
  type = "r",
  label.var = title, #<<
  label.expression = budget > 150 #<<
  & rating > 7.5 #<<
)


## ----ggcorrmat_1, eval=FALSE------------------------------------------------------------
## ggcorrmat(dplyr::starwars)


## ----ggcorrmat_1, ref.label='ggcorrmat_1', echo=FALSE-----------------------------------
ggcorrmat(dplyr::starwars)


## ----ggpiestats_2, eval=FALSE-----------------------------------------------------------
## ggpiestats(
##   data = dplyr::filter(
##     movies_long,
##     genre %in% c("Drama", "Comedy")
##   ),
##   x = mpaa,
##   y = genre
## )


## ----ggpiestats_2, ref.label='ggpiestats_2', echo=FALSE---------------------------------
ggpiestats(
  data = dplyr::filter(
    movies_long,
    genre %in% c("Drama", "Comedy")
  ),
  x = mpaa,
  y = genre
)


## ----ggbarstats_1, eval=FALSE-----------------------------------------------------------
## ggbarstats(
##   data = dplyr::filter(
##     movies_long,
##     genre %in% c("Drama", "Comedy")
##   ),
##   x = mpaa,
##   y = genre,
##   label = "both" #<<
## )


## ----ggbarstats_1, ref.label='ggbarstats_1', echo=FALSE---------------------------------
ggbarstats(
  data = dplyr::filter(
    movies_long,
    genre %in% c("Drama", "Comedy")
  ),
  x = mpaa,
  y = genre,
  label = "both" #<<
)


## ----ggcoefstats_1, eval=FALSE----------------------------------------------------------
## # model
## mod <- lm(
##   formula = rating ~ mpaa,
##   data = movies_long
## )
## 
## # plot
## ggcoefstats(mod)


## ----ggcoefstats_1, ref.label='ggcoefstats_1', echo=FALSE-------------------------------
# model
mod <- lm(
  formula = rating ~ mpaa,
  data = movies_long
)

# plot
ggcoefstats(mod)


## ----grouped_1, eval=FALSE--------------------------------------------------------------
## grouped_ggpiestats(
##   data = mtcars,
##   x = cyl,
##   grouping.var = am #<<
## )


## ----grouped_1, ref.label='grouped_1', echo=FALSE---------------------------------------
grouped_ggpiestats(
  data = mtcars,
  x = cyl,
  grouping.var = am #<<
)


## ----ggbetweenstats_4, eval=FALSE-------------------------------------------------------
## ggbetweenstats(
##   data = movies_long,
##   x = mpaa,
##   y = rating,
##   ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
##   palette = "Darjeeling2", #<<
##   package = "wesanderson" #<<
## )


## ----ggbetweenstats_4, ref.label='ggbetweenstats_4', echo=FALSE-------------------------
ggbetweenstats(
  data = movies_long,
  x = mpaa,
  y = rating,
  ggtheme = hrbrthemes::theme_ipsum_tw(), #<<
  palette = "Darjeeling2", #<<
  package = "wesanderson" #<<
)


## ----ggbetweenstats_5, eval=FALSE-------------------------------------------------------
## ggbetweenstats(
##   data = mtcars,
##   x = am,
##   y = wt,
##   type = "bayes"
## ) +
##   scale_y_continuous(sec.axis = dup_axis()) #<<


## ----ggbetweenstats_5, ref.label='ggbetweenstats_5', echo=FALSE-------------------------
ggbetweenstats(
  data = mtcars,
  x = am,
  y = wt,
  type = "bayes"
) +
  scale_y_continuous(sec.axis = dup_axis()) #<<


## ----only_plot, eval=FALSE--------------------------------------------------------------
## ggbetweenstats(
##   data = iris,
##   x = Species,
##   y = Sepal.Length,
##   # turn off centrality measure
##   centrality.plotting = FALSE, #<<
##   # turn off statistical analysis
##   results.subtitle = FALSE, #<<
##   # turn off Bayesian message
##   bf.message = FALSE, #<<
##   # turn off pairwise comparisons
##   pairwise.comparisons = FALSE #<<
## )


## ----only_plot, ref.label='only_plot', echo=FALSE---------------------------------------
ggbetweenstats(
  data = iris,
  x = Species,
  y = Sepal.Length,
  # turn off centrality measure
  centrality.plotting = FALSE, #<<
  # turn off statistical analysis
  results.subtitle = FALSE, #<<
  # turn off Bayesian message
  bf.message = FALSE, #<<
  # turn off pairwise comparisons
  pairwise.comparisons = FALSE #<<
)


## ----subtitle_1, eval=FALSE-------------------------------------------------------------
## results <- ggpiestats(
##     data = Titanic_full,
##     x = Survived,
##     y = Sex,
##     output = "subtitle" #<<
##   )
## 
## ggiraphExtra::ggSpine( #<<
##   data = Titanic_full,
##   aes(x = Sex, fill = Survived),
##   addlabel = TRUE,
##   interactive = FALSE
## ) +
##   labs(subtitle = results) #<<


## ----subtitle_1, ref.label='subtitle_1', echo=FALSE-------------------------------------
results <- ggpiestats(
    data = Titanic_full,
    x = Survived,
    y = Sex,
    output = "subtitle" #<<
  )

ggiraphExtra::ggSpine( #<<
  data = Titanic_full,
  aes(x = Sex, fill = Survived),
  addlabel = TRUE,
  interactive = FALSE
) +
  labs(subtitle = results) #<<


## ---- eval=FALSE, df.print="tibble"-----------------------------------------------------
## library(statsExpressions)
## 
## # for example
## one_sample_test(
##   data = mtcars,
##   x = wt,
##   test.value = 3
## )


## ----type_p, eval=FALSE-----------------------------------------------------------------
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


## ----type_np, eval=FALSE----------------------------------------------------------------
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

