
library(ggstatsplot)
library(datasauRus)
here::here()

set.seed(123)
df <- dplyr::filter(datasaurus_dozen, dataset == "dino")


ggplot2::ggsave(ggscatterstats(df, x, y, type = "p",
                               ggtheme = hrbrthemes::theme_ipsum_tw(),
                               title = "Relationship between x and y"),
  filename = paste0(here::here(), "/docs/slides/images/after_ggstats.PNG"),
  height = 5,
  width = 6,
  units = "in"
)
