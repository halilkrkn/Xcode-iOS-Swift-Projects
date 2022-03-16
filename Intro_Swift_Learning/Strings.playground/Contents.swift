import UIKit

var str = "Hello, playground" // Decleration: Type İnference(Tür Çıkarımı)

var message: String = "This is a String" //Explicit type declaration (Açık tür bildirimi) = Yani burda diyorki sen stringsin sadece stringe özgü özelliklere sahipsin

var fullName = "Halil Karkin"
var iMessage = "Hey Brooo!"

let firstName = "Jenna"
let lastName = "Smith"

fullName = firstName + " " + lastName // String Concatenation = String Birleştirme
print(fullName)

var age = 26
var newMessage: String = "Hi, my name is \(fullName) and I am \(age) years old" // String interpolation
print(newMessage)

newMessage.append(". And I like scary clowns.")
print(newMessage)
