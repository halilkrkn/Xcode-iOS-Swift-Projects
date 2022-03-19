import UIKit
import Foundation

// Fonksiyonların Kullanımı

// Foksiyonların Tanımlanması ve Çağırılması
// Değer Döndürmeyen bir Fonksiyon Yapısı
/*
func name() {
 
    some code
}
*/
func addTwoNumbers(){
    
    let a = 1
    let b = 2
    let c = a + b
    
    print(c)
}

addTwoNumbers()

func subsractTwoNumbers(){
    
    let a = 1
    let d = 3
    let e = a + d
    
    print(e)
}

subsractTwoNumbers()

// Foksiyonların Değer Döndürmesi - Function Syntax: Return Values
/*
func name() -> DataType {
    some code
    return someValues
}
 */

func sumTwoNumbers() -> Int {
    
    let a = 3
    let b = 2
    let c = a + b
//    print(c)
    return c
    
}

let sum = sumTwoNumbers()
print(sum)


// Fomksiyonların Parametre Alması - Function Syntax: 1 Parameter
/*
 func name (parameterName: DataType){
 
    some code
 }
 */

func addTwoNumbers1(para: Int){
    let a = para
    print(a)
}
addTwoNumbers1(para: 2)


// Fomksiyonların Çoklu Parametre Alması ve Değer Döndürmesi - Function Syntax: Multiple Parameter and Return Values
/*
 func name (param1: DataType, param2: DataType ) -> DataType{
 
    some code
    return someCode
 }
 */

func addTwoNumbers2(param1: Int, param2: Int) -> Int {
    let c = param1 + param2

    return c
    
}
let sum2 = addTwoNumbers2(param1: 3, param2: 9)
print(sum2)

// Farklı bir parametre kullanım Şekli
func addTwoNumbers3(_ param1: Int, _ param2: Int) -> Int {
    let c = param1 + param2

    return c
    
}
let sum3 = addTwoNumbers3( 3, 12)
print(sum3)


// Functions with Return Values
// Bir fonksyionun parametresinin array olması ve geri dönüş değerlerinin birden fazla verilmesi
func ls(array: [Int]) -> (large: Int, small: Int) {
   var lar = array[0]
   var sma = array[0]

   for i in array[1..<array.count] {
      if i < sma {
         sma = i
      } else if i > lar {
         lar = i
      }
   }
   return (lar, sma)
}

let num = ls(array: [40,12,-5,78,98])
print("Largest number is: \(num.large) and smallest number is: \(num.small)")



//Functions with Optional Return Types
// Burda optional aslında kotlindeki null safety kullanımının aynısıdır. Fonksiyonlar üzerinden bir örnek
func minMax(array: [Int]) -> (min: Int, max: Int)? {
   if array.isEmpty { return nil }
   var currentMin = array[0]
   var currentMax = array[0]
   
   for value in array[1..<array.count] {
      if value < currentMin {
         currentMin = value
      } else if value > currentMax {
         currentMax = value
      }
   }
   return (currentMin, currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
   print("min is \(bounds.min) and max is \(bounds.max)")
}

