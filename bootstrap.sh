#!/bin/sh
# Nixup bootstrap system.
#
# Final goal:
#   To get the system to a point where Lua can download and install packages.
# Intermediate goals:
# - Negotiate user permissions to perform setup actions
#   (sudo, su, already running as root, etc).
# - Ensure Internet access (TODO).
# - Install distro package for Lua (or install from source).
# - Install LuaRocks (used in preference to distro packages for Lua libraries).
# - Save configuration?

#Determine current distro
./bootstrap/set-distro.sh

#At this point, defer all further actions to this distro's specific bootstrap procedure
./distro/$DISTRO/bootstrap.sh
