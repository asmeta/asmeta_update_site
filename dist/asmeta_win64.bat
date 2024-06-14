:: set the path for NuSMV 
SET PATH=%CD%\win64\NuSMV-2.6.0-win64\bin;%PATH%
:: run eclipse with the workspace
::START /b "" "%CD%\eclipse\eclipse" -clean
START /b "" "%CD%\win64\eclipse\eclipse" -data %CD%\win64\workspace_win64