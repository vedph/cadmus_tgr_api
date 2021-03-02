# Stage 1: base
FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Stage 2: build
FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
# FROM mcr.microsoft.com/dotnet/sdk:5.0.102-ca-patch-buster-slim AS build
WORKDIR /src
COPY ["CadmusTgrApi/CadmusTgrApi.csproj", "CadmusTgrApi/"]
# copy local packages to avoid using a NuGet custom feed, then restore
# COPY ./local-packages /src/local-packages
RUN dotnet restore "CadmusTgrApi/CadmusTgrApi.csproj" -s https://api.nuget.org/v3/index.json --verbosity n
# copy the content of the API project
COPY . .
# build it
RUN dotnet build "CadmusTgrApi/CadmusTgrApi.csproj" -c Release -o /app/build

# Stage 3: publish
FROM build AS publish
RUN dotnet publish "CadmusTgrApi/CadmusTgrApi.csproj" -c Release -o /app/publish

# Stage 4: final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CadmusTgrApi.dll"]