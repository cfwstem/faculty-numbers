library(plyr)
stemfaculty = utkfacultydata[utkfacultydata$Stem =="stem",]
stemfacultynums <- count(stemfaculty, c("Department", "Gender"))
#stemfacultynums$Department <- with(stemfacultynums,factor(Department, levels = Department[order(stemfacultynums$freq)]))
# deprecated: stemfacultynums_ordered <- with(stemfacultynums, stemfacultynums[order(-freq, Gender),])
