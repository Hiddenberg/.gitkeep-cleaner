#!/bin/bash

foundFiles=$(find . -name ".gitkeep" -not -path "./node_modules/*")

function autoremoveSequence {
   echo #just to add new line
   echo "**************************************"
   echo "You probably don't need me anymore"
   read -p "Do you want me to remove myself? (y/n): " -r -n 1 answer2
   echo #just to add new line
   echo #just to add new line
   case $answer2 in
      y | Y)
         echo "It was an honor to serve you... :,)"
         rm $0
      ;;
      n | N)
         echo "Thank you for letting me live :)"
      ;;
      *)
         echo "Invalid option (I'll take that as a no)"
      ;;
   esac
}

if [[ -z $foundFiles ]]
then
   echo "No \".gitkeep\" files found, your project is clean :)"
   autoremoveSequence
else
   echo "Do you want to remove the following files?"
   for file in $foundFiles
   do
   echo $file
   done

   read -p "(y/n): " -r -n 1 answer # reads only one character ("y" or "n")
   echo # just to add a new line

   case $answer in
      y | Y)
         echo "Deleting files..."
         rm -v $foundFiles

         autoremoveSequence
      ;;
      n | N)
         echo "Aborting..."
      ;;
      *)
         echo "Invalid option"
      ;;
   esac
fi
