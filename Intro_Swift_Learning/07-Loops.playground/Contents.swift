import UIKit

// Loops = Döngüler

//Bad Way
var employeeSalary1 = 45000.0
var employeeSalary2 = 54000.0
var employeeSalary3 = 100000.0
var employeeSalary4 = 20000.0

employeeSalary1 = employeeSalary1 + (employeeSalary1 * 0.10)
employeeSalary2 = employeeSalary2 + (employeeSalary2 * 0.10)
employeeSalary3 = employeeSalary3 + (employeeSalary3 * 0.10)
employeeSalary4 = employeeSalary4 + (employeeSalary4 * 0.10)

// Better Way
var salaries = [45000.0,54000.0,100000.0,20000.0]

salaries[0] = salaries[0] + (salaries[0] * 0.10)
salaries[1] = salaries[1] + (salaries[1] * 0.10)
//...


//While Loops
var index = 0

repeat{
    salaries[index] = salaries[index] + (salaries[index] * 0.10)
    print(salaries[index])
    index += 1
} while (index < salaries.count)


// For Loops

for x in 1...5 {
    print("Index: \(x)")
}

for z in 1..<5 {
    print("Index: \(z)")
}

for index in 0..<salaries.count {
    salaries[index] = salaries[index] + (salaries[index] * 0.10)
    print(salaries[index])
}

//Foreach Loop

for salary in salaries {
    print("Salary: \(salary)")
}

for salary in salaries {
    var salariess: Double = salary + (salary * 0.10)
    print(salariess)
}

