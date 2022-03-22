import UIKit

// Extension(Eklenti) Kullanımı
// Yeni bir Class ve Methodlar Ekleyebiliriz. Bunu Extension kullanarak başarabiliriz.
// Yani Extension bir nevi var olan Class yada Methodlara(Fonksiyonlara) tanımlanan isimleri ile "extension" keyword kullanılarak yeni işlevler(fonksiyonlar-methodlar) ekleyebiliriz.

class Temperature {
    
    var celcius: Double = 0
    
    func setTemperature(celcius: Double){
        self.celcius = celcius
        print("Celcius:", celcius)
    }
}

// Extension of Temperature Class - Temperature Class'ının Extension(Eklentisi,Uzantısı, Genişletilmesi)
// Sınıf içinde tanımlanan özellikler (celsius gibi) uzantı içinde de kullanılabilir.
extension Temperature {
    
    func convert() {
        let fahrenheit = (celcius * 1.8) + 32
        print("Fahrenheit:", fahrenheit)
    }
}


// class initialization
let temperature = Temperature()
//var cel: Double = temperature.celcius
//cel = 16
//temperature.setTemperature(celcius: cel)
temperature.setTemperature(celcius: 16)

// Access Extension Method Using Class Object - Sınıf Nesnesi Kullanılarak Extension(Uzantı) Methoduna Eriştik.
temperature.convert()


// Computed Property In Extension - Extension içerisinde Hesaplanan Özellikler
// Uzantılara stored property ekleyemeyiz. Bu durum error code olarak karşımıza çıkar

class Circle {
    var radius: Double = 0
    
    init(radius: Double){
        self.radius = radius
    }
}



extension Circle {
//    Stored Property
//    var radius: Int // error code

//    Ancak Extension'a hesaplanmış özellikler(computed property) eklenmemize izin verir.
//    Computed Property
    var area: Double {
//        Burada,area extension'ın kod gövdesinde tanımlanan hesaplanmış bir özelliktir .
        return 3.14 * radius * radius
    }
}
 
let circle = Circle(radius: 5)
var area = circle.area
print("Area:", area)


// Protocol Extension

// protocol definition
protocol Brake {
    func applyBrake()
}

// extend protocol - protokolü genişlet
extension Brake {
    func applyBrake(){
        print("Brake Applied...")
    }
}


// define class that conforms Brake - Brake'e uyan sınıfı tanımla
class Car: Brake {
    var speed: Int = 0
}

//extend class
extension Car {
    func bmw(){
        print("fastest car BMW")
    }
}


var mercedes = Car()
mercedes.speed = 120
print("Speed:", mercedes.speed)

// access extended protocol - genişletilmiş(extension) protokole erişim
mercedes.applyBrake()

//access extended class- genişletilmiş(extension) classtan erişim
mercedes.bmw()

