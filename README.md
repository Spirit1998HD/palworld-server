# Palworld Server

[![Static Badge](https://img.shields.io/badge/Github-2B3137?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI%2BPHBhdGggZD0iTTI2IDNhMSAxIDAgMCAwLS4xIDBIMjBhMSAxIDAgMSAwIDAgMmgzLjZMMTMuMyAxNS4zYTEgMSAwIDEgMCAxLjQgMS40TDI1IDYuNFYxMGExIDEgMCAxIDAgMiAwVjQuMUExIDEgMCAwIDAgMjYgM3pNNiA3QzUgNyA0IDggNCA5djE1YzAgMSAxIDIgMiAyaDE1YzEgMCAyLTEgMi0yVjExLjRsLTIgMlYyNEg2VjloMTAuNmwyLTJINnoiIGZpbGw9IiNmZmYiLz48L3N2Zz4%3D&labelColor=%233e464f)
](https://github.com/Spirit1998HD/palworld-server)
[![Static Badge](https://img.shields.io/badge/Docker-1D67ED?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI%2BPHBhdGggZD0iTTI2IDNhMSAxIDAgMCAwLS4xIDBIMjBhMSAxIDAgMSAwIDAgMmgzLjZMMTMuMyAxNS4zYTEgMSAwIDEgMCAxLjQgMS40TDI1IDYuNFYxMGExIDEgMCAxIDAgMiAwVjQuMUExIDEgMCAwIDAgMjYgM3pNNiA3QzUgNyA0IDggNCA5djE1YzAgMSAxIDIgMiAyaDE1YzEgMCAyLTEgMi0yVjExLjRsLTIgMlYyNEg2VjloMTAuNmwyLTJINnoiIGZpbGw9IiNmZmYiLz48L3N2Zz4%3D&labelColor=%23184ead)
](https://hub.docker.com/r/spirit1998hd/palworld-server)

This is an unofficial Docker container to let you host a dedicated [Palworld](https://store.steampowered.com/app/1623730/Palworld/) server.
You have the possibility to change every config option simply via environment variable.

> [!WARNING]
> 
> Players from **Xbox PC/Console** will **not** be able to join a dedicated server. [^1]

## How to use

1. Create a folder on your machine where later the server should be saved in (e.g. `/home/example/palworld-server`)
2. The folder has to have the following permissons: User ID 1000 und Group ID 1000 (use `chown -R 1000:1000 /home/example/palworld-server`)
3. Create a docker compose file
   
    ```yaml
    version: '3'

    services:
      server:
        image: spirit1998hd/palworld-server:latest
        ports:
          - 8211:8211/udp
        environment:
          ServerName: '"YourServerName"'
          ServerDescription: '"YourServerDescription"'
          ServerPassword: '"YourPassword"'
          AdminPassword: '"YourAdminPassword"'
        restart: unless-stopped
        volumes:
          - type: bind
            source: /home/example/palworld-server
            target: /home/steam/palworld
    ```

4. Replace all placeholder values (don't forget to change the `source volume` to the folder you created in step 1)
5. Start the compose script. All game file will now be saved in the folder you created in step 1

> [!IMPORTANT]
> 
> `'` -> let the container know it's a string
> 
> `"` -> to save the string in the config (without it the variabnle in the config would get reconized as a string)

> [!Tip]
> 
> `PalWorldSettings.ini` can be edited but will be overwritten on every restart

## Enviroment variables

You can simply add these in the docker compose file.

| Variable                           | Description                                      | Default                   |
| ---------------------------------- | ------------------------------------------------ | ------------------------- |
| Difficulty                         | Difficulty of the game                           | None                      |
| DayTimeSpeedRate                   | Day time speed                                   | 1.0                       |
| NightTimeSpeedRate                 | Night time speed                                 | 1.0                       |
| ExpRate                            | EXP rate                                         | 1.0                       |
| PalCaptureRate                     | Pal capture rate                                 | 1.0                       |
| PalSpawnNumRate                    | Pal appearance rate                              | 1.0                       |
| PalDamageRateAttack                | Damage from pals multipiler                      | 1.0                       |
| PalDamageRateDefense               | Damage to pals multipiler                        | 1.0                       |
| PlayerDamageRateAttack             | Damage from player multipiler                    | 1.0                       |
| PlayerDamageRateDefense            | Damage to  player multipiler                     | 1.0                       |
| PlayerStomachDecreaceRate          | Player hunger depletion rate                     | 1.0                       |
| PlayerStaminaDecreaceRate          | Player stamina reduction rate                    | 1.0                       |
| PlayerAutoHPRegeneRate             | Player auto HP regeneration rate                 | 1.0                       |
| PlayerAutoHpRegeneRateInSleep      | Player sleep HP regeneration rate                | 1.0                       |
| PalStomachDecreaceRate             | Pal hunger depletion rate                        | 1.0                       |
| PalStaminaDecreaceRate             | Pal stamina reduction rate                       | 1.0                       |
| PalAutoHPRegeneRate                | Pal auto HP regeneration rate                    | 1.0                       |
| PalAutoHpRegeneRateInSleep         | Pal sleep health regeneration rate (in Palbox)   | 1.0                       |
| BuildObjectDamageRate              | Damage to structure multipiler                   | 1.0                       |
| BuildObjectDeteriorationDamageRate | Structure determination rate                     | 1.0                       |
| CollectionDropRate                 | Gatherable items multipiler                      | 1.0                       |
| CollectionObjectHpRate             | Gatherable objects HP multipiler                 | 1.0                       |
| CollectionObjectRespawnSpeedRate   | Gatherable objects respawn interval              | 1.0                       |
| EnemyDropItemRate                  | Dropped Items Multipiler                         | 1.0                       |
| DeathPenalty                       | Death penalty                                    | All                       |
| GuildPlayerMaxNum                  | Max player of Guild                              | 20                        |
| PalEggDefaultHatchingTime          | Time(h) to incubate massive egg                  | 72.0                      |
| ServerPlayerMaxNum                 | Maximum number of people who can join the server | 32                        |
| ServerName                         | Server name                                      | "Default Palworld Server" |
| ServerDescription                  | Server description                               | ""                        |
| AdminPassword                      | Admin Password                                   | ""                        |
| ServerPassword                     | Set the server password.                         | ""                        |
| PublicPort                         | Public port number                               | 8211                      |
| PublicIP                           | Public IP                                        | ""                        |
| RCONEnabled                        | Enable RCON                                      | False                     |
| RCONPort                           | Port number for RCON                             | 25575                     |

## Ports

| Port  | Description                                                 |
| ----- | ----------------------------------------------------------- |
| 8211  | Default Game Port (also used for direct connection)         |
| 25575 | Default RCON Port (disabled by default) |

## FAQ

<dl>
  <dt>How to start a second server on the same machine?</dt>
  <dd>Just change the ports of your container for the server in the compose file. By default it would be 8211 but you can change it to something like 8212. Don't forget to also port forward the new port.</dd>
</dl>

[^1]: Xbox players can only join by invite code (max 4 players). That also counts for players who bought the game in the Microsoft Store.
