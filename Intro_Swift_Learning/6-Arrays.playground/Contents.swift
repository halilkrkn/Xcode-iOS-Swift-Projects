import UIKit

//Array Kullanımı ve Yöntemleri

var employeeSalary1 = 45000.0
var employeeSalary2 = 54000.0
var employeeSalary3 = 100000.0
var employeeSalary4 = 20000.0


//var employeeSlaries: [Double] = [45000.0,54000.0,100000.0,20000.0]
//var employeeSlaries: Array<Double> = [45000.0,54000.0,100000.0,20000.0]
//var employeeSalaries = [employeeSalary1,employeeSalary2,employeeSalary3,employeeSalary4]
var employeeSalaries = [45000.0,54000.0,100000.0,20000.0]



print(employeeSalaries.count)

employeeSalaries.append(39000.63)

print(employeeSalaries.count)

employeeSalaries.remove(at: 1)

print(employeeSalaries)
print(employeeSalaries.count)


var students = [String]()

print(students.count)
students.append("halilkrkn")
students.append("Jacob")
students.append("Jose")
students.append("Jingle")
students.append("Heimer")
students.append("Smith")
students.append("Jon")

students.remove(at: 2)
print(students)
