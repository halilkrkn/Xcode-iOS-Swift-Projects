////
//  CocoaPods
//  Created by halilkrkn on 16.04.2022
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // "{\"Ad\" : \"Halil\", \"Soyad\": \"Karkın\"}" -> Doğrudan Tek bir Nesne Alınıyor
        // "[{\"Ad\" : \"James\", \"Soyad\": \"Bond\"}, {\"Ad\" : \"Tom\", \"Soyad\": \"Cruies\"}]" -> İlgili Nesnenin Listesi Alınıyor
        
        
        // Normal tek bir Nesneyi aldık
        let jsonStr = "{\"Ad\" : \"Halil\", \"Soyad\": \"Karkın\"}"
        
        if let strData = jsonStr.data(using: .utf8) {
            
            let json = JSON(strData)
            
            var kisi = Kisi()
            kisi.ad = json["Ad"].stringValue
            kisi.soyad = json["Soyad"].stringValue
            
            print(kisi.ad,"",kisi.soyad)
            
        }
        
        // Liste içerisindeki nesneyi aldık.
        let strArrJson = "[{\"Ad\" : \"James\", \"Soyad\": \"Bond\"}, {\"Ad\" : \"Tom\", \"Soyad\": \"Cruies\"}]"
        
        var kisiListesi = [Kisi]()
        
        if let strArrData = strArrJson.data(using: .utf8) {
            
            let jsonArr = JSON(strArrData)
            
            
            var kisi: Kisi // referance oluşturuldu
            for jsonArr in jsonArr.arrayValue {
                
                kisi = Kisi()
                kisi.ad = jsonArr["Ad"].stringValue
                kisi.soyad = jsonArr["Soyad"].stringValue
                kisiListesi.append(kisi)
            }
            
        }
        
    }


}

class Kisi {
    
    var ad = ""
    var soyad = ""
    
    
}
