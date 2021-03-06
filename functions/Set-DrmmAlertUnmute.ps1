function Set-DrmmAlertUnmute {

	<#
	.SYNOPSIS
	Unmutes the alert identified by the given alert Uid.

	.DESCRIPTION
	Resume alert providing the alert Uid.

	.PARAMETER AlertUid
	Provide alert Uid to unmute the alert.
	
	#>

	# Function Parameters
    Param (
        [Parameter(Mandatory=$True)] 
        $alertUid
    )

	# Declare Variables
	$apiMethod = 'POST'

	# Unmute Alert
	return New-ApiRequest -apiMethod $apiMethod -apiRequest "/v2/alert/$alertUid/unmute"

}