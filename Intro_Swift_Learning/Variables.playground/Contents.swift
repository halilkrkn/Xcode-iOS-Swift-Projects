import UIKit


//Person
var name = "Halil" // String
var age = 26 // Integer
var weigth = 82.65 // Double
var isMale = false // Boolean

print(weigth)
weigth = 180.23
print(weigth)

// var keyword'ü changed variables yani atana verilerin tekrardan değitirilmesine olanak tanıyan bir durumdur.


let eyeColor = "Blue"
eyeColor = "Green" // cannot assign to value: 'eyeColor' is a 'let' constant hatası ile karşılaşılır. bu hatayı düzeltmek için change 'let' to 'var' to make it mutable yapmalıyız yani "let" keywordünü "var" ile değiştirmeliyiz.

// let keyword'ü unchanged variables yani bir kere atanan verinin sonradan değiştirilemeyeceği durumlarda kullanılır.

