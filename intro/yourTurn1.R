library(ggplot2)
l <- loess(unemploy / pop ~ as.numeric(date), economics)
economics$yhat <- l$fitted
ggplot(economics) + 
  geom_line(aes(date, unemploy / pop)) +
  geom_line(aes(date, yhat), color = "blue")
