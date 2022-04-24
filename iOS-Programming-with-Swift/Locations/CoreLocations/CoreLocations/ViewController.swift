////
//  CoreLocations
//  Created by halilkrkn on 24.04.2022
//

// CoreLocation
// Konum bilgisini alabilmek için CoreLocation kütüphanesi kullanılır.
// Konum bilgisini kullanabilmek için kullanıcı izni gerekmektedir.
// Konum bilgilerini alabilmek için info.plist dosyasına Location izinlerini almamız gerekiyor.
// Bu izinler Privacy - Location Always and When In Use Usage Description ve Privacy - Location When In Use Usage Description izinleridir.

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        konumAl()
    }
    
    func konumAl(){
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
//       bu yapı ile ne kadar doğruluklu bir konum bilgisne ihtiyacımız olduğunu belirtiyoruz.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
//       Location Servislerinin aktif olup olmadığını kontrol etmek için
        if CLLocationManager.locationServicesEnabled() {
//            Konum dinlemelerine başlayacak
            locationManager.startUpdatingLocation()
        }
        
    }
    
//    didUpdateLocations fonksiyonu her konum güncellemesinde çalışacak olan fonksiyondur.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
      
        let konum: CLLocation = locations[0]
        print("\(konum.coordinate.latitude) - \(konum.coordinate.longitude)")
//      Eğer lonum dinlemelerini hep yapmasını istemiyorsak sadece bir kere dinlesin istiyorsak kullanılırç
        locationManager.stopUpdatingLocation()
    }

}

