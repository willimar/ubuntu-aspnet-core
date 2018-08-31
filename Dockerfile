FROM ubuntu:18.04 AS ubuntu-aspnet-core
LABEL key="asp-net-core"
LABEL version="0.0.1"
LABEL description="Rocha, Willimar <willimar@gmail.com> \
                  Create the machine with Aps.Net Core in the Ubuntun image. \
                  The command will create the basic requeriments to use ASP.Net Core application."

RUN apt-get update && \
    apt-get install -y wget gpg yum && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y dotnet-hosting-2.0.8 && \
    apt-get install -y dotnet-sdk-2.1

EXPOSE 5000
