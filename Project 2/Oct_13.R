#e.g:
phone <- "([2-9][0-9]{2})"

str_extract()



x<-c("apple","banana","pear")
str_extract(x,"an")

str_detect(xxx,"xx", igore_case=TRUE/FALSE)
str_detect(xxx,regex("xxx",ignore_cae=TRUE/FALSE))
#to detect certain terms in a 

#e.g:
yy <- "a\u0301"
ya <-"au45"
#to extract one 
str_detect(ya,"") #if it is " " it'll extract two 


str_extract_all(xxx,xxx)
#extracts all matches and return a list of vectors

str_match(xxx,xxx)
str_match_all(xxx,xxx)
#extracts capture groups formed by () from the first match it returns a matrix 

str_replace()
str_replace_all()
#replace the first matched pattern and returns a character vector 

string_split <-"this, is an, example"
textstr <-str_split(string_split,",")
##str_split(textstr," ")

str_split("a-b-c","-")
#returns "a" "b" "c"

str_sub("a-b-c",1,2)
#return "a-"

badwords<- c("angry","terrible","disappointed", "sad")
badstring <- "this is terrible news to me "
tweet <- str_match(badstring,badwords)

######
icd10_codes <- c("A18.11","N18.6","C68.9","E10.65")
icd10_codes <- data.frame(icd10_codes) 
##remove decimal point
icd10_codes$icd10_codes <-as.character(icd10_codes$icd10_codes)
icd10_codes$icd10_codes <- gsub(",","",icd10_codes$icd10_codes,fixed=TRUE)
print(icd10_codes$icd10_codes)
try_substr <- substr(icd10_codes$icd10_codes,1,2)
str_extract(icd10_codes$icd10_codes,"N")

str_extract(c("gray","grey"),"gre|ay")
str_extract(c("gray","grey"),"gr(e|a)y")

# ^ matches the start of the string
# $ matches the end of the string 
# "a%":in sql it's the start of the string is an 'a'

x <- "Line 1\nline 2\nline 3\n"
str_extract_all(x, "^line")[[1]] #it's like subsetting for the vector and extract it as a line 
str_extract_all(x,regex("\\line",multiline=TRUE))[[1]]