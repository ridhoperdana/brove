#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Simple command to remove all Git branch except the branch you want to keep"
   echo
   echo "Syntax: ./app.sh [options] [branch_you_want_to_keep]"
   echo "options:"
   echo "h     Print this Help."
   echo
}

# Get the options
while getopts ":h" option; do
   case $option in
      h)
         Help
         exit;;
   esac
done

################################################################################
# Main program                                                                 #
################################################################################

if [ "$1" == "" ]; then
    echo "Please define what branch you want to keep"
else
    eval git branch | grep -ve " $1$" | xargs git branch -D
fi
