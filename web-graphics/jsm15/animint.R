library(animint)
p <- qplot(data = iris, x = Sepal.Width, y = Sepal.Length, color = Species)
animint2dir(list(p = p), out.dir = "animint", open.browser = FALSE)

# center the plot (we should rally have an option for this)
index <- readLines("animint/index.html")
index <- sub("<div id=\"plot\"> </div>", 
             "<div id=\"plot\" align=\"center\"> </div>", index)
writeLines(index, "animint/index.html")
