$inetattached = 0
While(1)
{
	$OutputVariable = (adb devices) | Out-String	
	If($OutputVariable -match '5463f6a2')
	{
		If($inetattached -eq 0)
		{
			adb -d shell su -c "service call connectivity 30 i32 1"
			$inetattached = 1
		}
	}
	Else
	{
		$inetattached = 0
	}
	If($inetattached)
	{
		sleep 5
	}
	sleep 5
	
}