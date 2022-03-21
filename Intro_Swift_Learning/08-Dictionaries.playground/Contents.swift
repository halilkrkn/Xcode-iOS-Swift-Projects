import UIKit

// Dictionary Kullanımı ve Yöntemleri

// Dictionary tanımımlanması
var namesOfIntegers = [Int:String]()

namesOfIntegers[3] = "Three"
namesOfIntegers[44] = "fourty four"
namesOfIntegers

namesOfIntegers = [:] // dictionary nin içini boşalttık


// Farklı bir Dictionary tanımımlanmaları
var namesOfIntegers1: [Int:String] = [1:"one"]
namesOfIntegers1[1]

var airports1 = ["YYZ":"Toronto Person", "LAX":"Los Angeles International"]
print(airports1["LAX"])

var airports: [String:String] = ["YYZ":"Toronto Person", "LAX":"Los Angeles International"]
print("The airports dictionary has: \(airports.count) items")

if airports.isEmpty {
    print("The airports dictionary is empty")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heatbrow"
airports["DEV"] = "Devslopes International"

airports["DEV"] = nil // nill aslında null anlamındadır.

/* For içerisinde Dictionary Kullanımı
 
 for(key, value) in airports{
    // buraya gerekli işlemler yazılır.
}
 
 */
print("\n")

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for key in airports.keys {
    print("Key: \(key)")
}

for values in airports.values {
    print("Values: \(values)")
}




