////
//  Codable
//  Created by halilkrkn on 17.04.2022
//

// Codable
// Codable Yapısını json ve nesneyi (class, struct vs.) birbirine dönüştürme işlemlerinde kullanabiliriz.
// Bir protocol'dür.
// Dönüşüm işlemlerini yapacağımız Struct ve Class gibi yapıların bu protocol'ü uygulaması (inherit etmesi-miras alması) gerekir.


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kisi = Kisi(ad: "halil", soyad: "karkin")
        
        // Encodable - Nesneyi Json'a Dönüştürme İşlemi
        let encoder = JSONEncoder()
        
        let json = try! encoder.encode(kisi) // json'a dönüştürdük.
        
        let strJson = String(data: json, encoding: .utf8)
        
        print(strJson as Any)
        
        // decodable - Json'u Nesneye Dönüştürme İşlemi
        let decoder = JSONDecoder()
        
        let decoderObj = try! decoder.decode(Kisi.self, from: json) // json'daki veri nesneye dönüştürüldü.
        
        print(decoderObj.ad)
    }
}

// Burada struct Kisi : Codable yerine Encodable ve Decodable protocolleri de kullanılabilir.
struct Kisi: Decodable, Encodable {
    
    var ad: String
    var soyad: String
   
    // Json içerisindeki parametre değerleri ile Nesne içerisindeki değerlerin isimleri aynı olmayabilir.
    // Böyle durumlarda da dönüştürmek için bir CodingKey enum'u oluşturulur.
    enum CodingKeys: String, CodingKey {

        case ad = "name"
        case soayd = "surname"
    }
}


