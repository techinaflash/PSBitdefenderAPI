function RemoveBitdefenderAPIKey (){
	Remove-Variable -Name "BitdefenderAPIKey" -Scope global -Force
	Write-Verbose "Removed BitdefenderAPIKey from Global scope"
}