////
//  UserDefaultsLAB
//  Created by halilkrkn on 9.04.2022
//

// SENARYO:
// Ekranda koyu tema ve açık temanın seçilmesini sağlayacak butonlar olacak.
// Bu butonlar aracılığı ile kullanıcı uygulamasının temasını seçebilecek.
// Uygulama açıldığında kullanıcının teması ne ise arkaplan ona göre renklenecek.
// Varsayılan tema, açık renk tema olacaktır.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        temaUygula()
    }


    @IBAction func btnAcikTema(_ sender: Any) {
        
        temaYaz(tema: "A")
        temaUygula()
    }
    
    
    @IBAction func btnKoyuTema(_ sender: Any) {
        temaYaz(tema: "K")
        temaUygula()
    }
    
    func temaYaz(tema: String) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(tema, forKey:"tema")
        userDefaults.synchronize()
        
    }
    
    func temaUygula(){
        
        if UserDefaults.standard.string(forKey: "tema") == "K" {
            
            view.backgroundColor = UIColor(named: "koyu")
        } else {
            view.backgroundColor = UIColor(named: "acik")
        }
        
    }
}

