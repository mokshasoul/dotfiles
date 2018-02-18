###
# Functions
#


# Automatic file backup <- very nice
# https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
bk() {
	cp -a "$1" "${1}_$(date --iso-8601=seconds)"
}

# display supported colors
function lscolors {
	((cols = $COLUMNS - 4 ))
	s=$(printf %${cols}s)
	for i in {000..$(tput colors)}; do
		echo -e $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);

	done

}

# get the content type of an http resource cool?
function htmime {
	if [[ -z $1 ]]; then
		print "USAGE: htmime <URL>"
		return 1
	fi
	mime=$(curl -sIX HEAD $1 | sed -nr "s/Content-Type: (.+)/\1/p")
	print $mime
}

# open browser and google query <-- very nice
function google {
	xdg-open "https://www.google.com/search?q=`urlencode "${(j: :)@}"`"
}

# print a separator banner, as wide as the terminal
function hr {
	print ${(l:COLUMNS::=:)}
}

function launch {
	type $1 >/dev/null || { print "$1 not found" && return 1}
	$@ &>/dev/null &|
}

alias launch="launch "

# urlencode text
function urlencode {
	print "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# get public ip
function myip {
	local api
	case "$1" in
		"-4")
			api="http://v4.ipv6-test.com/api/myip.php"
			;;
		"-6")
			api="http://v6.ipv6-test.com/api/myip.php"
			;;
		*)
			api="http://ipv6-test.com/api/myip.php"
			;;
	esac
	curl -s "$api"
	echo # Newline
}

function zurl {
	if [[ -z $1 ]]; then
		print "USAGE: $0 <URL>"
		return 1
	fi

	local url=$1
	local api="https://www.googleapis.com/urlshortener/v1/url"
	local data

	# Prepend "http://" to given URL where necessary for later output.
	if [[ $url != http(s|)://* ]]; then
		url="http://$url"
	fi
	local json="{\"longUrl\": \"$url\"}"

	data=$(curl --silent -H "Content-Type: application/json" -d $json $api)
	# Match against a regex and print it
	if [[ $data =~ '"id": "(http://goo.gl/[[:alnum:]]+)"' ]]; then
		print $match
	fi
}
# typing ... expands to ../.., .... to ../../.., etc.
rationalise-dot() {
	if [[ $LBUFFER = *.. ]]; then
		LBUFFER+=/..
	else
		LBUFFER+=.
	fi
}
# intellegently extract archives based on extension. 
function extract {  
   
   file=$1
   dir=$2
 
   if [[ -n $dir ]]; then
      mkdir -p $dir; 
      echo Extracting $1 into $2 ...
   else 
      echo Extracting $1 ...
   fi
 
   if [[ ! -f $1 ]] ; then
      echo "'$1' is not a valid file"
   else
      case $1 in
         *.tar.bz2)   
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc" 
             echo $cmd
             eval ${cmd}
             ;;   
         *.tar.gz)    
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzvf $1 $dc"; 
             echo $cmd;
             eval ${cmd}
             ;;
         *.tar)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar vxf $1 $dc";
             echo $cmd;
             eval ${cmd}
             ;;
         *.tbz2)      
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xjvf $1 $dc";
             echo $cmd; 
             eval ${cmd}
             ;;  
         *.tgz) 
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar xzf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;    
         *.bz2)       
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar jf $1 $dc"; 
             echo $cmd; 
             eval ${cmd} 
             ;;     
         *.zip)       
             if [[ -n $dir ]]; then dc="-d $dir"; fi
             cmd="unzip $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.gz)
             if [[ -n $dir ]]; then dc="-C $dir"; fi
             cmd="tar zf $1 $dc"; 
             echo $cmd; 
             eval ${cmd}
             ;;
         *.7z)        
             #TODO dir
             cmd="7z x -o$dir $1"; 
             echo $cmd; 
             eval ${cmd} 
             ;;
         *.rar)       
             #TODO Dir
             cmd="unrar x $1 $dir";
             echo $cmd;
             eval ${cmd}
             ;;
         *)           
            echo "'$1' cannot be extracted via extract()" 
            ;;
         esac
   fi
}
zle -N rationalise-dot

bindkey . rationalise-dot
bindkey -M isearch . self-insert
