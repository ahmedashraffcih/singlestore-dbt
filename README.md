# Singlestore-dbt

This project integrates [dbt (Data Build Tool)](https://www.getdbt.com/) with [SingleStore](https://www.singlestore.com/), enabling data transformations, modeling, and analytics at scale using the power of SingleStore's distributed SQL database.

## Project Overview

This repository contains dbt models, sources, and configurations tailored to work seamlessly with SingleStore (formerly known as MemSQL). The goal is to create an optimized data pipeline for analytics and business intelligence, leveraging dbt's powerful transformation capabilities alongside SingleStore’s high-performance database.

## Requirements

- [Docker](https://www.docker.com/)
- [dbt](https://www.getdbt.com/docs/installation/) (version 1.7.19 or later)
- [SingleStore](https://www.singlestore.com/) (either local or cloud instance)
- [Git](https://git-scm.com/)

## Getting Started

To get started with the project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/singlestore-dbt.git
   cd singlestore-dbt
   ```

2. **Install Dependencies: If you're using Docker, simply run the Docker container**:
   ```bash
   docker-compose up -d
   ```

3. **Set Up Configuration**:
    - Modify the profiles.yml to match your SingleStore instance details.
    - Ensure the dbt_project.yml is configured with the correct dbt project settings.

Example of profiles.yml:
```bash
singlestore_profile:
target: dev
outputs:
    dev:
    type: singlestore
    host: singlestore-ciab  # Name of the service in Docker Compose
    port: 3306              # SingleStore default port
    user: root
    password: "your_password"
    database: memsql
    schema: memsql
```

4. **Run dbt: To run your dbt project and execute models, use the following command**:
    ```bash
    dbt run
    ```

3. **Check Models and Sources**:
    - View dbt models in the /models directory.
    - Define and reference sources in the sources.yml file.

## Project Structure
- `/models`: Contains all your dbt models and transformations.
- `/macros`: Custom dbt macros (functions) for reusable logic.
- `/tests`: dbt tests for data validation.
- `/data`: Any raw data you want to use in dbt models.
- `dbt_project.yml`: Configuration file for dbt project settings.
- `profiles.yml`: Configuration file for your dbt connection profiles.

### Running Tests
To run tests for your dbt models:
```bash
dbt test
```

### Docker Setup
If you prefer running dbt inside a Docker container, you can use the provided Dockerfile and docker-compose.yml setup. This will allow you to avoid installing dbt locally while using a containerized environment.

#### Starting the Containers
```bash
docker-compose up -d
```

This will start both the dbt container and the SingleStore instance, allowing you to run dbt commands inside the container.

#### Stopping the Containers
```bash
docker-compose down
```

### Notes
- Schema Management: Ensure that your schema is set correctly in `profiles.yml` and that dbt is properly set up to reference it.
- Model Types: You can configure your models as tables or views depending on your data requirements in the `dbt_project.yml`.
- Logs and Debugging: Use `dbt debug` to troubleshoot connection or configuration issues.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.