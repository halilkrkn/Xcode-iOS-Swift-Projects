////
//  AlamofireNetwork
//  Created by halilkrkn on 17.04.2022
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Request (İstek) İşlemi yapıldı. Yani HttpRequest işlemini kurduk.
        // response ile de request'in yanıtı(sonucunu) almak için
        AF.request("https://httpbin.org/get").response { response in
            
            // debugPrint ile apimize (request)isteği gönderip (response) yanıtını aldıktan sonra ilgili apimizin verilerini Logcatte gösterip inceleyebiliyoruz.
            // Apimizin responsu(yanıtı,cevabı, sonucu) logcatteki body kısmının içerisindeki alandır.
            // Bu body içerisindeki apimizin verilerini Codable ve SwiftJson yapısı ile istenilen nesneye dönüştürülüp içeriğini okuyabiliriz.
            debugPrint(response)
        }
        
        // Alamofire Header Yapısı Oluşturma
        
        // 1. Yöntem.
        let hearders1 : HTTPHeaders = [
            .authorization("Token"),
            .authorization(username: "eposta", password: "sifre"), // authorization işlemi için istenilen hangisi ise o kullanılır.
            .accept("application/json")
        ]
        
        print(hearders1)
        
        // 2. Yöntem
        let hearders2: HTTPHeaders = [
            "Token" : "Token değeri",
            "Content-Type" : "application/json",
            "accept" : "application/json2"
        ]
        print(hearders2)
        
        AF.request("https://httpbin.org/headers", headers: hearders1).responseJSON { response in
            debugPrint(response)
        }
        
        // Alamofire - Parametre Göndermek (POST,PUT,DELETE, vs.)
        // 1. Yöntem
        let kisi = Kisi(ad: "Halil", soyad: "Karkin") // kisi bir parametersdir.
       
        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: kisi,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
        
        // 2. Yöntem
        let parameters = ["eposta": "halilkrkn@gmail.com", "sifre": "123456"]
        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
}


struct Kisi : Encodable {
    
    let ad: String
    let soyad : String
}
