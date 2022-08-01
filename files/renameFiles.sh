#!/bin/bash

# By A.Ibrahim
# Rename bulk files by removin leadin N characters. 
# For rnamin bulk files you can check the below article.
#   https://www.makeuseof.com/batch-rename-files-in-linux/
#
# In my case, i only need to remove N characters from the file names.
# For this I used the command as per the answer here.
#
#   https://stackoverflow.com/questions/28305134/remove-first-n-character-from-bunch-of-file-names-with-cut/28305660#28305660

# you can use the following command when you are in the folder where you want to make the renaming:
# Remove 11 characters from the start of the file name.
# -n is for no action and -v to show what will be the changes. 
# if you are satisfied with the results you can remove both of them
rename -n 's/.{11}(.*)/$1/' *