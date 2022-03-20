import UIKit

// Class Kullanımı ve Objecy Oluşturma


// Class Oluşturma
class Person {

 // define two properties
    var name: String?
    var lastName: String = ""
    var age: Int?
    var city: String = ""
    var cityPopulation: Int = 0
    
    func greet(){
        
        print("Ooooooo Greeeetttttt!!!")
        
    }
    
    // static property - static bir değişken
    static var size: String = ""
    
    // static method - static bir fonksiyon
    static func greetStatic(){
        
        print("Ooooooo Staticcc Greeeetttttt!!!")
        
    }
 
}

var person = Person()

// assign values to properties - class içerisindeki değişkenlere değer atama
person.name = "Kevin"
person.age = 42
person.lastName = "Smith"
person.city = "Los Angeles"
person.cityPopulation = 111111111

// access properties - Class içerisindeki değişkenlere erişim
print("Name:", person.name!)
print("LastName:", person.lastName)
print("Age:", person.age!)
print("City:", person.city)
print("City Population:", person.cityPopulation)

// call method - oluşturduğumuz fonk.(method) çağırılır.
person.greet()

// assign value to static property - class içerisindeki static değişkene değer atadık.
Person.size = "Small"

// assign value to static method - class içerisindeki static fonksiyonu çağırdık.
Person.greetStatic()





// Self Property - Self class içerisindeki değişkenleri class içerisinde çağırmak için kullanılır. Mesela altttaki örnekte class içerisinde aynı değişken isimleri olduğu için karışıklık olmaması adına self kullanılır.
class Marks {

  var physics = 0

  func checkEligibility(physics: Int) {

    // using self property
    if (self.physics < physics) {
      print("Not Eligible for admission")
    }

    else {
      print("Eligible for admission")
    }
  }
}

var student1 = Marks()
student1.physics = 28
student1.checkEligibility(physics: 50)


// *** Initializer ***
// Class a bir nevi constructor işlevi görüyor.
// Bir Class içerisindeki çalıştırmak istediğimiz özellikler içalıştırmamıza yarayan bir method.

// declare a class
class  Wall {
  var length: Double

  // initializer to initialize property
  init() {
    length = 5.5
    print("Creating a wall.")
    print("Length = ", length)
  }
}

// create an object - Class'tan nesne oluşturuldu.
var wall = Wall()


// *** Parameterized Initializer ***
// Class'a parametre verebiliyoruz.
// declare a class
class Wall1 {
  var length: Double
  var height: Double

  // parameterized initializer to initialize properties
  init(length: Double, height: Double) {
    self.length = length
    self.height = height
  }

  func calculateArea() -> Double {
    return length * height
  }
}

// create object and initialize data members
var wall1 = Wall1(length: 10.5, height: 8.6)
var wall2 = Wall1(length: 8.5, height: 6.3)

print("Area of Wall 1: ", wall1.calculateArea())
print("Area of Wall 2: ", wall2.calculateArea())
print(wall1.length, wall1.height)
print(wall2.length, wall2.height)

