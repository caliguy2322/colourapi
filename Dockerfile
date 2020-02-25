# Get Base Image (Full .NET Core SDK)
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /usr/src
# Copy csproj and restore
COPY *.csproj ./
RUN dotnet restore
# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
# Generate runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
ENV ASPNETCORE_ENVIRONMENT development
ENV DB_HOST sql_server
ENV DB_PORT 1433
ENV DB_USERNAME sa
ENV DB_PASSWORD Pa55w0rd2019
ENV DATABASE Colours
WORKDIR /usr/src
COPY --from=build-env /usr/src/out .
COPY ./start.sh ./
RUN chmod +x /usr/src/start.sh
EXPOSE 80
CMD ["/bin/sh", "start.sh"]