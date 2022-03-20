import UIKit

// Enum Kullanımı ve Yöntemleri

enum WeatherType1 {
    
    // İlk tanımlama
        case sun, cloud, rain, wind, snow
}


//İlk tanımlamaya göre

 func getHaterStatus1(weather: WeatherType1) -> String?{
    if weather == WeatherType1.sun {
        return nil
    } else {
        return "Hate"
    }
}

 getHaterStatus1(weather: WeatherType1.cloud)
 

// İkinci Tanımlamaya Göre - Enum Associated Values and Switch Statement
enum WeatherType2 {
    //İkinci tanımlama
    case sun
    case cloud
    case rain
    case wind(speed:Int)
    case snow
}

func getHaterStatus2(weather: WeatherType2) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus2(weather: WeatherType2.wind(speed: 5))


// Iterate Over enum Cases

enum Season: CaseIterable {
   
    case spring, summer, autumn, winter
    
}

var season = Season.self

print(season.summer,"\n")

for currentSeason in season.allCases {
    print(currentSeason)
}


// Swift enums with rawValue

enum Size: Int {
    
    case small = 10
    case medium = 15
    case large = 20
    case x_large = 25
    
}

var small = Size.small.rawValue
print(small)


// Swift enum Associated Values

enum Laptop {
    
    case name(brand:String)
    
    case price(offer: Int)
    
}

var brand = Laptop.name(brand: "MSI")
var offer = Laptop.price(offer: 20000)

print(brand, " ", offer)

// Associate Multiple Values
enum Marks {

 // associate multiple Double values
case gpa(Double, Double, Double)

// associate multiple String values
case grade(String, String, String)
}

// pass three Double values to gpa
var marks1 = Marks.gpa(3.6, 2.9, 3.8)
print(marks1)

// pass three string values to grade
var marks2 = Marks.grade("A", "B", "C")
print(marks2)


// Enum Associated Values and Switch Statement
enum Mercedes {

 case sedan(height: Double)
 case suv(height: Double)
 case roadster(height: Double)
}

var choice = Mercedes.suv(height: 5.4)

switch(choice) {
 case let .sedan(height):
   print("Height:", height)

 case let .suv(height):
   print("Height:", height)

 case let .roadster(height):
   print("Height:", height)
}
