#!/bin/bash
foo()
{
string=$1
array=($@)
echo "array is ${array[@]}"
echo "array[1] is ${array[1]}"
echo "string is $string"
return
}
array=(one two three)
foo ${array[@]} ${array[@]}
# colors=(red green blue)
# foo ${colors[@]}
