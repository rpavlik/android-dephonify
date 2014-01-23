#!/system/bin/sh

# Part of https://github.com/rpavlik/android-dephonify

# License: http://opensource.org/licenses/mit-license.html

# Copyright (c) 2013 Ryan Pavlik <rpavlik@acm.org>

# Permission is hereby granted, free of charge, to any person obtaining a 
# copy of this software and associated documentation files (the 
# "Software"), to deal in the Software without restriction, including 
# without limitation the rights to use, copy, modify, merge, publish, 
# distribute, sublicense, and/or sell copies of the Software, and to 
# permit persons to whom the Software is furnished to do so, subject to 
# the following conditions: 

# The above copyright notice and this permission notice shall be included 
# in all copies or substantial portions of the Software. 

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 

mount -ro remount,rw /system

PKGS="CellBroadcastReceiver.apk TelephonyProvider.apk TelocationProvider.apk Phone.apk Network3gMonitor.apk Provision.apk shortcut3g.apk Mms.apk Stk.apk WAPPushManager.apk"

pkgToLocation() {
	echo "/system/app/$1"
}

pkgToDisabledLoc() {
	echo "/system/app/Old${pkg}.old"
}

pathcheck_disable() {
	pkgToLocation $1
}

do_disable() {
	echo "Disabling $1 by rename..."
	mv "$(pkgToLocation ${1})" "$(pkgToDisabledLoc ${1})"
}

pathcheck_remove() {
	pathcheck_disable $1
}

do_remove() {
	echo "Permanently removing $1 (until you next reflash the main ROM)"
	rm -f "$(pkgToLocation ${1})"
}

pathcheck_enable() {
	pkgToDisabledLoc $1
}

do_enable() {
	echo "Re-enabling $1 by rename..."
	mv "$(pkgToDisabledLoc ${1})" "$(pkgToLocation ${1})"
}

mode=$1
if [ -z "$mode" ]; then
	mode=disable
fi

changesFlag="not "

for pkg in $PKGS; do
	if [ -f "$(pathcheck_${mode} ${pkg})" ]; then
		do_${mode} ${pkg}
		changesFlag=""
	else
		#echo "Skipping ${pkg}"
		echo
	fi
done

echo
echo "Phone shell script complete. Changes ${changesFlag}made."
