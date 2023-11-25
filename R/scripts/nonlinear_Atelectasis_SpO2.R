### Atelectasis Percent and SpO2 

# GAM model with k=2:   
model<-gam(spo2_VPO~s(atelectasis_percent,k=2))
AIC_k2 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)

# GAM model with k=4:   
model<-gam(spo2_VPO~s(atelectasis_percent,k=4))
AIC_k4 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=6:   
model<-gam(spo2_VPO~s(atelectasis_percent,k=6))
AIC_k6 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


#GAM model with k=8:   
model<-gam(spo2_VPO~s(atelectasis_percent,k=8))
AIC_k8 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# GAM model with k=5:   
model<-gam(spo2_VPO~s(atelectasis_percent,k=5))
AIC_k5 <- AIC(model)
# Remove the "#" signs from the following and run to replicate model checks:
# summary(model)
# k.check(model)
# plot(model)


# Figure:   
fig1c <- ggplot(data, aes(atelectasis_percent,spo2_VPO)) + 
  geom_point(size=0.6, color="gray60",
             position = position_jitter(seed = 1, width = .2)) +
  geom_smooth(
    method="gam",
    formula = y ~ s(x, bs = "cs", k = 4), 
    color="black"
    ) + 
  ylim(83,100) +
  labs(
    y="SpO2 (%)",
    x="Atelectasis percent (%)"
    ) +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(size=rel(1.2)), 
        axis.text.y = element_text(size=rel(1.2))
  )
