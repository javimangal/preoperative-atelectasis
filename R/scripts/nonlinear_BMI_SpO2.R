### BMI and SpO2

# GAM model with k=2:
model <- gam(spo2_VPO ~ s(BMI, k = 2))
AIC_k2 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=4:
model <- gam(spo2_VPO ~ s(BMI, k = 4))
AIC_k4 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=6:
model <- gam(spo2_VPO ~ s(BMI, k = 6))
AIC_k6 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=8:
model <- gam(spo2_VPO ~ s(BMI, k = 8))
AIC_k8 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=12:
model <- gam(spo2_VPO ~ s(BMI, k = 12))
AIC_k12 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# All models are significantly better than linear.
# Using a smooth term for BMI is better than modelling linear relationship.

# Regarding AIC, the models with k>6 are not better at explaining the variance.
# Will try a model with k=5 since the best model is expected to be anywhere
# between k=4 and k=6:


# GAM model with k=5 (4 degrees of freedom):
model <- gam(spo2_VPO ~ s(BMI, k = 5))
AIC_k5 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# Model with k=5 still offers and advantage compared to k=4 (drop in AIC).
# No improvements in k-index or visual representation achieved with higher k.
# Thus, I will use k=5 to model.

### Create figure:
fig1b <- ggplot(data, aes(BMI, spo2_VPO)) +
  geom_point(size = 0.6, color = "gray60") +
  geom_smooth(
    method = "gam",
    formula = y ~ s(x, bs = "cs", k = 5),
    color = "cadetblue4"
  ) +
  labs(
    y = "SpO2 (%)",
    x = "Body mass index (kg/m²)"
  ) +
  ylim(83, 100) +
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
