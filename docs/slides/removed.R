layout: true

# ggcoefstats: If not implemented, use a dataframe

---

  .left-code[
    ```{r ggcoefstats_2, eval = FALSE}
    library(parameters)

    # dataframe with results
    df <-
      model_parameters(lm(wt ~ cyl, mtcars)) %>%
      standardize_names(., "broom")

    # `statistic` argument decides label format
    ggstatsplot::ggcoefstats(
      x = df,
      statistic = "t" #<<
    )
    ```

    .font70[
      Supported statistic:
        - $t$
        - $z$
        - $F$
        - $\chi^2$

        At the minimum, one
      column needed - <font color="blue">estimate</font>.
    ]

  ]

.right-plot[
  ```{r ggcoefstats_2, ref.label = 'ggcoefstats_2', echo = FALSE}
  ```
]

---
