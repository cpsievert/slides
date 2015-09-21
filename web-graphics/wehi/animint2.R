data(tips, package = "reshape2")
tips$sex_smoker <- with(tips, interaction(sex, smoker))

library(animint)
p1 <- ggplot() + theme(legend.position = "none") +
  geom_point(data = tips, 
             aes(x = sex, y = smoker, 
                 clickSelects = sex_smoker, colour = sex_smoker),
             position = "jitter")
p2 <- ggplot() +
  geom_point(data = tips, 
             aes(x = total_bill, y = tip, 
                 showSelected = sex_smoker, colour = sex_smoker))
plots <- list(
  plot1 = p1, 
  plot2 = p2,
  selector.types = list(sex_smoker = "multiple")
)
animint2dir(plots, "animint2")
