import UIKit

// Struct Yapısı ve Yöntemleri
// Struct’ta miras alma özelliği yoktur. (Inheritance yoktur)
// Struct’lar Value Type olarak çalışırlar.
// Farklı veri türlerindeki değişkenleri ve methodları depolamak için struct kullanılır.
// Basit ve hızlıdırlar
// Class'lara çok benzer ama işlevleri farklıdır. Classlar ise Refenrece Type olarak çalışır.
// inheritance (miras) alma gibi bir durum söz konusu değilse Struct'ı tercih etmek en mantıklısıdır.
// Çünkü Struct’ı tercih etmek uygulama performansınız, kaynakları verinli kullanmak adına sizlere faydalı olacaktır.

struct Person {

  var name = ""
  var age = 0
}

// Birden Çok Struct Örneği Oluşturma
var person = Person()
person.age = 12
person.name = "halilkrkn"
print("Name: \(person.name) and Age: \( person.age) ")

var person1 = Person()
person.age = 16
person.name = "ibooooo"
print("Name: \(person.name) and Age: \( person.age) ")


// Birden Çok Struct Örneği Oluşturma

// Memberwise Initializer
struct Person2 {
 
// varsayılan değerleri olmayan özellikler
    var name: String
    var age: Int
}

// varsayılan bir değeri olmayan struct'a bir tane instance oluşturup ilgili struct'ı çağırıp parametre olara değerleri atabiliyoruz.
var person2 = Person2(name: "Kyleee", age: 23)
print("Name: \(person2.name) and Age: \( person2.age)")


// Function Inside Swift Struct
struct Car {
    
    var gear = 0
    
    func applyBrake(){
        print("Applying Hydraulic Brakes")
    }
}

var car = Car()

car.gear = 5

print("Gear Number: \(car.gear)")

car.applyBrake()
