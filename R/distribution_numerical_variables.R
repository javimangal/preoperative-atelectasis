for (variable in names(data)) {
  if (is.numeric(data[[variable]])) {
    name <- variable

    Main <- paste("Histogram of", variable, sep = " ")
    hist(data[[variable]],
      xlab = name, main = Main,
      col = "steelblue"
    )

    Main <- paste("Boxplot of", variable, sep = " ")
    boxplot(data[[variable]],
      xlab = name, main = Main,
      horizontal = TRUE,
      col = "steelblue"
    )

    Main <- paste("Normal Q-Q Plot of", variable, sep = " ")
    qqnorm(data[[variable]], main = Main)
    qqline(data[[variable]], col = "steelblue", lwd = 2)
  }
}

rm(variable, Main, name)
