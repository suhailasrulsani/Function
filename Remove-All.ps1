<#
	.SYNOPSIS
		Remove all folder/subfolder/file
	
	.DESCRIPTION
		The Function will perform Remove folders/subfolders/files with ErrorAction SilentlyContinue
	
	.EXAMPLE
		PS C:\> Remove-All -Location 'Value1'
	
	.NOTES
		Additional information about the function.
	
	.PARAMETER Location
		A description of the Location parameter.
#>
function Remove-All
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[string]$Path
	)
	
	Remove-Item -Path $Path -Recurse -ErrorAction SilentlyContinue
	If ((Test-Path -Path $Path) -like "*FALSE*")
	{
		Write-Host "All files/folders has been removed successfully"
	}
	
	If ((Test-Path -Path $Path) -like "*TRUE*")
	{
		Write-Host "Not All files/folders able to remove"
	}
}

$Paths = @("C:\Users\Suhail Yuli\Desktop\1",
	"C:\Users\Suhail Yuli\Desktop\2",
	"C:\Users\Suhail Yuli\Desktop\3"
)


foreach ($Path in $Paths)
{
	Remove-All -Path $Path
}
