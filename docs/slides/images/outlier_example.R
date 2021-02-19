
library(ggstatsplot)
here::here()

set.seed(123)
df <-
  data.frame(
    group = c(rep("drug", 20), rep("control", 20)),
    weight = c(c(rnorm(20, mean = 24)), c(rnorm(14, mean = 24), 80, 87, 85, 45, 55, 150))
  )

ggplot2::ggsave(ggbetweenstats(df, group, weight, type = "p",
                               ggtheme = hrbrthemes::theme_ipsum_tw(),
                               title = "Effect of intervention on weight"),
  filename = paste0(here::here(), "/docs/slides/images/after_ggstats.PNG"),
  height = 5,
  width = 6,
  units = "in"
)

ggbetweenstats(df, group, weight, type = "r",
               ggtheme = hrbrthemes::theme_ipsum_tw(),
               title = "Effect of intervention on weight")
