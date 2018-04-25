$inetattached = 0
#$OutputVariable = ""
$line = ""
While(1)
{
	$count = 0
	$OutputVariable = (adb devices) | Out-String	
	
	ForEach($line in $($OutputVariable -split "`r`n"))
	{
		echo $line
		$count = $count + 1
			If($line -match 'List')
			{}
			ElseIf($line -match 'device')
			{
				If($inetattached -eq 0)
				{
					adb shell su -c "service call connectivity 30 i32 1"
					$inetattached = 1;
				}
			}
	}
	If($count -lt 4)
	{
		$inetattached = 0
	}
	If($inetattached)
	{
		sleep 5
	}
	sleep 5
	
}