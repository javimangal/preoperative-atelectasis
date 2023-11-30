
# Create a data frame with possible combinations. 
# Confounders will be set either to their mean value or reference category
df_pred <- expand_grid(
  BMI = seq(
    from=min(data$BMI),
    to=max(data$BMI),
    length.out = 100
  ),
  atelectasis_percent = seq(
    from=min(data$atelectasis_percent),
    to=max(data$atelectasis_percent),
    length.out = 100), 
  age = mean(data$age),
  hb = mean(data$hb, na.rm = TRUE),
  sex = "Woman",
  sleep_apnea = "No",
  altitude_cat = "Low altitude"
)

# Obtain predictions from the fully adjusted model:   
df_pred <- predict(model_plus, 
                   newdata = df_pred, 
                   se.fit = TRUE,
                   type = "response"
) %>%  
  as_tibble() %>% 
  mutate(
    fit = fit*100
  ) %>% 
  cbind(df_pred) 

# Create a 2D plot for predictions:   
predictions_plot <- ggplot(data=df_pred, aes(x=BMI, y=atelectasis_percent)) +
  geom_tile(aes(fill = fit)) +
  scale_fill_distiller(
    palette = "Greys", 
    name = expression(atop("Predicted","SpO2 (%)"))
  ) +
  geom_contour2(
    aes(z = fit, color = after_stat(level)),
    bins = 9
  ) + 
  scale_colour_gradientn(
    colors = brewer.pal(9, "BuGn"), 
    guide = "none"
  ) +
  geom_text_contour(
    aes(z = fit),
    rotate = F,
    stroke = 0.1,
    skip = 0,
    label.placer = label_placer_fraction(
      frac = 0.8,
      rot_adjuster = isoband::angle_halfcircle_bottom()
    )
  ) +
  labs(x="Body mass index (kg/m²)", 
       y = "Atelectasis percent (%)", 
       tag = "A"
  ) +
  theme_bw() +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(size=rel(1.2)), 
        axis.text.y = element_text(size=rel(1.2))
  )

# Create a plot with predictions that shows the actual observed values:  
observed_plot <- ggplot(data=df_pred, aes(x=BMI, y=atelectasis_percent)) +
  geom_tile(aes(fill = fit)) +
  scale_fill_distiller(
    palette = "Greys", 
    guide = "none") + 
  scale_colour_gradientn(
    colors = brewer.pal(9, "BuGn"), 
    name = expression(atop("Observed","SpO2 (%)"))
  ) +
  geom_point(
    data=data,
    aes(x=BMI,
        y=atelectasis_percent,
        color = spo2_VPO),
    shape = 20
  ) +
  labs(x="Body mass index (kg/m²)", 
       y = "Atelectasis percent (%)",
       tag = "B"
  ) +
  theme_bw() +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(size=rel(1.2)), 
        axis.text.y = element_text(size=rel(1.2))
  )

# Arrange together in grid   
Figure3 <- grid.arrange(predictions_plot, observed_plot, nrow=1)

# Save figure 3   
ggsave("Figure3.png",plot=Figure3,
       path=figfolder, 
       width = 18,  height = 6, units = "in", 
       dpi = 300)

ggsave("Figure3.pdf",plot=Figure3,
       path=figfolder, 
       width = 18,  height = 6, units = "in", 
       dpi = 300)

# Rebuild plot and stack them
png(filename=paste(figfolder,"/FigureS4.png",sep=""),width=8, height=6, units="in", res=300)
vis.gam(model_plus,
        view=c("BMI","atelectasis_percent"),
        color = "gray",
        type = "response",
        plot.type = "persp",
        theta= -50,
        ylab = "Atelectasis percent",
        xlab = "Body mass index",
        zlab = "SpO2",
        main = "Predicted SpO2"
)
dev.off()
