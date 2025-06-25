function Enable-Disable-Dual-Monitor {
    Import-Module DisplayConfig
    $displays = Get-DisplayInfo

    $AlienwareID    = ($displays | Where-Object { $_.DisplayName -like "*AW2521HFLA*" }).DisplayId
    $AcerID      = ($displays | Where-Object { $_.DisplayName -like "*S241HL*" }).DisplayId
    $AcerActive = ($displays | Where-Object { $_.DisplayId -eq $AcerID }).Active

    if ($AcerActive) {
        Write-Output "Switching To Single Monitor Mode"
        Enable-Display -DisplayId $AlienwareID
        Disable-Display -DisplayId $AcerID
    } else {
        Write-Output "Switching To Dual Monitor Mode"
        Enable-Display -DisplayId $AcerID, $AlienwareID
    }
}

# Call the function
Enable-Disable-Dual-Monitor
