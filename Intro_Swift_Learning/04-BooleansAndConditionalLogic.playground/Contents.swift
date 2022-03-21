import UIKit

// Booleans and Conditional Logic
var amITheBestProgrammer: Bool = true

amITheBestProgrammer = false

if true == false || true == true{
    print("WTFish")
}

var hasDataFinishedDownloading: Bool = false

if !hasDataFinishedDownloading {
    print("Loading Data...")
}

hasDataFinishedDownloading = true

// Equal to: ==
// Not Equal to: !=
// Greater than: >
// Greater than or equal to: >=
// Less than: <
// Less than or equal to: <=

var bankBalance = 400
var itemToBuy = 700

if bankBalance >= itemToBuy {
    print("purchased item") // Koşul sağlanmadı. O yüzden print yazdırılmadı.
}

if itemToBuy > bankBalance {
    print("You need mo' money foo")
}

itemToBuy = 400
if itemToBuy == bankBalance
{
    print("Hey Buddy, your balance is now 0")
}

var bookTitle1 = "Harry Potter and the Moppet of Mire"
var bookTitle2 = "Harry Potter nd the Moppet of Mire"

if bookTitle1 != bookTitle2 {
    print("Need to fix spelling before printing ")
}else if bookTitle2.count > 10{
    print("find a new title ")
}else {
    print("Book looks great send to printer")
}
