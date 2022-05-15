FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["bndapi.csproj", "./"]
RUN dotnet restore "bndapi.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "bndapi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "bndapi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "bndapi.dll"]
