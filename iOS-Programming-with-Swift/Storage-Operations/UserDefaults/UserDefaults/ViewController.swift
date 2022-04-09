////
//  UserDefaults
//  Created by halilkrkn on 9.04.2022
//

// UserDefaults
// Uygulama özelinde ya da uygulamanın dahil olduğu grup özelinde kğçğk verileri tutabilmemizi sağlar.
// Android'deki "sharedPreferences veya DataStore" gibi.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func userWrite(value : Any, key : String){
        
        let userDefaults = UserDefaults.standard // Burda standard UserDefault yapısına eriştik.
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize() // en son bu kod yazılmalı yoksa UserDefault çalışmayacaktır.
    }
    
    func userRead(key: String) -> String? {
        
        // Burda String ile bir değer döndürme olduğu için standard'dan sonra string üzerinden işlem yaptırdık.
        if let deger = UserDefaults.standard.string(forKey: key) {
            return deger
        }
        
        return nil
    }
    
    func userDelete(key: String) {
        
        // Burda bir değer döndürme durumu olmadığı için object ile işlem yaptırdık.
        if (UserDefaults.standard.object(forKey: key) != nil){
            
            UserDefaults.standard.removeObject(forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

