$ScriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

#region Function
function Write-Log
{
	[CmdletBinding()]
	param (
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[string]$Message,
		[Parameter()]
		[ValidateNotNullOrEmpty()]
		[ValidateSet('Information', 'Warning', 'Error')]
		[string]$Severity = 'Information'
	)
	
	[pscustomobject]@{
		Time = (Get-Date -f g)
		Message = $Message
		Severity = $Severity
	} | Export-Csv -Path "$ScriptDir\LogFile.csv" -Append -NoTypeInformation
}
#endregion Function
