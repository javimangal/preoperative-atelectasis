### BMI and Atelectasis Percent

# GAM model with k=2:
model <- gam(atelectasis_percent ~ s(BMI, k = 2))
AIC_k2 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=4:
model <- gam(atelectasis_percent ~ s(BMI, k = 4))
AIC_k4 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=6:
model <- gam(atelectasis_percent ~ s(BMI, k = 6))
AIC_k6 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)

# GAM model with k=8:
model <- gam(atelectasis_percent ~ s(BMI, k = 8))
AIC_k8 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# All models are significantly better than linear. Thus, using a smooth
# term for BMI to predict atelectasis percent is better than modelling
# a linear relationship.

# Regarding AIC, greatest improvement in AIC is k=6.
# Will model with k=5 and k=7 to compare

# GAM model with k=5:
model <- gam(atelectasis_percent ~ s(BMI, k = 5))
AIC_k5 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)

# GAM model with k=7:
model <- gam(atelectasis_percent ~ s(BMI, k = 7))
AIC_k7 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)

# k=6 offers the lowest AIC. Will keep k=6 to model.


fig1a <- ggplot(data, aes(BMI, atelectasis_percent)) +
  geom_point(size = 0.6, color = "gray60") +
  geom_smooth(
    method = "gam",
    formula = y ~ s(x, bs = "cs", k = 6),
    color = "darkblue"
  ) +
  labs(
    y = "Atelectasis percent (%)",
    x = "Body mass index (kg/m²)"
  ) +
  xlim(30, 80) +
  theme_bw() +
  theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "black"),
    axis.text.x = element_text(size = rel(1.2)),
    axis.text.y = element_text(size = rel(1.2))
  )
