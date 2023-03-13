import ballerina/log;
import ballerina/http;

service /employees on new http:Listener(9090) {

    isolated resource function post .(@http:Payload Employee emp) returns int|error? {
        log:printInfo("Adding Employee: ", id = emp.employee_id);
        return addEmployee(emp);
    }
    
    isolated resource function get [int id]() returns Employee|error? {
        log:printInfo("Getting Employee: ", id = id);
        return getEmployee(id);
    }
    
    isolated resource function get .() returns Employee[]|error? {
        log:printInfo("Getting all Employees");
        return getAllEmployees();
    }
    
    isolated resource function put .(@http:Payload Employee emp) returns int|error? {
        log:printInfo("Updating Employee: ", id = emp.employee_id);
        return updateEmployee(emp);
    }
    
    isolated resource function delete [int id]() returns int|error? {
        log:printInfo("Deleting Employee: ", id = id);
        return removeEmployee(id);       
    }

}