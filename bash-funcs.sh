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
  string__=$1
  substring__=$2
  if test "${string__#*$substring__}" != "$string__"; then
    return 0
  else
    return 1
  fi
}
function __add_dir_to_path() {
  flag__=$1 # front__ or back__
  dir__=$2
  pathname__=$3
  path__=$(eval echo -e "\$$pathname__")
  if ! __contains $path__ $dir__; then
    if [ -d $dir__ ]; then
      if [ $flag__ = front__ ]; then
        export $pathname__=$dir__:$path__
      fi
      if [ $flag__ = back__ ]; then
        export $pathname__=$path__:$dir__
      fi
    fi
  fi
}
function __insert_dir_to_front() {
  __add_dir_to_path front__ $1 $2
}
function __append_dir_to_back() {
  __add_dir_to_path back__ $1 $2
}


function __tar_cx() {
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
  __tar_cx c $*
}
function untar() {
  __tar_cx x $*
}
function viewtar() {
  tar -tf $*
}


function __load-nvidia() {
  if __linux; then
    # arg = load / unload / status
    arg__=$1
    if [ $arg__ = 'status' ]; then
      # print current status
      cat /proc/acpi/bbswitch
      echo Running nvidia-smi...
      nvidia-smi
    elif [ $arg__ = 'unload' ]; then
      # unload a driver then turn the card off
      sudo modprobe -r nvidia-uvm nvidia
      echo OFF | sudo tee /proc/acpi/bbswitch
    elif [ $arg__ = 'load' ]; then
      # turn on the card first then load a driver
      echo ON | sudo tee /proc/acpi/bbswitch
      sudo modprobe nvidia-uvm nvidia
    fi
  fi
}
function load-nvidia() {
  __load-nvidia load
}
function unload-nvidia() {
  __load-nvidia unload
}
function status-nvidia() {
  __load-nvidia status
}


function git-tree() {
  git log --oneline --decorate --all --graph
}
