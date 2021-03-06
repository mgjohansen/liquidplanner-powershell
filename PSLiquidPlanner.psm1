<#
.SYNOPSIS
    Test if auth & workspace id is set in the current session
.EXAMPLE
    Test-LiquidPlannerEnvironment
    Will check if auth & workspace id is set
#>
function Test-LiquidPlannerEnvironment {
    if ($Global:LiquidPlannerCredentials -or $Global:LiquidPlannerToken -and $Global:LiquidPlannerWorkspace) {
        return $true;
    } else {
        return $false;
    }
}

<#
.SYNOPSIS
    Test if auth is set in the current session
.EXAMPLE
    Test-LiquidPlannerAuthIsSet
    Will check if auth is set either from credentials or a token
#>
function Test-LiquidPlannerAuthIsSet {
    if ($Global:LiquidPlannerCredentials -or $Global:LiquidPlannerToken) {
        return $true;
    } else {
        return $false;
    }
}

<#
.SYNOPSIS
    Test if a workspace id is set in the current session
.EXAMPLE
    Test-LiquidPlannerWorkspaceIdIsSet
    Will check if a workspace id is set
#>
function Test-LiquidPlannerWorkspaceIdIsSet {
    if ($Global:LiquidPlannerWorkspace) {
        return $true;
    } else {
        return $false;
    }
}

<#
.SYNOPSIS
    Set's the auth to your Liquid Planner URL using credentials
.PARAMETER Creadentials
    Parameter to specify the credentials to use. Mandatory Parameter.
.EXAMPLE
    Set-LiquidPlannerAuth -Credentials 'user@company.com'
    Set the credentials to user@company.com
#>
function Set-LiquidPlannerAuth {
    param(
        [parameter(mandatory=$true)]
        [System.Management.Automation.PSCredential]$Credentials
    )
    $Global:LiquidPlannerRESTURL = 'https://app.liquidplanner.com/api'
    $Global:LiquidPlannerCredentials = $Credentials
    return $true;
}

<#
.SYNOPSIS
    Set's the auth to your Liquid Planner URL using a token
.NOTES
    Tokens can be created under Settings -> My API Tokens in Liquid Planner
.PARAMETER Token
    Parameter to specify filter to use in the query. Optional Parameter.
.EXAMPLE
    Set-LiquidPlannerAuthToken -Token '12a3bc4d-5678-9e0f-8c92-8affa74dd371'
    Set's the auth token to 12a3bc4d-5678-9e0f-8c92-8affa74dd371
#>
function Set-LiquidPlannerAuthToken {
    param(
        [parameter(mandatory=$true)]
        [string]$Token
    )
    $Global:LiquidPlannerRESTURL = 'https://app.liquidplanner.com/api'
    $Global:LiquidPlannerToken = $Token
    return $true;
}

<#
.SYNOPSIS
    Removes all Liquid Planner related variables
.EXAMPLE
    Remove-LiquidPlannerEnvironment
    Will clean your environment and remove all Liquid Planner Global variables
#>
function Remove-LiquidPlannerEnvironment {
    if ($Global:LiquidPlannerRESTURL) {
        Remove-Variable -Name LiquidPlannerRESTURL -Scope Global
    }
    if ($Global:LiquidPlannerCredentials) {
        Remove-Variable -Name LiquidPlannerCredentials -Scope Global
    }
    if ($Global:LiquidPlannerToken) {
        Remove-Variable -Name LiquidPlannerToken -Scope Global
    }
    if ($Global:LiquidPlannerWorkspace) {
        Remove-Variable -Name LiquidPlannerWorkspace -Scope Global
    }
    return $true;
}