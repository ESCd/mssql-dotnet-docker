# .NET in Docker (Enhanced)

## MSSQL

The following images are based on [`mcr.microsoft.com/artifact/mar/mssql/server`](https://mcr.microsoft.com/artifact/mar/mssql/server), merged with binaries from [`mcr.microsoft.com/artifact/mar/dotnet/sdk`](https://mcr.microsoft.com/artifact/mar/dotnet/sdk), with the `dotnet-ef` tool pre-installed.

Useful for multi-team or feature based development, running integration tests, generating migrations, *and more*...

| Image Variant                           | .NET Version | SQL Version   |
| --------------------------------------- | ------------ | ------------- |
| `escd/dotnet-mssql-sdk:9.0-2025-latest` | `net9.0`     | `2025-latest` |
| `escd/dotnet-mssql-sdk:9.0-2022-latest` | `net9.0`     | `2022-latest` |

> *Images are based on Ubuntu 22.04 (jammy), with the following pre-installed software:*
> - `curl`
> - `dotnet`
> - `dotnet-ef` (.NET Tool)
> - `git`
> - `pwsh` (PowerShell)
> - `sqlcmd` (`/opt/mssql-tools18/bin/sqlcmd`)
> - `wget`

> *Images include a helper script, [`/sql_server.sh`](https://github.com/ESCd/mssql-dotnet-docker/tree/main/etc/sql_server.sh) with the following functions:*
> - `start_sql_server [timeout=120]`: Starts the SQL Server, outputs the Process ID of the server after waiting for it to be available
> - `stop_sql_server`: Shuts down the SQL Server, returns after waiting for process to exit
> - `wait_sql_server_exit`: Wait for the SQL Server process to exit

## WASM

The following images are based on [`mcr.microsoft.com/artifact/mar/dotnet/sdk`](https://mcr.microsoft.com/artifact/mar/dotnet/sdk), with the `wasm-tools` workload pre-installed.

Useful for building Blazor Wasm or .NET Browser projects.

| Image Variant              | .NET Version |
| -------------------------- | ------------ |
| `escd/dotnet-wasm-sdk:9.0` | `net9.0`     |
| `escd/dotnet-wasm-sdk:8.0` | `net8.0`     |

> *Images are based on Debian 12 (bookworm-slim), with the following pre-installed software:*
> - `curl`
> - `dotnet`
> - `git`
> - `nodejs`
> - `pwsh` (PowerShell)
> - `python3`
> - `wasm-tools` (.NET Workload)
> - `wget`