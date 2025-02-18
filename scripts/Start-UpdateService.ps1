$serverLocation = '/app/server'

$updatesEnabled=$env:UPDATES_ENABLED
[int]$updatesInterval=$env:UPDATES_INTERVAL
[int]$steamAppId=$env:STEAM_APPID
[string]$steamcmdArgs=$env:UPDATES_STEAMCMD_ARGS

function RunSteamCMD()
{
  AddUpdateLock

  if (-Not (Test-Path $serverLocation))
  {
    Write-Output "Server folder doesn't exist, creating it now"
    New-Item $serverLocation -ItemType Directory
  }
  $steamArgs="+force_install_dir '$serverLocation' +login anonymous +app_update $steamAppId $steamcmdArgs +quit"
  
  # For some reason, if we don't run it this exact way, steamcmd just hangs forever after updating itself
  $invocation = "-Command & {/steam/steamcmd.sh $steamArgs}"
  Start-Process pwsh -ArgumentList $invocation -NoNewWindow -Wait -Passthru
  Write-Output "Done updating"
  RemoveUpdateLock
}

function RunUpdate()
{
  return (($updatesEnabled) -or (-not (Test-Path /app/server/*)))
}

# ----------------- Main Section  -----------------

Import-Module /scripts/Server-Tools/Server-Tools.psm1 -Force
while (RunUpdate)
{
  if (InstalledVersion -ne LatestVersion)
  {
    Write-Output "Installed version doesn't match latest version, running update"
    RunSteamCMD
  }
  RemoveUpdateLock
  Start-Sleep ($updatesInterval * 60)
} # while (RunUpdate)
