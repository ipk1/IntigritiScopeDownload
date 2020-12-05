 curl 'https://api.intigriti.com/core/researcher/program'   -H 'authority: api.intigriti.com'   -H 'accept: application/json, text/plain, */*'   -H 'dnt: 1'   -H 'authorization: Bearer '$1''  --compressed | jq -r '.[] | select(.status==3)| .companyHandle' | tee cohandle.txt


  curl 'https://api.intigriti.com/core/researcher/program'   -H 'authority: api.intigriti.com'   -H 'accept: application/json, text/plain, */*'   -H 'dnt: 1'   -H 'authorization: Bearer '$1''  --compressed | jq -r '.[] | select(.status==3) | .handle' | tee handle.txt

paste cohandle.txt handle.txt | while read if of
do

curl 'https://api.intigriti.com/core/researcher/program/'$of'/'$if''   -H 'authority: api.intigriti.com'   -H 'accept: application/json, text/plain, */*'   -H 'dnt: 1'   -H 'authorization: Bearer '$1''  --compressed | jq -r '.domains[] | .content[] | .endpoint' >> intiscope.txt



done
cat intiscope.txt | grep "*" | sed  's/\(.\{2\}\)//' | sed  's/*/com/g' | sort -u >> reconscope.txt
cat intiscope.txt | egrep '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' >> ipscope.txt
cat intiscope.txt | grep -v -e '*' -e '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' | httprobe | tee intigriti.txt

