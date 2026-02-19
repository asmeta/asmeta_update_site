#!/bin/bash
# save the current location
updatesite=$(pwd)
echo "$updatesite"
# the name of the dir
OLD_ECL=eclipse_fresh

# this part can be changed
eclipsesubdir=2025-12/R/ 
eclipsezip=eclipse-java-2025-12-R-win32-x86_64.zip
zipname=eclipse_asmeta_smv_2026_02_win64.zip


#
# remove old eclipse (it may contain asmeta) (already in temp)
#
remove_old_eclipse(){
	if [ -d "$OLD_ECL" ]; then
    	printf '%s\n' "Removing existings eclipse ($OLD_ECL)"
    	rm -rf "$OLD_ECL"
	fi
}
# 
# download the latest eclipse (already in temp)
# 
download_eclipse(){
	eclipseurldir=http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/
	# first download eclipse
	# use he mirror service, skip if it already exists 
	wget --no-clobber ${eclipseurldir}${eclipsesubdir}${eclipsezip}
	#
	# unzip the new one
	unzip ${eclipsezip}
	# 
	mv eclipse $OLD_ECL
}
#
# install the plugins
#
install_plugins(){
	cd $OLD_ECL
	#
	# this is to test the local update site
	# questo non funziona perch� LTS prende un path diverso e la variabile non punta a directory corretta.
	#./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository file://$updatesite  -installIU Asmeta
	# questo non va perch� il path lo interpreta male
	# ./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository file:/home/garganti/progettiDaSVN/asmeta/asmeta_update_site  -installIU Asmeta
	# uso i path di windows
	#
	# questo sul fisso dell'ufficio
	baseasmetalocale=D:\\AgHome\\progettidaSVNGIT
	#
	# questo da casa vecchio
	# baseasmetalocale=D:\\AgDocuments\\progettiDaSVN
	#
	# questo dal portatile asus zenbook
	# baseasmetalocale=C:\\Users\\angel\\codicefromrepos\\ricerca
	#	
	# dal portatile duo 
	#baseasmetalocale=C:\\Users\\angel\\codiceDaRepos\\research	
	#
	#baseasmetalocale=/home/garganti/winhome/codicefromrepos/ricerca/
	# 
	# adesso prova ad installare
	echo $baseasmetalocale
	#
	./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository https://download.eclipse.org/releases/latest,file:/$baseasmetalocale\\asmeta\\asmeta_update_site -installIU Asmeta
	#
	# this is to test the official update site
	# ./eclipsec.exe -noSplash -application org.eclipse.equinox.p2.director  -repository https://raw.githubusercontent.com/asmeta/asmeta_update_site/master,https://download.eclipse.org/releases/latest -installIU Asmeta
	cd ..
	# test as update - NON RIESCO p2. director non permette l'update
}
# build the zip
make_zip(){
	# rename as eclipse
	mv $OLD_ECL eclipse
	#
	zip -r ${zipname} eclipse
	zip -r ${zipname} NuSMV-2.7.0-win64
	zip -r ${zipname} nuXmv-2.1.0-win64
	zip ${zipname} eclipse_nusmv.bat	
}

# main
# common go to temp
# make a temp dir if not exists
mkdir -p temp
pushd temp
# personalize - comment/uncomment what you want
#remove_old_eclipse
#download_eclipse
# try to install the plugin
#install_plugins
make_zip 
popd