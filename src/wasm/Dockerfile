ARG DOTNET_VERSION=9.0

FROM node:24-bookworm-slim AS node-x
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS sdk

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl git npm python3 python3-pip wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=node-x /usr/local/ /usr/local/
RUN npm install -g npm

RUN dotnet workload install wasm-tools && dotnet nuget locals all --clear