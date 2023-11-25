# Figure 1a
fig1a <- ggplot(data, aes(BMI, atelectasis_percent)) +
  geom_point(size = 0.6, color = "gray60") +
  geom_smooth(
    method = "gam",
    formula = y ~ s(x, bs = "cs", k = 6),
    color = "darkblue"
  ) +
  labs(
    y = "Atelectasis percent (%)",
    x = "Body mass index (kg/m²)",
    tag = "A"
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

ggsave("Figure1a.png",
       plot = fig1a,
       path = figfolder,
       width = 8, height = 6, units = "in", dpi = 300
)


# Figure 1b
fig1b <- ggplot(data, aes(BMI, spo2_VPO)) +
  geom_point(size = 0.6, color = "gray60") +
  geom_smooth(
    method = "gam",
    formula = y ~ s(x, bs = "cs", k = 5),
    color = "cadetblue4"
  ) +
  labs(
    y = "SpO2 (%)",
    x = "Body mass index (kg/m²)",
    tag = "B"
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

ggsave("Figure1b.png",
  plot = fig1b,
  path = figfolder,
  width = 8, height = 6, units = "in", dpi = 300
)

# Figure 1c
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
    x="Atelectasis percent (%)",
    tag="C"
  ) +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.text.x = element_text(size=rel(1.2)), 
        axis.text.y = element_text(size=rel(1.2))
  )

ggsave("Figure1c.png",
       plot = fig1b,
       path = figfolder,
       width = 8, height = 6, units = "in", dpi = 300
)