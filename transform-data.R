library(plyr)

### stem men women by department ----
stemfaculty = utkfacultydata[utkfacultydata$Stem =="stem",]
stemfacultynums <- count(stemfaculty, c("Department", "Gender"))
#stemfacultynums$Department <- with(stemfacultynums,factor(Department, levels = Department[order(stemfacultynums$freq)]))
# deprecated: stemfacultynums_ordered <- with(stemfacultynums, stemfacultynums[order(-freq, Gender),])

### men women non-stem stem aggregate ----
nonstemfaculty = utkfacultydata[utkfacultydata$Stem =="notstem",]
stemfacultybygender <- count(stemfaculty, c("Gender"))
nonstemfacultybygender <- count(nonstemfaculty, c("Gender"))
facultybygender = rbind(stemfacultybygender,nonstemfacultybygender)
facultybygender = cbind(facultybygender, Designation = c("stem","stem","non-stem","non-stem"))

### men women non-stem stem by position ----
stemfacultybyposition <- count(stemfaculty, c("Position", "Gender"))

sumntfem = sum(stemfacultybyposition[stemfacultybyposition$Position=="Instructor" & stemfacultybyposition$Gender=="Female",3],
      stemfacultybyposition[stemfacultybyposition$Position=="Lecturer" & stemfacultybyposition$Gender=="Female",3],
      stemfacultybyposition[stemfacultybyposition$Position=="Other" & stemfacultybyposition$Gender=="Female",3])
sumntmal = sum(stemfacultybyposition[stemfacultybyposition$Position=="Instructor" & stemfacultybyposition$Gender=="Male",3],
               stemfacultybyposition[stemfacultybyposition$Position=="Lecturer" & stemfacultybyposition$Gender=="Male",3],
               stemfacultybyposition[stemfacultybyposition$Position=="Other" & stemfacultybyposition$Gender=="Male",3])

stemfacultynontenure  <- data.frame(matrix(data = c("Position"="Non-Tenure", "Gender" = "Female", freq= sumntfem,
                                    "Position"="Non-Tenure", "Gender" = "Male", freq= sumntmal), nrow = 2, byrow = TRUE))

nonstemfacultybyposition <- count(nonstemfaculty, c("Position", "Gender"))
facultybyposition = rbind(stemfacultybyposition,nonstemfacultybyposition)
facultybyposition = cbind(facultybyposition, Designation = c(rep("stem", times = 12),rep("non-stem",12)))
