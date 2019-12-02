file <- commandArgs()
#file = dir('/tmp')
pdf_docs = grep("\\.pdf", file,value = T)
if(length(pdf_docs) == 0) {
	cat("No pdf arguments provided!")
}
require(qpdf,lib.loc = '/home/meme/R/site-library/',quietly = T)
if(length(pdf_docs) > 1) {
	#nn = paste0(paste0(substr(pdf_docs,start=1,stop=3),collapse = "-"),".pdf")
	pdf_combine(input = pdf_docs,output = "Merged.pdf")
	cat("Documents Combined. See Merged.pdf")
}

if(length(pdf_docs) == 1) {
	cat("Start page: ")
	x <- as.numeric(readLines(file("stdin"),1))
	cat("End page: ")
	y <- as.numeric(readLines(file("stdin"),1))
	pdf_subset(pdf_docs,pages = c(x:y),output = paste0(strsplit(pdf_docs,"\\.")[[1]][1],x,y,".pdf"))
	cat("Document Splitted. See", paste0(strsplit(pdf_docs,"\\.")[[1]][1],x,y,".pdf"))
}
