system__=$(uname -s)
shell__=$(ps -o comm= $$)


function macos__() {
  if [ $system__ = Darwin ]; then
    return 0
  else
    return 1
  fi
}
function linux__() {
  if [ $system__ = Linux ]; then
    return 0
  else
    return 1
  fi
}


# contains__(string__, substring__)
# string contains substring? Yes: 0, No: 1.
function contains__() {
  string__=$1
  substring__=$2
  if test "${string__#*$substring__}" != "$string__"; then
    return 0
  else
    return 1
  fi
}
function add_dir_to_path__() {
  flag__=$1 # front__ or back__
  dir__=$2
  pathname__=$3
  path__=$(eval echo -e "\$$pathname__")
  if ! contains__ $path__ $dir__; then
    if [ $flag__ = front__ ]; then
      export $pathname__=$dir__:$path__
    fi
    if [ $flag__ = back__ ]; then
      export $pathname__=$path__:$dir__
    fi
  fi
}
function insert_dir_to_front__() {
  add_dir_to_path__ front__ $1 $2
}
function append_dir_to_back__() {
  add_dir_to_path__ back__ $2 $1
}


function tar_cx__() {
  cx_ext__=cx-save__
  opt__=$1
  file__=$2
  shift

  case $file__ in
    *.tar)
      if [ $opt__ = c ]; then
        shift && COPYFILE_DISABLE=true tar -cf $file__ $*
      elif [ $opt__ = x ]; then
        tar -xvf $file__
      fi ;;

    *.tar.bz | *.tar.bz2 | *.tbz | *.tbz2)
      if [ $opt__ = c ]; then
        shift && tar -cjf $file__ $*
      elif [ $opt__ = x ]; then
        tar -xvjf $file__
      fi ;;

    *.bz | *.bz2)
      if [ $opt__ = c ]; then
        shift && bzip2 -k $*
        mv $*.bz2 $*.$cx_ext__ && mv $*.$cx_ext__ $file__
      elif [ $opt__ = x ]; then
        bunzip2 $file__
      fi ;;

    *.tar.gz | *.tgz)
      if [ $opt__ = c ]; then
        shift && tar -czf $file__ $*
      elif [ $opt__ = x ]; then
        tar -xvzf $file__
      fi ;;

    *.gz)
      if [ $opt__ = c ]; then
        shift && gzip -k $*
        mv $*.gz $*.$cx_ext__ && mv $*.$cx_ext__ $file__
      elif [ $opt__ = x ]; then
        gunzip $file__
      fi ;;

    *.xip)
      if [ $opt__ = x ]; then
        xip -x $file__
      fi ;;

    *.tar.xz | *.txz)
      if [ $opt__ = c ]; then
        shift && tar -cJf $file__ $*
      elif [ $opt__ = x ]; then
        tar -xvJf $file__
      fi ;;

    *.xz)
      if [ $opt__ = c ]; then
        shift && xz -k $*
        mv $*.xz $*.$cx_ext__ && mv $*.$cx_ext__ $file__
      elif [ $opt__ = x ]; then
        unxz $file__
      fi ;;

    *.Z)
      if [ $opt__ = c ]; then
        shift && compress -c $* > $file__
      elif [ $opt__ = x ]; then
        uncompress $file__
      fi ;;

    *.zip)
      if [ $opt__ = c ]; then
        shift && zip -r $file__ $*
      elif [ $opt__ = x ]; then
        unzip $file__
      fi ;;

    *)
      echo "Error: unsupported file type -- \"$file__\"." ;;
  esac
}
function dotar() {
  tar_cx__ c $*
}
function untar() {
  tar_cx__ x $*
}
function viewtar() {
  tar -tf $*
}
