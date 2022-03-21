import UIKit
import Foundation

// Protocols Kullanımı Yönetemleri
// Protocol aslında Interface gibi düşüneibliriz.
// Neydi Interface, içerisine değişkenler tanımlanır veya methodların (fonksiyonların) gövdeleri olmadan yazılan bir yapı.
// Class'lar sadece bir sınıfı inherite yani miras alırken, protocol'leride birden fazla miras alabilir. Yani bu interfacelerde de geçerli.
// Protocoller Interfacelere benzediği için nesnesi(object) olıuşturulamaz.
// Bu yüzden class'lar protocolleri inherite yani miras alır.

protocol Greet {

    // Değişken tanımlaması yapıldı.
    // Değişken tanımlaması yapıldığında { get } veya { get set }  özelliği zorunluğu bir özelliktir
    var name: String { get }
    
    //  Sadece Fonksiyon Tanımlamması yapılır. Protocol'de Fonksiyonun Gövdesi olmaz..
    func message()
    
}


// Bir Sınıf protocol'ü inherite eder ve o protocol içerisinde tanımlanmış değişkenler ve methodlar(fonksiyonlar) hepsi kullanılması gerekmektedir.
class Employee: Greet {
    
    var name = "Perry"
    
    func message() {
        print("Good Morning!!", name)
    }
    
}

var employee = Employee()

employee.name
employee.message()

// ALAN HESAPLAMAK İÇİN SWIFT PROTOKOLÜ

protocol Polygon {
    
    func getArea(length: Int, breadth: Int)
}


class Rectangle: Polygon {
    
    func getArea(length: Int, breadth: Int) {
        print("Area of the rectangle:", length * breadth)
    }
}

var rectangleArea = Rectangle()
rectangleArea.getArea(length: 5, breadth: 6)


// ÇOKLU PROTOKOLLER

protocol Sum {
    
    func sum()
}

protocol Multiplication {
    
    func multiplication()
}


class Calculate: Sum, Multiplication {
    
    var num1: Int = 0
    var num2: Int = 0
    
    func sum() {
        let resultAddition = num1 + num2
        print("Sum:",resultAddition)
    }
    
    func multiplication() {
        let resultMultiplation = num1 * num2
        print("Multiplation:",resultMultiplation)
    }
}


var calculate = Calculate.init()
calculate.num1 = 5
calculate.num2 = 10

calculate.sum()
calculate.multiplication()


// Bir Protokol bir protocol den birden fazla miras alabilir.
protocol Car {
    
    var colorOptions: Int {get}
}

protocol Brand: Car {

    var name: String {get}
}

class Mercedes: Brand {

    var name: String = ""
    var colorOptions: Int = 0
}

var mercedes = Mercedes()
mercedes.name = "Mercedes AMG"
mercedes.colorOptions = 4

print("Name:", mercedes.name)
print("Color Options:", mercedes.colorOptions)


//Protocol Extensions - Protokol Uzantıları

// Extension anahtar kelimesi kullanılarak protokoller genişletilebilir.

protocol Brake {
    func applyBrake()
}

class Truck: Brake {
    
    var speed: Int = 0
    
    func applyBrake() {
        print("Brake Applied")
    }
}

// extend protocol - genişletilmiş protokol
extension Brake {
    
    func stop(){
        print("Engine Stopped")
    }
}

let truck = Truck()
truck.speed = 75
print("Truck Speed:", truck.speed)
truck.applyBrake()



// access extended protocol - genişletilmiş protokole erişim
truck.stop()





