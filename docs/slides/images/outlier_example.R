
library(ggstatsplot)
here::here()

set.seed(123)
df <-
  data.frame(
    group = c(rep("drug", 20), rep("control", 20)),
    weight = c(c(rnorm(20, mean = 24)), c(rnorm(14, mean = 24), 80, 87, 85, 45, 55, 150))
  )

ggplot2::ggsave(ggbetweenstats(df, group, weight, type = "p"),
  filename = paste0(here::here(), "/docs/slides/images/after_ggstats.PNG")
)

ggbetweenstats(df, group, weight, type = "r")
