# SQL Server & .NET in Docker

The following image variants are a merge of [`mcr.microsoft.com/artifact/mar/mssql/server`](https://mcr.microsoft.com/artifact/mar/mssql/server) with [`mcr.microsoft.com/artifact/mar/dotnet/sdk`](https://mcr.microsoft.com/artifact/mar/dotnet/sdk), useful for multi-team or feature based development, running integration tests, generating migrations, *and more*...

| Image Variant                           | .NET Version | SQL Version   |
| --------------------------------------- | ------------ | ------------- |
| `escd/mssql-dotnet-sdk:9.0-2025-latest` | `net9.0`     | `2025-latest` |
| `escd/mssql-dotnet-sdk:9.0-2022-latest` | `net9.0`     | `2022-latest` |

> *Images are based on Ubuntu 22.04 (jammy), with the following pre-installed software:*
> - `curl`
> - `dotnet`
> - `git`
> - `pwsh` (PowerShell)
> - `sqlcmd` (`/opt/mssql-tools18/bin/sqlcmd`)
> - `wget`

> *Images include a helper script, [`/sql_server.sh`](https://github.com/ESCd/mssql-dotnet-docker/tree/main/etc/sql_server.sh) with the following functions:*
> - `start_sql_server [timeout=120]`: Starts the SQL Server, outputs the Process ID of the server after waiting for it to be available
> - `stop_sql_server`: Shuts down the SQL Server, returns after waiting for process to exit