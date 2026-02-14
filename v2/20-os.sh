__macos() {
	if [ $(uname -s) = Darwin ]; then
		return 0
	else
		return 1
	fi
}


__linux() {
	if [ $(uname -s) = Linux ]; then
		return 0
	else
		return 1
	fi
}


__wsl() {
	if uname -r | grep -qi microsoft; then
		return 0
	else
		return 1
	fi
}
