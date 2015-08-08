library(plotly)
p <- qplot(data = iris, x = Sepal.Width, y = Sepal.Length, color = Species)
p %>% ggplotly() %>% offline(height = 550, width = 800, out_dir = "plotly1")


plot_ly(economics, x = date, y = uempmed, mode = "markers") %>%
  add_trace(y = fitted(forecast::Arima(uempmed, c(1,0,1))), mode = "lines") %>%
  dplyr::filter(uempmed == max(uempmed)) %>%
  layout(annotations = list(x = date, y = uempmed, text = "Peak", showarrow = T),
         title = "Median duration of unemployment (in weeks)", showlegend = F) %>%
  offline(width = 900, out_dir = "plotly2")

plot_ly(z = volcano, type = "surface") %>% 
  offline(height = 500, width = 800, out_dir = "plotly3")

# # center the plot (we should rally have an option for this)
# index <- readLines("plotly1/index.html")
# nhead <- grep("<head", index)
# stopifnot(length(nhead) == 1)
# index <- c(
#   index[seq(1, nhead)], 
#   "<style> 
#     div { 
#      align:center; 
#     } 
#   </style>",
#   index[seq(nhead + 1, length(index))]
# )
# writeLines(index, "animint/index.html")
