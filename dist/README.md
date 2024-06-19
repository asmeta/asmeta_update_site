# Artifact guidelines
## Title of the original tutorial paper "ASMETA tool set for rigorous system design" submitted at the 26th International Symposium on Formal Methods (FM 2024) - Tutorial track

This document contains the steps to be followed to reproduce the tutorial’s claims.

## Software installation
Step 1: Download the .zip file containing the Asmeta tools available [here](https://zenodo.org/records/11955939) depending on your system:

* [eclipse_asmeta_smv_2024_06_win64.zip](https://zenodo.org/records/11955939/files/eclipse_asmeta_smv_2024_06_win64.zip?download=1) 
* [eclipse_asmeta_smv_2024_06_linux_x86_64.zip](https://zenodo.org/records/11955939/files/eclipse_asmeta_smv_2024_06_linux_x86_64.zip?download=1) 
* [eclipse_asmeta_smv_2024_06_macOs_aarch64.zip](https://zenodo.org/records/11955939/files/eclipse_asmeta_smv_2024_06_macOs_aarch64.zip?download=1) 

Step 2: Unzip the content

Step 3: Run the file in the main folder depending on your OS:

* win64: *asmeta_win64.bat*
* linux_x86_64: *asmeta_linux64.sh*
* macOs_aarch64: *asmeta_macOs_install.sh* and *asmeta_macOs_run.sh*

Eclipse is now running and in the workspace there are two projects:
* *STDL* containing the Asmeta libraries
* *tutorial_FM24* containing the Asmeta models of the Pill-Box Case Study

For other platforms, instead, we provide an update site that can be used to install all the required plugins in any Eclipse version. Then the projects *STDL* and *tutorial_FM24* can be downloaded from [here](https://github.com/asmeta/asmeta/tree/master/asmeta_models) and imported into Eclipse.


In the following, we will explain the steps to use the Asmeta tools on the *pillbox_ground.asm* model, the same steps can be followed for the other models.

## Model Simulation: AsmetaS

### Interactive simulation

Step 1: Uncheck the following two options in "Window -> Preferences -> Asmeta -> Simulator":

* Stop simulation if the update set is empty
* Stop simulation if the update set is trivial

Step 2: Open the *pillbox_ground.asm* model in the Eclipse editor then run the specification iteratively in the console using ![run_asmeta_model](images/run_asm_tool.png) button.

Let's assume that we want to simulate the scenario in Fig. 5 of the paper: *the pill in drawer 1 hits the deadline (in State 0), so the pill becomes to be taken (State 1), the led becomes ON (State 2), the user takes the pill, and the led becomes OFF (State 3)*.
In the following are listed the current state, the **inputs to be set** in the console, and the updated functions.

* State 0:

  Current state:
     * drawerLed(drawer1) = OFF
     * drawerLed(drawer2) = OFF
     * drawerLed(drawer3) = OFF
     * isPillTobeTaken(drawer1) = true
     * isPillTobeTaken(drawer2) = false
     * isPillTobeTaken(drawer3) = false

  Inputs (monitored functions):
  * pillDeadlineHit(drawer1) = true
  * pillDeadlineHit(drawer2) = false
  * pillDeadlineHit(drawer3) = false
 
  Update set:
  * isPillTobeTaken(drawer1)=true
 
 * State 1:

   Current state:
   * drawerLed(drawer1) = OFF
   * drawerLed(drawer2) = OFF
   * drawerLed(drawer3) = OFF
   * isPillTobeTaken(drawer1) = true
   * isPillTobeTaken(drawer2) = false
   * isPillTobeTaken(drawer3) = false
    
   Inputs (monitored functions):
   * pillDeadlineHit(drawer1) = false
   * pillDeadlineHit(drawer2) = false
   * pillDeadlineHit(drawer3) = false
 
   Update set:
    * drawerLed(drawer1) = ON

* State 2:

  Current state:
   * drawerLed(drawer1) = ON
   * drawerLed(drawer2) = OFF
   * drawerLed(drawer3) = OFF
   * isPillTobeTaken(drawer1) = true
   * isPillTobeTaken(drawer2) = false
   * isPillTobeTaken(drawer3) = false
     
  Inputs (monitored functions):
  * pillDeadlineHit(drawer1) = false
  * pillDeadlineHit(drawer2) = false
  * pillDeadlineHit(drawer3) = false
  * isPillTaken(drawer1) = true

  Update set:
   * isPillTobeTaken(drawer1) = false
   * drawerLed(drawer1) = OFF

 * State 3:
   
   Current state:
   * drawerLed(drawer1)=OFF
   * drawerLed(drawer2)=OFF
   * drawerLed(drawer3)=OFF
   * isPillTobeTaken(drawer1)=false
   * isPillTobeTaken(drawer2)=false
   * isPillTobeTaken(drawer3)=false
  
To simulate other scenarios use different inputs.

### Random simulation

Step 1: Open the *pillbox_ground.asm* model in the Eclipse editor then run the specification randomly in the console using ![run_asmeta_model](images/run_rnd.png) button.

The inputs are randomly chosen, and the simulation is displayed in the console.

## Model Animation     

Step 1: Open the *pillbox_ground.asm* model in the Eclipse editor then run the specification using the animator by pressing the ![run_asmeta_model](images/runAnimatorInt.png) button.
