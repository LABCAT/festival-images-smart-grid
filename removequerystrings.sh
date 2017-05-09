#change to the downloads directory
cd downloads

#remove query strings from all jpg files
for file in *.jpg\?*; do mv "$file" "${file%%\?*}"; done

#remove query strings from all png files
for file in *.png\?*; do mv "$file" "${file%%\?*}"; done

#return to previous directory
cd ../