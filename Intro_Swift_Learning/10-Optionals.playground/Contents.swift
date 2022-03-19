import UIKit

// Optionals - Kotlindeki Null Safety ile aynı
// Optionals let developers specify which data could be nil and which data is guaranteed to not nil
// Optionals, geliştiricilerin hangi verilerin sıfır olabileceğini ve hangi verilerin sıfır olmayacağının garanti edildiğini belirlemesine izin verir.

// ? optionalı eğer data null içeriyorsa veya değer olarak 0 değerini değilde null yapıda döndürmek istiyorsak kullanılır
// ! optionalı ise eğer datanın içerisinde null bir değer olmadığından eminsek kullanılır.


// İlk Anlatım
func getHaterStatus(weather:String) -> String? {
    if weather == "sunny"{
        return nil
    } else {
        return "Hate"
    }
}

// ? Kullanımı ile
var status: String?
status = getHaterStatus(weather: "rainy")


func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Haiting")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}


// İkinci Anlatım
// Aslında burda null safety yapmıyoruz değeri sıfır döndürüyoruz
func yearAlbumReleased(name: String) -> Int {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return 0
}

// Burda ise null safety yaparak burda ? kullanıldı ve nil yani null olarak döndürdük. Bu güvenli bir yöntemdir.
func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}


// Son Anlatım

func yearAlbumReleased2(name: String) -> Int? {
    
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return nil }
    return nil
}

var year = yearAlbumReleased2(name: "Taylor Swift")

if year == nil{
    print("There was an error")
}else {
    print("It was released in \(year!)")
}


var yearFearless = yearAlbumReleased2(name: "Fearless")
if yearFearless == nil{
    print("There was an error")
}else {
    print("It was released in \(year!)")
}



// Optional Chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The Album is \(album)")

let album2 = albumReleased(year: 2009) ?? "unknown"
print("The Album is \(album2)")
