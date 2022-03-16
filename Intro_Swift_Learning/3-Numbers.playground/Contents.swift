import UIKit

var age = 26 // Integer
var price = 10.99 // Double

var aPrice: Float = 10.99

var personAge: Int = 15
var thePrice: Double = 12.99

var lenght = 10
var width = 5

let area = lenght * width // Multiplication - Çarpma
print(area)

var health = 100
var poisonDamage = 23
health = health - poisonDamage // Subtraction - Çıkarma
print(health)

health -= poisonDamage // compound asssiment operator - Birleşik Halde Çıkarma İşlemi
print(health)

var potion = 30
health = health + potion // Addition Compound Assigment -Birleşik Halde Toplama İşlemi Operator
health += potion // Addition - Toplama
print(health)

var students = 30
var treats = 500

let treatsPerStudents = treats / students // Division - Bölme

let remainder = treats % students // Mod işlemi
print(remainder)


// tlength^2 + tWidth^2 = areaTriangle^2
var tlength:Double = 10
var tWidth: Double = 5
let areaTriangle = sqrt(pow(tlength,2) + pow(tWidth, 2))
print(areaTriangle)
// pow = bir sayının üssünü alır mesela 10^2 = 100 gibi
// sqrt = karekökünü alır.

var quantity:Int = 5
var productPrice: Double = 10.99

var cost = Double(quantity) * productPrice
