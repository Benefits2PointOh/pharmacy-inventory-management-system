# Pharmacy Inventory Management System

A Java Swing desktop application for managing pharmacy inventory and related operations through a MySQL-backed data model.

## Overview

The project is being developed as a desktop system for pharmacy workflows. The repository includes Java application source, Maven configuration, SQL schema and seed scripts, stored procedures, triggers, a changelog, and database notes.

## Current scope

The codebase is organised around the following areas:

- User login and access-related flows
- Inventory and product data
- Customers, suppliers, and sales workflows
- Reporting-oriented database objects
- MySQL schema, procedures, triggers, and sample data

The exact feature set is still evolving, so this repository is labelled as work in progress.

## Technology

- Java
- Java Swing
- Maven
- MySQL and JDBC
- jBCrypt for password hashing support
- FlatLaf and Ikonli for desktop UI presentation

## Repository structure

```text
database/   SQL schema, procedures, triggers, sample data, and database notes
src/        Java application source
pom.xml     Maven build and dependency configuration
CHANGELOG.md
```

## Setup

1. Install a compatible JDK and Maven.
2. Create a MySQL database using the scripts in `database/`.
3. Review the application’s database configuration and provide credentials through your local development setup. Do not commit passwords or other credentials.
4. Resolve dependencies and compile the project:

```bash
mvn clean package
```

The application entry point is configured in `pom.xml`; runtime database configuration may still require project-specific adjustment while development continues.

## Security note

The repository is intended for development. Credentials must be supplied locally and must not be hardcoded or committed. Any default/demo credential used during local development should be rotated before the application is shared or deployed.

## Status and limitations

**Work in progress.** A production-ready release would still require a documented database configuration strategy, repeatable build verification, automated tests, and a complete user-facing setup guide.

## Author

[Tafara Mawere](https://github.com/Benefits2PointOh)
