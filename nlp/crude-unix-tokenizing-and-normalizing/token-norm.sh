#!/usr/bin/bash

echo 'tokenizing...'
tr -sc 'A-Za-z' '\n' < ../sherlock.txt | tr A-Z a-z > ./tokens
head ./tokens

echo 'sorting...'
sort ./tokens > ./sorted-tokens
echo 'done'
head ./sorted-tokens

echo 'counting...'
uniq -c ./sorted-tokens > ./counts
echo 'done'
head ./counts

echo 'stripping initial whitespace from counts'
sed 's/^ *//g' < counts > stripped-counts
echo 'done'
head ./stripped-counts
