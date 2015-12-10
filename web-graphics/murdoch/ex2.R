library(tourbrush)
vars <- c("pitch_type", "start_speed", "spin_dir", "break_y",
          "break_angle", "break_length")
y <- subset(yu, pitch_type %in% c("CU", "FF", "SL"))
set.seed(107)
y <- y[sample(nrow(y), 1000), ] 
tourbrush(y[vars])
