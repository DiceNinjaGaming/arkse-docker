$defaultConfigDirectory='/app/configs/'
$destinationConfigDirectory=(Join-Path '/app/server' '/ShooterGame/Saved/Config/LinuxServer/')
$configFiles=@{
  'Game.ini'=$destinationConfigDirectory
  'GameUserSettings.ini'=$destinationConfigDirectory
}

function Copy-Configs
{
  foreach ($file in $configFiles.GetEnumerator())
  {
    $sourceFile = (Join-Path $defaultConfigDirectory $file.Name)
    if (Test-Path $sourceFile)
    {
      if (-Not (Test-Path $file.Value)) { mkdir -p $($file.Value) } # New-Item does really weird things in here
      Copy-Item $sourceFile $file.Value
    } # if (Test-Path $sourceFile)
  } # foreach ($file in $configFiles.GetEnumerator())
} # function Copy-Configs

function Update-ConfigFile
{
  
}
