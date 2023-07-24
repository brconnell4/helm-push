FROM mcr.microsoft.com/dotnet/sdk:7.0

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
    git \
    jq

RUN dotnet tool install --global GitVersion.Tool
RUN chmod +x /entrypoint.sh

ENV PATH="${PATH}:/root/.dotnet/tools"

ENTRYPOINT ["/entrypoint.sh"]
