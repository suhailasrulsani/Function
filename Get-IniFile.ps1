function Get-IniFile
{
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[string]$Path
	)
	
	$anonymous = "NoSection"
	
	$ini = @{ }
	switch -regex -file $Path
	{
		"^\[(.+)\]$" # Section  
		{
			$section = $matches[1]
			$ini[$section] = @{ }
			$CommentCount = 0
		}
		
		"^(;.*)$" # Comment  
		{
			if (!($section))
			{
				$section = $anonymous
				$ini[$section] = @{ }
			}
			$value = $matches[1]
			$CommentCount = $CommentCount + 1
			$name = "Comment" + $CommentCount
			$ini[$section][$name] = $value
		}
		
		"(.+?)\s*=\s*(.*)" # Key  
		{
			if (!($section))
			{
				$section = $anonymous
				$ini[$section] = @{ }
			}
			$name, $value = $matches[1 .. 2]
			$ini[$section][$name] = $value
		}
	}
	
	return $ini
}

$iniFile = Get-IniFile -Path ".\test.ini"
$app = $iniFile.NoSection.APP
$dll = $iniFile.NoSection.DLL

$testIni = Get-IniFile .\Test.ini
$name = $testIni.owner.name
$name
