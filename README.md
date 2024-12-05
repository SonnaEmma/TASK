TASK (Technical Reporting And Support Kit) is a web-based application designed to simplify and optimize the reporting and resolution of technical issues within organizations.
It provides a platform for employees to report issues, IT staff to document resolutions, and management to track progress effectively.

## Features
- Report technical issues with detailed descriptions.
- Assign and update the status of technical issues (e.g., Reported, In Progress, Resolved).
- Document resolutions for closed issues(when status is set to 'Resolved').
- Role-based access for employees, technicians, and administrators.
- Dashboard to monitor and manage issue reports.
- Additional feature for borrowing  firm devices

- ## Prerequisites
- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 
- PostgreSQL database
- Eclipse IDE or any other Java-supported IDE

## Database setup
- in the file named "PostgreSQLAcces.java", you will find a method called "public void setDBParms()" where you will be able to set your Database connection(Drivername, URL, User, password, and Schema)
- The file "AppInstallTables.java" contains all the methods for setting the different tables and necessary insertions.


## To test the application, use the following credentials after setting the database:
### Admin User
- Username: `test.admin`
- Password: `geheim123`

### IT Technician
- Username: `test.tech`
- Password: `password123`

### Employee
- Username: `test.mit`
- Password: `security`
