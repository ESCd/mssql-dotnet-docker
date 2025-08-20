ARG DOTNET_VERSION=9.0
ARG SQL_VERSION=2022-latest

FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS sdk

RUN dotnet tool install -g dotnet-ef && dotnet nuget locals all --clear

FROM mcr.microsoft.com/mssql/server:${SQL_VERSION} AS dotnet-mssql-sdk

ENV ACCEPT_EULA=Y
ENV DOTNET_GENERATE_ASPNET_CERTIFICATE=false
ENV DOTNET_NOLOGO=true
ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV MSSQL_PID=Express
ENV NUGET_XMLDOC_MODE=skip

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git libatomic1 wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=sdk ["/root/.dotnet", "/root/.dotnet"]
COPY --from=sdk ["/usr/share/dotnet", "/usr/share/dotnet"]
COPY --from=sdk ["/usr/share/powershell", "/usr/share/powershell"]

RUN ln -sf /usr/share/powershell/pwsh /usr/bin/pwsh && export PATH="/usr/share/powershell:$PATH";
RUN ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet && export PATH="/usr/share/dotnet:$PATH";

RUN dotnet tool install -g dotnet-ef && dotnet nuget locals all --clear

COPY ["./src/mssql/sql_server.sh", "/sql_server.sh"]

RUN chmod +x /sql_server.sh