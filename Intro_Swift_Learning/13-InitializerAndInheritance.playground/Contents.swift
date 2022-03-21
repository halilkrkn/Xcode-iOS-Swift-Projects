import UIKit


// Initializer - Class'ın Başlatıcısıdır.
// Bir başlangıç değeri ayarlamayı ve kullanıma hazır olmadan önce gerekli işlemlerin yapılmasını sağlar.
// Yani bir Class(Sınıf) içerisinde başlangıç değerlerinin atamak veya çalılştırmak için kullanılır.
// Bir de Class'a parametreler tanımlaması ve sonra da değer atayabilememize olanak sağlar.

class Singer {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int){

// Burada self işlemi aslıda class içerisinde tanımlanan değişkenler ile init içerisinde tanımlanan değişkenlerin karışmaması için kullanılır.
// Yani burda self aslında initin dışında yani class içinde tanımlanan değişkenleri çağırıyor.
        self.name = name
        self.age = age
    }
    
    func sign(){
        print("Laaa laaa ooo alaaacalsa")
    }
}


class CountrySinger: Singer{
    override func sign() {
        print("Trucks, quitars and liquor")
    }
}

class HeavyMetalSinger: Singer {
    
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sign() {
        print("Leyyyy Looooyyyy Rarggggg YEeaaaaaaa")
    }
}


var taylor = Singer(name: "Taylor", age: 26)
taylor.name
taylor.age
taylor.sign()

// Self = Class içerisindeki değişkenlere mthodlara ulaşmamıza olanak sağlıyor.
var countrySinger = CountrySinger.init(name: "halil", age: 23)
countrySinger.sign()


//Bir HeavyMetalSinger classı Singer Class'ından miras aldığı için orada initte oluşturulan parametreleri de .init ile çağırdık.
var heavyMetalSinger = HeavyMetalSinger.init(name: "İbrahim Tatlıses", age: 60, noiseLevel: 100)
heavyMetalSinger.name
heavyMetalSinger.age
heavyMetalSinger.noiseLevel
heavyMetalSinger.sign()


// Class'larda Inheritance Yani Bir Classın başka bir sınıftan miras alması

class Vehicle{
    
    var tires = 4
    var make: String? = nil
    var model: String?
    var currentSpeed: Double = 0
    
    
    init(){
        print("I am the Adult")
        
    }
    
    
    func drive(speedIncrease: Double) {
        
        currentSpeed +=  speedIncrease * 2
    }
    
    func brake(){
        
        
    }
}

class Truck: Vehicle {
    
    override init() {
        super.init()
        
    }
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease
        print(currentSpeed)
    }
}

// Bir classtan inheritance yapılmak istenirse ':' ile ilgili classı tanımlarız
// Burada ise SportsCar class'ı Vehicle class'ını inherite etti yani miras aldı.
class SportsCar: Vehicle {

    override init() {
        super.init()
        print("I am the child")
        make = "BMW"
        model = "3 Series"
    }
    
    override func drive(speedIncrease: Double) {
        currentSpeed += speedIncrease * 3
        print(currentSpeed)
    }
}

let car = SportsCar()
car.drive(speedIncrease: 30.0)

let truck = Truck()
truck.drive(speedIncrease: 10)
