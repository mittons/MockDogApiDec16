FROM mcr.microsoft.com/dotnet/aspnet:7.0 as base
WORKDIR /app
EXPOSE 8016

FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /src

COPY ./MockDogApiDec16.csproj ./
RUN dotnet restore "./MockDogApiDec16.csproj"

COPY . .
RUN dotnet build "./MockDogApiDec16.csproj" -c Release -o /app/build


FROM build AS publish
RUN dotnet publish "./MockDogApiDec16.csproj" -c Release -o /app/publish


FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT [ "dotnet", "MockDogApiDec16.dll" ]