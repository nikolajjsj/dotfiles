#!/usr/bin/env bash

languages=`echo "typescript nodejs javascript dart lua c golang python bash css html" | tr ' ' '\n'`

selected=`printf "$languages" | fzf`
read -p "Enter query: " query

# if grep -qs "$selected" $languages; then
query=`echo $query | tr ' ' '+'`
tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
# else
#   echo 'Not one of the available languages'
# fi

