////
//  URLSession
//  Created by halilkrkn on 17.04.2022
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // URLSession Get Request(İstek) Oluşturma
        var request = URLRequest(url: URL(string: "")!)
        
        // URLSession Header Oluşturma
        // Header [String:String] olan bir dictionary yapısıdır.
        var header = [String : String]()
        
        header["Content-Type"] = "application/json"
        
        header["Autorization"] = "Token Değeri"
        
        // Oluşturulan header nesnesini requestin içine koyulmalı
        request.allHTTPHeaderFields = header
        
        // Header'ın içerisinde verileri bu şekilde de eklete biliriz. Yukarıdaki gibi yapmak zorunda değiliz.
        request.addValue("Değer", forHTTPHeaderField: "Key")
        
        
        // URLSession Post İstek Methodu
        // buradaki httpMethod ile PUT, DELETE, GET isteklerini verebiliriz.
        request.httpMethod = "POST"
        
        let parametreler : [String : Any] = [
            
            "Eposta": "deger",
            "Sifre" : "deger"
        
        ]
        
        if header["Content-Type"] == "application/json" {
            
            request.httpBody = try! JSONSerialization.data(withJSONObject: parametreler, options: [])
            
            
        } else if header["Content-Type"] == "application/x-www-form-urlencoded" {
            
            request.httpBody = urlEncodedCevir(parametreler: parametreler)
        }
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                
                // hata drumu var
                
            } else {
                // Başarı durumu var
                let sonuc = response as! HTTPURLResponse
                
                if sonuc.statusCode == 200 {
                    // Dönüştürme İşlemleri
                    DispatchQueue.main.async {
                        // UI güncelleme
                    }
                } else {
                    // Servis hatası
                    
                }
            }
            
        }.resume()
        
    }
    
    
    func urlEncodedCevir(parametreler: [String: Any]) -> Data {
        
        var strData = " "
        
        for p in parametreler {
            
            if strData != "" {
                strData += "&"
            }
            strData += "\(p.key)=\(p.value)"
        }
        
        return strData.data(using: .ascii)!
        
    }


}

