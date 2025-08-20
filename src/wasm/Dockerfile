ARG DOTNET_VERSION=9.0

FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS sdk

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git nodejs npm python3 python3-pip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN dotnet workload install wasm-tools && dotnet nuget locals all --clear