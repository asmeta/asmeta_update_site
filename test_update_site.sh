#!/bin/bash

# save the current location
updatesite=$(pwd)

# make a remp dir
#mkdir temp
cd temp
# first download eclipse
# use he mirror service, skip if it alredy exits 
#wget --no-clobber http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/2020-03/R/eclipse-java-2020-03-R-win32-x86_64.zip

#unzip it
#unzip eclipse-java-2020-03-R-win32-x86_64.zip

# install the plugins
cd eclipse
#
#./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository file://$updatesite  -installIU Asmeta
./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository file:/home/garganti/progettiDaSVN/asmeta/asmeta_update_site  -installIU Asmeta

# delete temp
#rm -rf temp