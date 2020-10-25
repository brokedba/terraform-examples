##  Terraform: Functions  ##
##--------------------------
## Author Debjeet Bhowmik : https://cloudaffaire.com/terraform-functions/
## Open terraform console
terraform console
 
#######################
## Numeric Functions ##
#######################
 
## abs(number): returns the absolute value of the given number.
abs(-19.86) #returns 19.86
 
## ceil(number): returns the closest whole number that is greater than or equal to the given value
ceil(7.1) #returns 8
 
## floor(number): returns the closest whole number that is less than or equal to the given value
floor(7.1) #returns 7
 
## log(number, base): log returns the logarithm of a given number in a given base.
log(16,2) #returns 4
 
## max(N1,N2,..Nn): takes one or more numbers and returns the greatest number from the set.
max(3,2,6,8.8,7) #returns 8.8
 
## min(N1,N2,..Nn): takes one or more numbers and returns the smallest number from the set.
min(3,2,6,8.8,7) #returns 2
 
## pow(number,power): calculates an exponent, by raising its first argument to the power of the second argument.
pow(8,2) #returns 64
 
## signum(number): determines the sign of a number, returning a number between -1 and 1 to represent the sign.
signum(-4) #returns -1
signum(4) #returns 1
 
######################
## String Functions ##
######################
 
## chomp("string"): removes newline characters at the end of a string.
chomp("cloudaffaire\n") #returns cloudaffaire (**only removes \n from end)
 
## format(spec, values...): produces a string by formatting a number of other values according to a specification string
format("Welcome, to %s", "CloudAffaire") #returns Welcome, to CloudAffaire
format("The year is %d", 2019) #returns The year is 2019
format("%4.4f+", 3.86) #returns 3.8600+
#spec: https://www.terraform.io/docs/configuration/functions/format.html
 
## formatlist(spec, values...): formatlist produces a list of strings by formatting a number of other values
## according to a specification string. The specification string uses the same syntax as format.
formatlist("www.%s.com",list("azure","aws","google")) #returns [www.azure.com,www.aws.com,www.google.com]
 
## indent(num_spaces, string): adds a given number of spaces to the beginnings of all but the first line in a given multi-line string.
indent(8,"hi, \n welcome \n to \n cloudaffaire") #1st line hi has no indentaton
 
## join(separator, list): produces a string by concatenating together all elements of a given list of strings with the given delimiter.
join(".",list("www","google","com")) #returns www.google.com
 
## lower(string): converts all cased letters in the given string to lowercase.
lower("CLOUDAFFAIRE") #returns cloudaffaire
 
## upper(string): converts all cased letters in the given string to uppercase.
upper("cloudaffaire") #returns CLOUDAFFAIRE
 
## replace(string, substring, replacement): searches a given string for another given substring,
## and replaces each occurrence with a given replacement string.
replace("www.google.com","google","cloudaffaire") #returns www.cloudaffaire.com
 
## split(separator, string): produces a list by dividing a given string at all occurrences of a given separator.
split(".","www.google.com") #returns ["www","google","com"]
 
## strrev(string): reverses the characters in a string. Note that the characters are treated as Unicode characters
strrev("google") #returns: "elgoog" (only supported in terraform version 0.12 or later)
 
## substr(string, offset, length): extracts a substring from a given string by offset and length.
substr("www.google.com",4,6) #returns google
 
## title(string): converts the first letter of each word in the given string to uppercase.
title("welcome to cloudaffaire") #returns Welcome To Cloudaffaire
 
## trimspace(string): removes any space characters from the start and end of the given string.
trimspace("     hello,      all     ") #returns "hello, all"
 
##########################
## Collection Functions ##
##########################
 
## chunklist(list, chunk_size): splits a single list into fixed-size chunks, returning a list of lists.
chunklist(list("a","b","c","d","e","f"),3) #returns [["a","b","c"],["d","e","f"]]
 
## coalesce(strings\numbers): takes any number of arguments and returns the first one that isn't null or an empty string.
coalesce("",1,"a") #returns 1
 
## coalescelist(list1, list2, .. listn): takes any number of list arguments and returns the first one that isn't empty.
coalescelist(list(),list("a","b","c"),list("d","e")) #returns ["a","b","c",]  ==> list() call fails: at least one argument is required.
 
## compact(list(string)): takes a list of strings and returns a new list with any empty string elements removed.
compact(list("a","","c","","d")) #returns ["a","c","d"]
 
## concat(list1, list2, .. listn): takes two or more lists and combines them into a single list.
concat(list("a","b"),list("c","d"),list("e","f")) #returns ["a","b","c","d","e","f"]
 
## contains(list, value): determines whether a given list or set contains a given single value as one of its elements.
contains(list("a","b","c"),"a") #returns true
contains(list("a","b","c"),"d") #returns false
 
## distinct(list): takes a list and returns a new list with any duplicate elements removed.
distinct(list("a","b","b","c")) #returns ["a","b","c",]
 
## element(list, index): retrieves a single element from a list.
element(list("a","b","c"),2) #returns c #index start from 0
 
## index(list, value): finds the element index for a given value in a list.
index(list("a","b","c"),"b") #returns 1
 
## flatten(list(list1,list2,..,listn)): takes a list and replaces any elements that are lists with a flattened sequence of the list contents.
flatten(list(list("a","b"),list("c"),list(),list("d","e"))) #returns ["a","b","c","d","e",]
 
## keys(map): takes a map and returns a list containing the keys from that map.
keys(map("name","debjeet","sex","male")) #returns ["name","sex",]
 
## length(list\map\string): determines the length of a given list, map, or string.
length(list("a","b")) #returns 2
length("debjeet") #returns 7
length(map("name","debjeet","sex","male")) #returns 2
 
## list(): takes an arbitrary number of arguments and returns a list containing those values in the same order.
list("a","b","c") #returns ["a","b","c",]
 
## lookup(map, key, default): retrieves the value of a single element from a map, given its key.
#If the given key does not exist, a the given default value is returned instead.
lookup(map("name","debjeet","sex","male"),"sex","not found!") #returns male
lookup(map("name","debjeet","","male"),"gender","not found!") #returns not found!
 
## map("key1","value1","key2","value2",...,"keyn","valuen"): takes an even number of arguments and returns a map whose elements
## are constructed from consecutive pairs of arguments.
map("name","debjeet","sex","male") #returns {"name" = "debjeet" "sex" = "male"}
 
## matchkeys(valueslist, keyslist, searchset): constructs a new list by taking a subset of elements from one list whose indexes
## match the corresponding indexes of values in another list.
matchkeys(list("a","b","c"),list("one","two","three"),list("two")) #returns b
matchkeys(list("a","b","c"),list("one","two","three"),list("one")) #returns a
matchkeys(list("a","b","c"),list("one","two","three"),list("three")) #returns c
 
## merge(map1,map2,..,mapn): takes an arbitrary number of maps and returns a single map that
## contains a merged set of elements from all of the maps.
merge(map("a","one"),map("b","two"),map("c","three")) #returns {"a" = "one" "b" = "two" "c" = "three"}
 
#reverse(list): takes a sequence and produces a new sequence of the same length with all of
#the same elements as the given sequence but in reverse order.
reverse(list("a","b","c")) #returns: ["c","b","a",] (only supported in terraform version 0.12 or later)
 
## setintersection(sets...): takes multiple sets and produces a single set containing only the elements that all of the given sets have in common.
setintersection(list("a","b"),list("b","c"),list("b","d")) #returns ["b",] (only supported in terraform version 0.12 or later)
 
## setproduct(sets...): finds all of the possible combinations of elements from all of the given sets by computing the cartesian product.
setproduct(list("a","b"),list("c","d")) #returns [["a","c"],["a","d"],["b","c"],["b","d"],] (only supported in terraform version 0.12 or later)
 
## setunion(sets...): takes multiple sets and produces a single set containing the elements from all of the given sets.
#In other words, it computes the union of the sets.
setunion(list("a","b"),list("c","d")) #returns ["a","b","c","d",] (only supported in terraform version 0.12 or later)
 
## slice(list, startindex, endindex): extracts some consecutive elements from within a list
slice(list("zero","one","two","three"),1,3) #returns ["one","two"]
 
## sort(list): takes a list of strings and returns a new list with those strings sorted lexicographically.
sort(list("d","c","a","b")) #returns ["a","b","c","d",]
 
## transpose(): takes a map of lists of strings and swaps the keys and values to produce a new map of lists of strings.
transpose(map("a",list("one","two"),"b",list("three","four"))) #returns {"four"=["b",] "one"=["a",] "three"=["b",] "two"=["a",]}
 
## values(map): takes a map and returns a list containing the values of the elements in that map.
values(map("name","debjeet","sex","male")) #returns ["debjeet","male",]
 
## zipmap(keyslist, valueslist): constructs a map from a list of keys and a corresponding list of values.
zipmap(list("name","sex"),list("debjeet","male")) #returns {"name" = "debjeet" "sex" = "male"}
 
########################
## Encoding Functions ##
########################
 
## base64encode(string): applies Base64 encoding to a string.
base64encode("cloudaffaire") #returns Y2xvdWRhZmZhaXJl
 
## base64gzip(string): compresses a string with gzip and then encodes the result in Base64 encoding.
base64gzip("cloudaffaire") #returns H4sIAAAAAAAA/0rOyS9NSUxLS8wsSgUAAAD//wEAAP//38z9sQwAAAA=
 
## base64decode(string): takes a string containing a Base64 character sequence and returns the original string.
base64decode("Y2xvdWRhZmZhaXJl") #returns cloudaffaire
 
## csvdecode(string): decodes a string containing CSV-formatted data and produces a list of maps representing that data.
csvdecode("a,b,c\n1,2,3\n") #returns [{"a"="1"  "b"="2"  "c"="3"},] (only supported in terraform version 0.12 or later)
 
## jsonencode(): encodes a given value to a string using JSON syntax.
jsonencode(map("name","debjeet")) #returns {"name":"debjeet"}
 
## jsondecode(): interprets a given string as JSON, returning a representation of the result of decoding that string.
jsondecode("{\"name\":\"debjeet\"}") #returns {"name" = "debjeet"} (only supported in terraform version 0.12 or later)
 
## urlencode(): applies URL encoding to a given string.
urlencode("https://cloudaffaire.com/?s=terraform") #returns https%3A%2F%2Fcloudaffaire.com%2F%3Fs%3Dterraform
 
##########################
## Filesystem Functions ##
##########################
 
## dirname(string): takes a string containing a filesystem path and removes the last portion from it.
dirname("/home/ec2-user/terraform/main.tf") #returns /home/ec2-user/terraform
 
## pathexpand(): takes a filesystem path that might begin with a ~ segment,
## and if so it replaces that segment with the current user's home directory path.
pathexpand("~/.ssh/id_rsa") #returns /home/ec2-user/.ssh/id_rsa
 
## basename(string): takes a string containing a filesystem path and removes all except the last portion from it.
basename("/home/ec2-user/terraform/main.tf") #returns main.tf
 
## file(path): reads the contents of a file at the given path and returns them as a string
file("/home/ec2-user/terraform/main.tf") #returns content of main.tf
 
## fileexists(path): determines whether a file exists at a given path.
fileexists("/home/ec2-user/terraform/main.tf") #returns true if main.tf exist (only supported in terraform version 0.12 or later)
 
