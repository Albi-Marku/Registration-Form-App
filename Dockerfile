# Use .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build the app
COPY . ./
RUN dotnet publish -c Release -o out

# Use a smaller runtime image to run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy the published output from the build image
COPY --from=build /app/out ./

# Expose the port your app runs on
EXPOSE 8080

# Start the application
ENTRYPOINT ["dotnet", "RegistrationFormApp.dll"]
