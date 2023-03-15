systeminfo.exe | 
% {
    if (($_ -like '*Original Install Date*') -or ($_ -like '*BIOS Version*')) {
        $_
    }
    
}
