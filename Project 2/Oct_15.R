#regular expression : 'regex', defines a search pattern
# use metacharacters: e.g: . \\\ | ( ) [ { $, escape syntax: \\. \\$ \\...., use "\\"
#to match one of several characters in a specified set we can enclose characters of concern with [ ]
#Posix class, expressed in [[ ]]

strings <- c("a","ab","acb", "accb", "acccb")
grep("ac{2}b",strings,value=TRUE)
# pattern: ac*b ac+b, ac{2}b, ac{3,}b
#{n,}:match at least n times, ?: at most one time 
#{n,m}: between n and m times, * at least 0 times,+: at least 1 time,

#Postion of pattern in string
#^: start the the string
#$:end of string 
#\b:empty string either end of the word
#\B: not at the edge of the word '
grep("\\^ab",strings, value=TRUE)

x <- c("v.111","0v.11","00v.1","000v.","00000")
regexpr("v.",x)
grep("v",x)

sub(pattern="\\^","carrot","my daughter eat a ^ every day")
#substitube \\ with whitespace
gsub(pattern="\\\\"," ",x)

#replace the blank
y <- "i ha a hah a a "
gsub(pattern="[[:blank:]]", replacement="",y)
gsub(pattern=" ","",y)

#remove alphanumeric character
gsub(pattern="[[:alnum:]]",replacement="",y)
s
