#!/bin/bash

_CONFIG=/opt/retronas/dialog/retronas.cfg
source $_CONFIG

[ -f $AGREEMENT ] && exit 0
clear

cat << EOF
=============================================================================
                    WARNING / TERMS OF USE / LICENSE
=============================================================================

          RetroNAS is a compilation of existing opensource products. 

              RetroNAS is made available under the MIT license
            https://github.com/danmons/retronas/blob/main/LICENSE

Due to the nature of retro computing, many of the tools and protocols used in 
this project are COMPLETELY INSECURE. It is at the users behest which tools
are installed and as such all liabilies are transfered to you as the user in 
the use of RetroNAS.

Most of these tools offer little to NO ENCRYPTION of either data or passwords, 
some tools offer access to your system WITHOUT any AUTHENTICATION, and some of 
the protocols have known EXPLOITS that cannot be fixed due to their legacy 
design.

  The RetroNAS team only support use of this software on a PRIVATE NETWORK

A private network is considered one where at the very least the RetroNAS is 
located behind a firewall that denies inbound traffic from the internet.

         DO NOT expose a configured RetroNAS to the public INTERNET

Doing so may result is unintentional DATA LOSS and or exposure of your network
and subsequent contents beit computer and/or data to BAD ACTORS. It is your 
responsiblity to secure your network and data.

The services RetroNAS installs will attempt to run as unprivileged user accounts 
where possible, but the RetroNAS installer scripts themselves all run as root
(the "Adminstrator" account in Linux). These have the power to dramatically 
change and break working systems, so please ensure you either review the code 
first, or run this only on a system dedicated to the purpose.

       If you are UNSURE if ANY of the ABOVE statements apply to you. 

                    DO NOT CONTINUE to use this project.
                    
      If you have questions in regards to RetroNAS use and/or risk you may 
       ask your question on the github discussion boards for the project.

       The RetroNAS team may in turn use this enquiry to revise support 
                 documentation for the benefit of the project

                     https://github.com/danmons/retronas

              The RetroNAS team are retro computing ENTHUSIASTS 

The RetroNAS team should not be considered computer, networking nor security 
experts and as such you are responsible to EDUCATE YOURSELF to the use of 
and/or risks associated with the tools in this project.

          This is NOT A NAS project for use with modern computing

If you understand the above fully and accept all subsequent liabilties as your
own in use of this project type AGREE at the prompt otherwise cease use of this
project immediately.

EOF

read -p "LICENSE will follow, press Enter"
echo ""
cat $RNDIR/LICENSE
echo ""
read -p "type AGREE to accept the above in use of this project: " INPUT

case $INPUT in
  "AGREE")
    touch $AGREEMENT
    exit 0
    ;;
  *)
    exit 1
esac
