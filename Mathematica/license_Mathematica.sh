#!/bin/bash

###################################################################################################
# Script Name:  license_Mathematica.sh
# By:  Zack Thompson / Created:  1/10/2018
# Version:  1.0 / Updated:  1/10/2018 / By:  ZT
#
# Description:  This script applies the license for Mathematica applications.
#
###################################################################################################

/usr/bin/logger -s "*****  License Mathematica process:  START  *****"

##################################################
# Define Variables

licenseFile="/Library/Mathematica/Licensing/mathpass"

##################################################
# Create the license file.

/usr/bin/logger -s "Creating license file..."

/bin/cat > "${licenseFile}" <<licenseContents
!license.server.com

licenseContents

if [[ -e "${licenseFile}" ]]; then
	# Set permissions on the file for everyone to be able to read.
	/usr/bin/logger -s "Applying permissions to license file..."
	/bin/chmod 644 "${licenseFile}"
else
	/usr/bin/logger -s "ERROR:  Failed to create the license file!"
	/usr/bin/logger -s "*****  License Mathematica process:  FAILED  *****"
	exit 1
fi

/usr/bin/logger -s "Mathematica has been activated!"
/usr/bin/logger -s "*****  License Mathematica process:  COMPLETE  *****"

exit 0