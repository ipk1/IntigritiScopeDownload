# IntigritiScopeDownload
downloads all the URL's in scope for a user, private and public

the reconscope.txt has all the wild card scope to feed to your recon script
example : cat reconscope.txt | while read i; do ./yorseconscript.sh $i ; done
ipscope.txt has all the ipv4 cidr scope
intiscope.txt has all the urls 

usage
bash ISD.sh <<token>>

get toke by typing " localStorage.getItem('researcher_token');" in the console

