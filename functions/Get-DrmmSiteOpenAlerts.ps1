function Get-DrmmSiteOpenAlerts {

	<#
	.SYNOPSIS
	Fetches the open alerts of the site identified by the given site Uid.

	.PARAMETER siteUid
	Provide site uid which will be used to return device open alerts.
	
	#>
    
	# Function Parameters
    Param (
        [Parameter(Mandatory=$True)] 
        $siteUid
    )
	
    # Declare Variables
    $apiMethod = 'GET'
    $maxPage = 250
    $nextPageUrl = $null
    $page = 0
    $Results = @()

    do {
	    $Response = New-ApiRequest -apiMethod $apiMethod -apiRequest "/v2/site/$siteUid/alerts/open?max=$maxPage&page=$page" | ConvertFrom-Json
	    if ($Response) {
		    $nextPageUrl = $Response.pageDetails.nextPageUrl
		    $Results += $Response.alerts
		    $page++
	    }
    }
    until ($nextPageUrl -eq $null)

    # Return all site devices
    return $Results

}