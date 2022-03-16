import UIKit

// Logical Not Operator - MAntıksal Olmayan Operatör = &, ||

var allowedEntry = false

if !allowedEntry {
    print("ACCESS DENIED")
}

if allowedEntry != true {
    print("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
let iAmTomCruiseFromMıssionImpossible = false

if (enteredDoorCode && passedRetinaScan) || iAmTomCruiseFromMıssionImpossible {
    print("Welcome ")
} else {
    print("ACCESS DENIED AGAIN")
}

let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    
    print("Welcome!!! ")
    
}else {
    print("YOU STILL AIN'T GETTING FOOL!! ")
}

