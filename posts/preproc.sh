#!/usr/local/bin/zsh

post=$1

echo "Processing $post"
sed 's/\$/\$\$/g' $post > '../_posts/$post' ;
touch -m $1


