distribution_plots <- function(data){
  #' @title Distribution plots
  #' @description This function takes every  
  #' numeric variable in a dataframe 
  #' and creates histograms, boxplots, 
  #' and Q-Q plots.  
  #' @param data The first value
  #' @return The two arguments multiplied.
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
}

