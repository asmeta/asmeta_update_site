:: set the path for NuSMV 
SET PATH=%CD%\asmeta_win64\NuSMV-2.6.0-win64\bin;%PATH%
:: run eclipse with the workspace
START /b "" "%CD%\asmeta_win64\eclipse\eclipse" -data "%CD%\asmeta_win64\workspace"