//
//  ViewController.swift
//  NavigationController
//
//  Created by halilkrknon 28.03.2022.
//

import UIKit

class NavigationController: UIViewController {
    
    /* SENARYO:
     
     // Kullanıcı adi ve şifre olan bir login ekranı tasarlanacak
     // Kullanıcı adi ve şifreye "a" değeri ile girildiğinde uygulama ekranına gidecek
     // Anasayfffadan login ekranına tekrar geri gelinemeyecek.
     // Kullanıcı adı ve şifre "a"'dan farklı ise üye ol ekranına gidecek
     // Üyel ol ekranından login ekranına geri gelinebilecek.
     
     */
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
       
    }

    @IBAction func btnKodlaGec(_ sender: Any) {
        performSegue(withIdentifier: "KodlaGec", sender: nil)
    }
    
    
}

