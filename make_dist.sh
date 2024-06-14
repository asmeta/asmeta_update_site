#!/bin/bash

cd dist 

# copy from temp to here in win64
#cp -r ../temp/eclipse_fresh win64
#cd win64
#mv eclipse_fresh eclipse
#cd ..

# create the workspace with the tutorial
#rm -rf workspace
#mkdir workspace
#mkdir workspace/tutorials

# copy also the standard library files
#cp -r ../../asmeta/asmeta_models/STDL/ workspace
# copythe tutorial for FM
#cp -r ../../asmeta/asmeta_models/tutorials/tutorial_FM24 workspace/tutorials

# zip everything
# TODO it is in the same dir
rm  eclipse_asmeta_smv_2024_06.zip
zip -r eclipse_asmeta_smv_2024_06.zip .