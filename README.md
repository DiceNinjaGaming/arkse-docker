# Ark: Survival Evolved
An image for Ark: Survival Evolved dedicated servers.

# THIS IS STILL WIP
We are still working on adding features and stabilizing the server.

# System Requirements
| Name | Description |
| - | - |
| Processor | 2 CPU cores with more than 3.0 GHz (for 10 to 15 players) |
| Memory | 8GB Minimum |
| Storage | 30-50GB |
| Internet Connection | Broadband internet connection. Hosting from home will require the ability to configure port forwarding |

# Important folders
| Name | Description |
| - | - |
| /app/server | Game server files |
| /app/backups | Backup files |
| /app/logs | Logs for the various processes |
| /app/configs | Folder that contains the default configuration files. Due to the complexity of Ark configuration, you will need to put the config files here rather than define the parameters via environment variables. |

# Imporant notes about the server
- It is not unusual for the Ark server to take 10-20 minutes to fully start up and be ready to go, especially for a brand new server. This is not a fault of Docker, it's just a huge server
- It is normal for there to be almost no output in the server.log after the server starts up
- You MUST increase the number of open files allowed within Linux [see here for instructions](https://steamcommunity.com/app/346110/discussions/10/530646715633129423/?ctp=29). Failure to do this will prevent the server from starting. In addition, if you are running multiple servers (especially if you're running multiple Ark servers), you may want to double the number of open files from the recommendation in that link.
- The following error message does not necessarily mean something is wrong:
`[S_API FAIL] SteamAPI_Init() failed; SteamAPI_IsSteamRunning() failed.
Setting breakpad minidump AppID = 346110`

# Environment Variables
## General
| Name | Default | Description |
| ---------------- | ------- | ----------- |
| SERVER_NAME | Default Server Name | The name to be displayed in the server list |
| SERVER_PASSWORD | DefaultPassword | The password to be used for the server |
| ADMIN_PASSWORD | DefaultAdminPassword | The password to be used for admin access to the server (CHANGE THIS FROM THE DEFAULT) |
| SERVER_PORT | 7777 | The port to be used by the server |
| QUERY_PORT | 27015 | The query port to be used by the server |
| MAP_NAME | TheIsland | The name of the map to load. [The full list can be found here](https://ark.fandom.com/wiki/Server_configuration#Map_names) |
| FILE_LIMIT | 100000 | Max file limit within the container itself. [See this link for how to set this up in your host server](https://steamcommunity.com/app/346110/discussions/10/530646715633129423/?ctp=29) |
| TZ | Etc/UTC | Time zone for the server. A full list can be [found here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
| FILE_UMASK | 022 | umask value to use for configs, backups, and server files. [This article](https://www.digitalocean.com/community/tutorials/linux-permissions-basics-and-how-to-use-umask-on-a-vps) has a good explanation on permissions and how the umask works
| UPDATES_ENABLED | true | Whether to check for updates or not |
| UPDATES_INTERVAL | 15 | Number of minutes between update checks |
| UPDATES_WHILE_USERS_CONNECTED | false | Whether or not to run updates when users are connected. If set to true,
it can cause connected users to lose progress |
| UPDATES_STEAMCMD_ARGS | | Additional arguments to be passed to the steamcmd command |
| RCON_PORT | 25575 | RCON port, if available for the server
| RCON_PASSWORD | ChangeThisPasswordIfUsingRCON | Password to use if exposing RCON |
| RCON_MAX_KARMA | 60 | |

## Backups
| Name | Default | Description |
| ---------------- | ------- | ----------- |
| BACKUPS_ENABLED | true | Whether or not backups should be enabled |
| BACKUPS_MAX_AGE | 3 | Backups more than this many days old will be removed |
| BACKUPS_MAX_COUNT | 0 | Maximum number of backups to keep. 0 keeps all backups |
| BACKUPS_INTERVAL | 360 | Number of minutes between backups |


