function Enable-Disable-Tv {
    Import-Module DisplayConfig
    $displays = Get-DisplayInfo

    $AlienwareID    = ($displays | Where-Object { $_.DisplayName -like "*AW2521HFLA*" }).DisplayId
    $AcerID      = ($displays | Where-Object { $_.DisplayName -like "*S241HL*" }).DisplayId
    $TvID = ($displays | Where-Object { $_.DisplayName -like "*32W_LCD_TV*" }).DisplayId
    $TvActive = ($displays | Where-Object { $_.DisplayId -eq $TvID }).Active

    if ($TvActive) {
        Write-Output "Switching to Profile 1: Alienware + Acer On, Tv Off"
        Enable-Display -DisplayId $AlienwareID, $AcerID
        Disable-Display -DisplayId $TvID
    } else {
        Write-Output "Switching to Profile 2: Tv On, Alienware + Acer Off"
        Enable-Display -DisplayId $TvID
        Disable-Display -DisplayId $AcerID, $AlienwareID
    }
}

# Call the function
Enable-Disable-Tv
