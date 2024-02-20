getwd()
nuevo_dir = ("C:/practica14feb")
setwd(nuevo_dir)


dir()
list.files()
if (file.exists(nuevo_dir)){
  cat("Directorio creado correctamente: ", nuevo_dir, "\n")
} else{
  cat("fallo al crear directorio: ", nuevo_dir, "\n")
}

install.packages("readx1")


#1
spear = read_excel("C:/practica14feb/spearheads.xlsx")
spear = as.data.frame(spear)
class(spear)
data.frame(spear)

#2
names(spear)[names(spear) == "Mat"] = "Materiales"
names(spear)[names(spear) == "Con"] = "Contexto"
names(spear)[names(spear) == "Cond"] = "Conservacion"
names(spear)[names(spear) == "Loo"] = "Loop"
names(spear)[names(spear) == "Peg"] = "Remache"
names(spear)[names(spear) == "Date"] = "Fecha"
names(spear)[names(spear) == "Maxle"] = "Longitud_max"
names(spear)[names(spear) == "Socle"] = "Longitud_encaje"
names(spear)[names(spear) == "Maxwi"] = "Ancho_max"
names(spear)[names(spear) == "Upsoc"] = "Ancho_encaje"
names(spear)[names(spear) == "Mawit"] = "Ancho_max_encaje"
names(spear)[names(spear) == "Weight"] = "Peso"

#3
spear$Contexto=factor(spear$Contexto,levels=c('1', '2', '3'),labels=c("S/C", "Habitacional", "Funerario"))
spear$Conservacion=factor(spear$Conservacion,levels=c(1,2,3,4),labels=c("Excelente", "Bueno", "Regular", "Malo" ))
spear$Remache=factor(spear$Remache,levels=c(1,2),labels=c('Si', 'No'))
spear$Materiales=factor(spear$Materiales,level=c(1,2),labels=c("Bronce", "Hierro"))

View(spear)

#4
freq_mat = table(spear$Materiales)
View(freq_mat)

freq_cont = table(spear$Contexto)
View(freq_cont)

freq_cons = table(spear$Conservacion)
View(freq_cons)

#5
cross_cont = table(spear$Materiales, spear$Contexto)
View(cross_cont)

cross_cons = table(spear$Materiales, spear$Conservacion)
View(cross_cons)

#6
prop.mat=prop.table(freq_mat)
View(prop.mat)
prop.mat = as.data.frame(prop.mat)
prop.mat$Porcentaje = prop.mat$Freq * 100
prop.mat
View(prop.mat)


prop.cont=prop.table(freq_cont)
View(prop.cont)
prop.cont = as.data.frame(prop.cont)
prop.cont$Porcentaje = prop.cont$Freq * 100
prop.cont
View(prop.cont)

prop.cons=prop.table(freq_cons)
View(prop.cons)
prop.cons = as.data.frame(prop.cons)
prop.cons$Porcentaje = prop.cons$Freq * 100
prop.cons
View(prop.cons)

#7
prop.cross_matcont= prop.table((cross_cont)*100.0)
View(prop.cross_matcont)*100

prop.cross_matcons = prop.table((cross_cons)*100)
View((prop.cross_matcons)*100)

#8 
bar_con = barplot(table(spear$Conservacion), horiz = F)

bar_cont = barplot(table(spear$Contexto), horiz = F)

#9
bar_mat = barplot(table(spear$Materiales), horiz = T)

bar_rem = barplot(table(spear$Remache), horiz = T)

#10
bar.agrup = barplot(cross_cons, widht = 0.9, main = "Estado de conservacion", xlab = "Material", ylab = "Conservacion")
View(bar.agrup)


#11
graf_sect = pie(freq_cons)


#12
print(graf_hist)


