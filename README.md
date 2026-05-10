# VietCare365 - Hệ thống quản lý bệnh viện

Hospital Management System built with Spring Boot 3.x + JSP + MySQL

## Tech Stack

- **Backend**: Java 17 + Spring Boot 3.x
- **Frontend**: JSP + JSTL + Bootstrap 5
- **Database**: MySQL 8+
- **Security**: Spring Security 6
- **ORM**: Spring Data JPA + Hibernate
- **Migration**: Flyway
- **Mapping**: MapStruct
- **Build Tool**: Maven

## Prerequisites

- Java 17+
- MySQL 8+
- Maven 3.8+

## Installation & Setup

### 1. Create Database
```sql
CREATE DATABASE VietCare365 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 2. Update Database Configuration
Edit `src/main/resources/application.yml`:
```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/VietCare365?useSSL=false&serverTimezone=Asia/Ho_Chi_Minh&allowPublicKeyRetrieval=true&characterEncoding=UTF-8
    username: root
    password: root
```

### 3. Build Project
```bash
mvn clean install
```

### 4. Run Application
```bash
mvn spring-boot:run
```

### 5. Access Application
- URL: http://localhost:8080
- Default Login: 
  - Username: `admin` | Password: `password`
  - Username: `doctor` | Password: `password`
  - Username: `nurse` | Password: `password`
  - Username: `receptionist` | Password: `password`

## Project Structure

```
VietCare365/
├── src/main/java/com/medicore/
│   ├── MedicoreApplication.java
│   ├── config/
│   │   ├── SecurityConfig.java
│   │   ├── WebMvcConfig.java
│   │   └── AppConfig.java
│   ├── common/
│   │   ├── base/
│   │   │   ├── BaseEntity.java
│   │   │   └── BaseResponse.java
│   │   ├── exception/
│   │   │   ├── GlobalExceptionHandler.java
│   │   │   ├── AppException.java
│   │   │   └── ErrorCode.java
│   │   └── util/
│   │       └── DateUtil.java
│   └── module/
│       ├── auth/
│       ├── patient/
│       ├── doctor/
│       ├── appointment/
│       ├── prescription/
│       ├── medicine/
│       ├── invoice/
│       └── user/
├── src/main/resources/
│   ├── application.yml
│   ├── application-dev.yml
│   └── db/migration/
│       ├── V1__init_schema.sql
│       └── V2__insert_test_data.sql
├── src/main/webapp/WEB-INF/views/
│   ├── layout/
│   │   ├── header.jsp
│   │   ├── sidebar.jsp
│   │   └── footer.jsp
│   ├── auth/
│   │   └── login.jsp
│   ├── dashboard/
│   │   └── index.jsp
│   ├── patient/
│   │   ├── list.jsp
│   │   ├── detail.jsp
│   │   └── form.jsp
│   ├── doctor/
│   ├── appointment/
│   ├── prescription/
│   ├── medicine/
│   ├── invoice/
│   └── error.jsp
└── pom.xml
```

## Features

- **Authentication & Authorization**: Form login with Spring Security
- **User Management**: Admin, Doctor, Nurse, Receptionist roles
- **Patient Management**: CRUD operations with search & pagination
- **Doctor Management**: Manage doctor information
- **Appointment Management**: Schedule and manage appointments
- **Prescription Management**: Create and manage prescriptions
- **Medicine Inventory**: Manage medicines and stock
- **Invoice Management**: Generate and manage invoices
- **Audit Trail**: Track all user activities
- **Responsive UI**: Bootstrap 5 based responsive design
- **Exception Handling**: Global exception handler with proper error messages

## API Features

- Pagination support
- Search functionality
- Soft delete
- Audit fields (created_by, updated_by, created_at, updated_at)
- Input validation using @Valid
- Role-based access control with @PreAuthorize

## Security Features

- BCrypt password encryption
- CSRF protection
- Form login
- Logout functionality
- Remember me option
- Access denied handling
- Session management

## Database Migration

Flyway automatically handles schema creation on application startup:
- V1__init_schema.sql: Creates all database tables
- V2__insert_test_data.sql: Inserts default test data

## Development

### Add New Module

1. Create package structure under `module/`
2. Create Entity extending BaseEntity
3. Create Repository extending JpaRepository
4. Create DTO classes (Request/Response)
5. Create Mapper using MapStruct
6. Create Service interface and implementation
7. Create Controller
8. Create JSP views
9. Add routes to sidebar

### Code Conventions

- All entity IDs are VARCHAR(36) UUID
- All entities extend BaseEntity
- Soft delete: set deleted = true
- Use @Valid for input validation
- Use @PreAuthorize for authorization
- Use MapStruct for entity-dto mapping
- Use JSTL + EL in JSP (no scriptlets)
- Vietnamese labels and messages in UI

## Testing

Use curl or Postman to test API endpoints:
```bash
curl -X GET http://localhost:8080/patients
```

## License

Copyright 2026 - All rights reserved

## Author

Senior Java Developer
