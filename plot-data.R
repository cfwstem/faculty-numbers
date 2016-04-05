library(ggplot2)
# stemfacultyplot <- ggplot(data = stemfacultynums, aes(x = Department, y = freq, fill = Gender))+
#   geom_bar(colour = "#58595b", stat = "identity")
#   #geom_line(linetype = "dashed", size = 1.5)+
#   #geom_point(colour = "#58595b", size = 4, shape = 21, fill = "white")
# stemfacultyplot


stemfacultyplot <- ggplot(data = stemfacultynums, aes(x = reorder(Department, freq), y = freq, group = Gender, fill = Gender, colour = Gender))+
  scale_colour_manual(values = c("#754a7e","#ff8200")) +
  scale_fill_manual(values = c("#754a7e","#ff8200")) +
  #scale_colour_brewer(palette = "Set2") +
  #scale_fill_brewer(palette = "Set2") +
  geom_smooth(alpha = 0.6, size = 1.5)+
  geom_point(size = 4, shape = 21, colour = "white") +
  xlab("Departments") +
  ylab("Faculty Members") +
  ggtitle("STEM Faculty by Gender at Tennessee-Knoxville") +
    theme(
      axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
      axis.text.x = element_text(color="#58595B", size = 10, vjust = 0.5, angle = 90),
      axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
      axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
      axis.ticks.y = element_line(color="#58595B", size = 2),
      plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
      panel.background = element_blank(),
      #panel.border = element_rect(color="#58595B"),#element_blank(),
      panel.grid.major.x = element_line(color = "#A7A9AC", size = 0.5),
      panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
    legend.position = "right"
  )

stemfacultyplot
ggsave(filename = "plots/stemfacultyplot-org-pur.svg", plot = stemfacultyplot, width = 8, height = 6, units = "in")


# spAplot <- ggplot(data = A.1, aes(x = Strain, y = Stress)) +
#   #geom_point(color="#58595B", size = 3, alpha = 1/20) +
#   geom_smooth(color="#579584", size = 2) +
#   # yield strength
#   geom_point(
#     x = Specimen9["Tensile strain (ATS) at Yield (Offset 0.2 %)", 1], 
#     y = Specimen9["Tensile stress at Yield (Offset 0.2 %)",1],
#     size = 4, color = "#ff8200") +
#   geom_text(
#     x = Specimen9["Tensile strain (ATS) at Yield (Offset 0.2 %)", 1], 
#     y = Specimen9["Tensile stress at Yield (Offset 0.2 %)",1],
#     label = "yield strength",
#     color = "#ff8200",
#     size = 8,
#     vjust = 1,
#     hjust = -0.1
#   ) +
#   # uts
#   #Tensile stress at Maximum Load
#   geom_point(
#     x = SpecimenA["Tensile strain (ATS) at Maximum Load", 1], 
#     y = SpecimenA["Tensile stress at Maximum Load",1],
#     size = 4, color = "#ff8200") +
#   geom_text(
#     x = Specimen9["Tensile strain (ATS) at Maximum Load", 1], 
#     y = Specimen9["Tensile stress at Maximum Load",1],
#     label = "uts",
#     color = "#ff8200",
#     size = 8,
#     vjust = 2,
#     hjust = 0.5
#   ) +
#   xlab("Strain (-)") +
#   ylab("Stress (MPa)") +
#   ggtitle("Specimen 9 Stress-Strain")+
#   scale_x_continuous(limits = c(0,2.2)) +
#   scale_y_continuous(limits = c(0,320)) +
#   # discrete: lims(x = c(0,2) , y = c(0,300)) +
#   theme(
#     axis.text.y = element_text(color="#58595B", size = 20, vjust = 0.5),
#     axis.text.x = element_text(color="#58595B", size = 20, vjust = 0.5),
#     axis.title.y = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5, angle = 90),
#     axis.title.x = element_text(color="#58595B", face = "bold", size = 20, vjust = 0.5),
#     axis.ticks.y = element_line(color="#58595B", size = 2),
#     plot.title = element_text(color="#58595B", face = "bold", size = 20, hjust = 0.5, vjust = 0),
#     panel.background = element_blank(),
#     #panel.border = element_rect(color="#58595B"),#element_blank(),
#     panel.grid.major.x = element_line(color = "#A7A9AC", size = 0.5),
#     panel.grid.major.y = element_line(color = "#A7A9AC", size = 0.5),
#     legend.position = "none"
#   )
# ggsave(filename = "plots/sp9.png", plot = sp9plot, scale = 1, dpi = 300)