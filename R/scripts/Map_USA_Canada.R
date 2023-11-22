# Create table of absolute frequencies per state:
table <- data %>%
  group_by(state_residence) %>%
  summarize(n = n()) %>%
  mutate(name = state_residence) %>%
  select(-state_residence) %>%
  relocate(name) %>%
  arrange(desc(n))

# Code adapted from cpsievert, referenced un markdown document
### starts here
#### us laea projection as used in albersusa::us_laea_proj
us_laea <- "+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 +b=6370997 +units=m +no_defs"

usa <- ne_states(country = "united states of america", returnclass = "sf") %>%
  st_transform(us_laea) %>%
  select(name)

canada <- ne_states(country = "canada", returnclass = "sf") %>%
  st_transform(us_laea) %>%
  select(name)

usa <- left_join(usa, table, by = "name")
canada <- left_join(canada, table, by = "name")

figS2 <- plot_ly(
  split = ~name, color = ~n, colors = "Blues",
  stroke = I("black"), span = I(1),
  height = 450,
  width = 800
) %>%
  add_sf(data = usa, color = I("dimgray")) %>%
  add_sf(data = canada, color = I("dimgray")) %>%
  add_sf(data = filter(canada, name %in% table$name)) %>%
  add_sf(data = filter(usa, name %in% table$name)) %>%
  layout(showlegend = FALSE) %>%
  colorbar(title = "Number of<br>patients")
### Ends here

# Complement map with table of frequencies:
table <- table %>% rename(State = name)

fig_add <- plot_ly(
  type = "table",
  domain = list(x = c(0, 0.25), y = c(0, 0.6)),
  header = list(values = names(table)),
  cells = list(values = unname(table))
)

fig <- subplot(fig_add, figS2,
  nrows = 1,
  margin = 1
)

# Save as PNG
save_image(fig,
  file = paste(figfolder, "/FigureS2.png", sep = ""),
  width = 800, height = 450
)

# Save as PDF
save_image(fig,
  file = paste(figfolder, "/FigureS2.pdf", sep = "")
)
