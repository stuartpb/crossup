#TODO: check if internet connection is working
#If not, look for possible hardware?
#  (current approach is brute-force anything it's ever been)
#if the hardware needs an additional package not installed to work,
#install it (from a package we just happen to have brought with us)
#For instance, for Broadcom cards that don't have drivers in the core:
##pushd broadcom-wl >0
##makepkg -s -i
##popd
#Prompt for whatever networking stuff to get the network working.

#no need to bootstrap Lua - it's built in to the core!

#TODO: negotiate a method to run commands as root based on the current user status

#get Clyde from the AUR to make all the other AUR packages go down smooth
#Clyde PKGBUILD included - otherwise you'd have to run:
#wget http://aur.archlinux.org/packages/clyde-git/PKGBUILD

#Install base-devel (needed for any AUR package, including Clyde)
# as root:
##pacman -S base-devel
# (there may need to be some sort of thing you throw in there to explicitly specify "all")
