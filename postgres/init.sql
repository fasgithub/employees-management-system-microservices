CREATE USER employee_user WITH PASSWORD 'employee_pwd';
CREATE DATABASE pg_employee_db OWNER employee_user;
GRANT ALL PRIVILEGES ON DATABASE pg_employee_db TO employee_user;