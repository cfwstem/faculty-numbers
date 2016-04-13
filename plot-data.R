library(ggplot2)
# stemfacultyplot <- ggplot(data = stemfacultynums, aes(x = Department, y = freq, fill = Gender))+
#   geom_bar(colour = "#58595b", stat = "identity")
#   #geom_line(linetype = "dashed", size = 1.5)+
#   #geom_point(colour = "#58595b", size = 4, shape = 21, fill = "white")
# stemfacultyplot

### stem men women by department ----
stemfacultyplot <- ggplot(data = stemfacultynums, aes(x = Department, y = freq, group = Gender, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#2197A9")) +  #reorder(Department, freq)
  scale_fill_manual(values = c("#754a7e","#2197A9")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  #geom_smooth(alpha = 0.6, size = 1.5)+
  #geom_line(size = 3.5, alpha = 0.8) +
  geom_point(size = 7, shape = 21, colour = "white") +
  xlab("Departments") +
  ylab("Faculty Members") +
  ggtitle("2015-2016 STEM Faculty by Gender at Tennessee-Knoxville") +
    theme(
      axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
      axis.text.x = element_text(color="#58595B", size = 12, vjust = 0.5, hjust = 1, angle = 70),
      axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
      axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
      axis.ticks.y = element_line(color="#58595B", size = 2),
      axis.ticks.x = element_line(color="#58595B", size = 2),
      plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
      panel.background = element_blank(),
      #panel.border = element_rect(color="#58595B"),#element_blank(),
      panel.grid.major.x = element_line(color = "#A7A9AC", size = 0.5),
      panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
      panel.grid.minor.y = element_blank(),
    legend.position = "right"
  )

stemfacultyplot
ggsave(filename = "plots/stemfacultybydepartmentplot.svg", plot = stemfacultyplot, width = 8, height = 7, units = "in")

### men women non-stem stem faculty by gender aggregate ----
facultybygenderplot <- ggplot(data = facultybygender, aes(x = Gender, y = freq, group = Designation, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#2197A9")) +
  scale_fill_manual(values = c("#754a7e","#2197A9")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  geom_bar(colour = "#58595b", stat = "identity") +
  facet_grid(.~Designation)+
  xlab("Gender") +
  ylab("Faculty Members") +
  ggtitle("Non-STEM and STEM Faculty by Gender at Tennessee-Knoxville") +
  theme(
    axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.text.x = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
    axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
    axis.ticks.y = element_line(color="#58595B", size = 2),
    axis.ticks.x = element_line(color="#58595B", size = 2),
    
    #strip == facet
    strip.background = element_rect(colour = "#58595B", fill = "#58595B"),
    strip.text = element_text(color="#ffffff", size = 20),
    
    plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
    panel.background = element_blank(),
    #panel.border = element_rect(color="#58595B"),#element_blank(),
    panel.grid.major.x = element_line(color = "#A7A9AC", size = 0.5),
    panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
    legend.position = "right"
  )

facultybygenderplot
ggsave(filename = "plots/facultybygenderplot.svg", plot = facultybygenderplot, width = 8, height = 6, units = "in")

### men women non-stem stem faculty by gender aggregate ----
facultytenurebygenderplot <- ggplot(data = facultytenurebygender, aes(x = Gender, y = freq, group = Designation, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#2197A9")) +
  scale_fill_manual(values = c("#754a7e","#2197A9")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  geom_bar(colour = "#58595b", stat = "identity") +
  facet_grid(.~Designation)+
  xlab("") +
  ylab("Faculty Members") +
  ggtitle("Tenured / Tenure-Track Faculty at Tennessee-Knoxville") +
  theme(
    axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.text.x = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
    axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
    axis.ticks.y = element_line(color="#58595B", size = 2),
    axis.ticks.x = element_line(color="#58595B", size = 2),
    
    #strip == facet
    strip.background = element_rect(colour = "#58595B", fill = "#58595B"),
    strip.text = element_text(color="#ffffff", size = 20),
    
    plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
    panel.background = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
    panel.grid.minor.y = element_blank(),
    legend.position = "right"
  )

facultytenurebygenderplot
ggsave(filename = "plots/facultytenurebygenderplot.svg", plot = facultytenurebygenderplot, width = 8, height = 6, units = "in")


### men women non-stem stem by position ----
facultybyposition$Position_f = factor(facultybyposition$Position, levels = c('Non-Tenure','Asst.Prof','Assoc.Prof','Professor'))
facultybypositionplot <- ggplot(data = facultybyposition, aes(x = Gender, y = freq, group = Designation, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#2197A9")) +
  scale_fill_manual(values = c("#754a7e","#2197A9")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  geom_bar(colour = "#ffffff", stat = "identity") +
  facet_grid(Designation~Position_f)+
  xlab("") +
  ylab("Faculty Members") +
  ggtitle("Non-STEM and STEM Faculty by Position at Tennessee-Knoxville") +
  theme(
    axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.text.x = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
    axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
    axis.ticks.y = element_line(color="#58595B", size = 2),
    axis.ticks.x = element_line(color="#58595B", size = 2),
    
    #strip == facet
    strip.background = element_rect(colour = "#58595B", fill = "#58595B"),
    strip.text = element_text(color="#ffffff", size = 20),
    
    plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
    panel.background = element_blank(),
    #panel.border = element_rect(color="#58595B"),#element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
    panel.grid.minor.y = element_blank(),
    legend.position = "right"
  )

facultybypositionplot
ggsave(filename = "plots/facultybypositionplot.svg", plot = facultybypositionplot, width = 10, height = 6, units = "in")

### men women aggregate by position ----
facultyaggregatebypositionplot <- ggplot(data = facultybyposition, aes(x = Gender, y = freq, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#2197A9")) +
  scale_fill_manual(values = c("#754a7e","#2197A9")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  geom_bar(colour = "#ffffff", stat = "identity") +
  facet_grid(.~Position_f)+
  xlab("") +
  ylab("Number of Faculty") +
  ggtitle("All Faculty by Position at Tennessee-Knoxville") +
  theme(
    axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.text.x = element_text(color="#58595B", size = 20, vjust = 0.5),
    axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
    axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
    axis.ticks.y = element_line(color="#58595B", size = 2),
    axis.ticks.x = element_line(color="#58595B", size = 2),
    
    #strip == facet
    strip.background = element_rect(colour = "#58595B", fill = "#58595B"),
    strip.text = element_text(color="#ffffff", size = 20),
    
    plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
    panel.background = element_blank(),
    #panel.border = element_rect(color="#58595B"),#element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
    panel.grid.minor.y = element_blank(),
    legend.position = "right"
  )

facultyaggregatebypositionplot
ggsave(filename = "plots/facultyaggregatebypositionplot.svg", plot = facultyaggregatebypositionplot, width = 10, height = 6, units = "in")
