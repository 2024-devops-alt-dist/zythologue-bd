## Step 1: Install Docker and Docker Compose

Before you begin, ensure that Docker and Docker Compose are installed on your system. You can download Docker Desktop from the official Docker website and follow the installation instructions.

[Install Docker Desktop on Mac](https://docs.docker.com/desktop/setup/install/mac-install/)
[Install Docker Desktop on Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
[Run Docker Desktop for Windows in a VM or VDI environment](https://docs.docker.com/desktop/setup/vm-vdi/)

## Step 2: Create a New Directory for Your Project

#### Mac:

Open the Terminal application.
Navigate to the location where you want to create your project folder using the cd command.
Create a new directory with:

```bash
mkdir my_postgres_project
cd my_postgres_project
```

#### Windows:

Open Command Prompt or PowerShell.
Navigate to your desired location using the cd command.
Create a new directory with:

```bash
mkdir my_postgres_project
cd my_postgres_project
```

## Step 3: Create a docker-compose.yml File

Inside your project directory, create a file named docker-compose.yml. You can do this using a text editor or directly in the terminal:

```bash
touch docker-compose.yml  # Mac/Linux
New-Item docker-compose.yml  # Windows PowerShell
```

Open the docker-compose.yml file in your preferred text editor and add the following configuration:

```plaintext
version: '3.8'
services:
  postgres:
    image: postgres:latest
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydatabase
    ports:
      - "5432:5432"
    volumes:
      - pg-data:/var/lib/postgresql/data

volumes:
  pg-data:
```

## Step 4: Initialize the PostgreSQL Service

In your terminal or command prompt, run the following command to start the PostgreSQL service using Docker Compose:

```bash
docker-compose up -d
```

This command will download the PostgreSQL image (if not already downloaded) and start the container in detached mode.

Check that container is running:

```bash
docker ps
```

Stop container:

```bash
docker-compose stop
```

## Step 5: Connect to PostgreSQL Using DBeaver

1. Install DBeaver if you haven't done so already:
   [DBeaver Community Download](https://dbeaver.io/download/)
2. Open DBeaver and create a new connection:

- Click on Database > New Database Connection.
- Select PostgreSQL from the list of database types.
- Enter the connection details:
  - Host: localhost
  - Port: 5432
  - Database: postgres
  - Username: admin
  - Password: password
- Click on Finish to establish the connection.
