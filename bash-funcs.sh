__system=$(uname -s)
__shell=$(ps -o comm= $$)


function __macos() {
  if [ $__system = Darwin ]; then
    return 0
  else
    return 1
  fi
}
function __linux() {
  if [ $__system = Linux ]; then
    return 0
  else
    return 1
  fi
}


# contains(string, substring)
# string contains substring? Yes: 0, No: 1.
function __contains() {
  local string=$1
  local substring=$2
  if test "${string#*$substring}" != "$string"; then
    return 0
  else
    return 1
  fi
}
function __add_dir_to_path() {
  # flag = front / back
  local flag=$1
  local dir=$2
  local pathname=$3
  local path=$(eval echo -e "\$$pathname")
  if ! __contains $path $dir; then
    if [ -d $dir ]; then
      if [ -z $path ]; then
        # if path is empty
        export $pathname=:$dir
      elif [ $flag = front ]; then
        export $pathname=$dir:$path
      elif [ $flag = back ]; then
        export $pathname=$path:$dir
      fi
    fi
  fi
}
function __insert_dir_front() { __add_dir_to_path front $1 $2; }
function __append_dir_back()  { __add_dir_to_path back  $1 $2; }


if __linux; then
function open() {
  local file=$1

  if [ "$file" = "." ] || [ "$file" = ".." ] || [ -d "$file" ] ; then
    nautilus "$file"
  elif [ -f "$file" ]; then
    case "$file" in
      *.html)
        firefox "$file" &
        ;;

      *.sh | *.txt)
        gedit "$file" &
        ;;

      *)
        echo "The default program for $file is not set."
        ;;
    esac
  else
    case "$file" in
      *.com* | *.net* | *.edu*)
        firefox "$file" &
        ;;
    esac
  fi
}
fi


function __tar_cx() {
  local cx_ext=cx-save__
  # opt = c / x
  local opt=$1
  local file=$2
  shift

  case "$file" in
    *.tar)
      if [ $opt = c ]; then
        shift && COPYFILE_DISABLE=true tar -cf $file $*
      elif [ $opt = x ]; then
        tar -xvf $file
      fi ;;

    *.tar.bz | *.tar.bz2 | *.tbz | *.tbz2)
      if [ $opt = c ]; then
        shift && tar -cjf $file $*
      elif [ $opt = x ]; then
        tar -xvjf $file
      fi ;;

    *.bz | *.bz2)
      if [ $opt = c ]; then
        shift && bzip2 -k $*
        mv $*.bz2 $*.$cx_ext && mv $*.$cx_ext $file
      elif [ $opt = x ]; then
        bunzip2 $file
      fi ;;

    *.tar.gz | *.tgz)
      if [ $opt = c ]; then
        shift && tar -czf $file $*
      elif [ $opt = x ]; then
        tar -xvzf $file
      fi ;;

    *.gz)
      if [ $opt = c ]; then
        shift && gzip -k $*
        mv $*.gz $*.$cx_ext && mv $*.$cx_ext $file
      elif [ $opt = x ]; then
        gunzip $file
      fi ;;

    *.xip)
      if [ $opt = x ]; then
        xip -x $file
      fi ;;

    *.tar.xz | *.txz)
      if [ $opt = c ]; then
        shift && tar -cJf $file $*
      elif [ $opt = x ]; then
        tar -xvJf $file
      fi ;;

    *.xz)
      if [ $opt = c ]; then
        shift && xz -k $*
        mv $*.xz $*.$cx_ext && mv $*.$cx_ext $file
      elif [ $opt = x ]; then
        unxz $file
      fi ;;

    *.Z)
      if [ $opt = c ]; then
        shift && compress -c $* > $file
      elif [ $opt = x ]; then
        uncompress $file
      fi ;;

    *.zip)
      if [ $opt = c ]; then
        shift && zip -r $file $*
      elif [ $opt = x ]; then
        unzip $file
      fi ;;

    *)
      echo "Error: unsupported file type -- \"$file\"." ;;
  esac
}
function dotar()   { __tar_cx c $*; }
function untar()   { __tar_cx x $*; }
function viewtar() { tar -tf    $*; }


function __load-nvidia() {
  if __linux; then
    echo Running prime-select query...
    prime-select query
    echo
    # arg = load / unload / status
    local arg=$1
    if [ $arg = status ]; then
      # print current status
      cat /proc/acpi/bbswitch
      echo Running nvidia-smi...
      nvidia-smi
    elif [ $arg = unload ]; then
      # unload the drivers then turn off the card
      sudo modprobe -r nvidia-uvm nvidia
      echo OFF | sudo tee /proc/acpi/bbswitch
    elif [ $arg = load ]; then
      # turn on the card first then load the drivers
      echo ON | sudo tee /proc/acpi/bbswitch
      sudo modprobe nvidia-uvm nvidia
    fi
  fi
}
function gpu-on()     { __load-nvidia load;   }
function gpu-off()    { __load-nvidia unload; }
function gpu-status() { __load-nvidia status; }


function git-tree() { git log --oneline --decorate --all --graph; }


function catman() { man "$@" | col -b; }


function shut() {
  if __linux; then
    local query=$(prime-select query)
    if [ $query = nvidia ]; then
      sudo prime-select intel
    fi
    sleep 3; sudo shutdown -h now
  fi
}


function te() {
  if __linux; then
    gedit "$@" &
  fi
}
