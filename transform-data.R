library(plyr)

### stem men women by department ----
stemfaculty = utkfacultydata[utkfacultydata$Stem =="stem",]
stemfacultytenure <- stemfaculty[grep("Prof", stemfaculty$Position),]
stemfacultynums <- count(stemfaculty, c("Department", "Gender"))
#stemfacultynums$Department <- with(stemfacultynums,factor(Department, levels = Department[order(stemfacultynums$freq)]))
# deprecated: stemfacultynums_ordered <- with(stemfacultynums, stemfacultynums[order(-freq, Gender),])

### men women non-stem stem aggregate ----
nonstemfaculty = utkfacultydata[utkfacultydata$Stem =="notstem",]
stemfacultybygender <- count(stemfaculty, c("Gender"))
nonstemfacultybygender <- count(nonstemfaculty, c("Gender"))
facultybygender = rbind(stemfaultybygender,nonstemfacultybygender)
facultybygender = cbind(facultybygender, Designation = c("stem","stem","non-stem","non-stem"))

### men women non-stem stem aggregate ----
nonstemfaculty = utkfacultydata[utkfacultydata$Stem =="notstem",]
nonstemfacultytenure <- nonstemfaculty[grep("Prof", stemfaculty$Position),]
stemfacultytenurebygender <- count(stemfacultytenure, c("Gender"))
nonstemfacultytenurebygender <- count(nonstemfacultytenure, c("Gender"))
facultytenurebygender = rbind(stemfacultytenurebygender,nonstemfacultytenurebygender)
facultytenurebygender = cbind(facultytenurebygender, Designation = c("stem","stem","non-stem","non-stem"))


### men women non-stem stem by position ----
stemfacultybyposition <- count(stemfaculty, c("Position", "Gender"))

sumstemntfem = sum(stemfacultybyposition[!grepl("Prof", stemfacultybyposition$Position) & stemfacultybyposition$Gender=="Female",3])
sumstemntmal = sum(stemfacultybyposition[!grepl("Prof", stemfacultybyposition$Position) & stemfacultybyposition$Gender=="Male",3])

  
stemfacultynontenure  <- data.frame(matrix(data = c("Non-Tenure", "Female", sumstemntfem,
                                    "Non-Tenure", "Male", sumstemntmal), nrow = 2, byrow = TRUE), stringsAsFactors = FALSE)
colnames(stemfacultynontenure) <- c("Position", "Gender", "freq")
stemfacultynontenure$freq <- as.numeric(stemfacultynontenure$freq)


nonstemfacultybyposition <- count(nonstemfaculty, c("Position", "Gender"))

sumnonstemntfem = sum(nonstemfacultybyposition[!grepl("Prof", nonstemfacultybyposition$Position) & nonstemfacultybyposition$Gender=="Female",3])
sumnonstemntmal = sum(nonstemfacultybyposition[!grepl("Prof", nonstemfacultybyposition$Position) & nonstemfacultybyposition$Gender=="Male",3])


nonstemfacultynontenure  <- data.frame(matrix(data = c("Non-Tenure", "Female", sumnonstemntfem,
                                                    "Non-Tenure","Male", sumnonstemntmal), nrow = 2, byrow = TRUE),stringsAsFactors = FALSE)
colnames(nonstemfacultynontenure) <- c("Position", "Gender", "freq")
nonstemfacultynontenure$freq <- as.numeric(nonstemfacultynontenure$freq)

facultybyposition = rbind(stemfacultybyposition[grepl("Prof", stemfacultybyposition$Position),],stemfacultynontenure,nonstemfacultybyposition[grepl("Prof", nonstemfacultybyposition$Position),],nonstemfacultynontenure)
facultybyposition = cbind(facultybyposition, Designation = c(rep("stem", times = 8),rep("non-stem",8)))
row.names(facultybyposition)<-seq.int(1,16,1)
