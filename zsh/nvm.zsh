# This is a helper function which do lazy loading of nvm
# To initialize nvm at the beginning is really slow, it's better to delay it to it's first usage
nvm () {
	unhash -f nvm # unregister this function and from this point the real nvm will be used

	# NVM sourcing
	export NVM_DIR="$HOME/.nvm"
	[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

	nvm "$@" # run the real nvm with the original params
}
