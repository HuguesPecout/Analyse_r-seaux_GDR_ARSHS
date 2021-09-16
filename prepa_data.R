

attributes <- read.csv(file = "data/Greys_anatomy_attributes.tsv", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

sociomat <- read.table(file = "data/Greys_anatomy_sociomat.tsv", 
                       header = T,  quote="\"",sep = "\t", strip.white=T ,
                       stringsAsFactors = FALSE, as.is=T,encoding = "UTF-8")

row.names(sociomat) <- sociomat[,1]
sociomat<- sociomat[,-1]
sociomat2 <- as.table(as.matrix(sociomat))
sociomat2[lower.tri(sociomat2,diag=FALSE)] <- 0
sociomat3 <- as.data.frame(sociomat2)
sociomat4 <- sociomat3[sociomat3$Freq!=0, 1:2]
colnames(sociomat4) = c("i", "j")  

sociomat4$j <-gsub(pattern = "thatch.grey", "thatch grey", sociomat4$j)
sociomat4$j <-gsub(pattern = "ellis.grey", "ellis grey", sociomat4$j)
sociomat4$j <-gsub(pattern = "o.malley", "o'malley", sociomat4$j)
sociomat4$j <-gsub(pattern = "mrs..seabury", "mrs. seabury", sociomat4$j)

write.table(sociomat4, "data/Greys_anatomy_Sexual_relation.csv", sep=",", row.names = F)
write.table(attributes, "data/Greys_anatomy_Attributes.csv", sep=",", row.names = T)

