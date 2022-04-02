//
//  ViewController.swift
//  NavigationControllerLAB
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VCLogIn: UIViewController {

    /* SENARYO:
        
        // Kullanıcı adi ve şifre olan bir login ekranı tasarlanacak
        // Kullanıcı adi ve şifreye "a" değeri ile girildiğinde uygulama ekranına gidecek
        // Anasayfffadan login ekranına tekrar geri gelinemeyecek.
        // Kullanıcı adı ve şifre "a"'dan farklı ise üye ol ekranına gidecek
        // Üyel ol ekranından login ekranına geri gelinebilecek.
        
        */
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogIn(_ sender: Any) {
        if tfUsername.text == "a" && tfPassword.text == "a" {
            performSegue(withIdentifier: "SegueHome", sender: nil)
//           Bunu yaptığımızda Navigation Controller'ın viewControllerları arasından Login Ekranını kaldırdık.
//            Yani bu şekilde login yaptıktan sonra home sayfasına geçiş yapıldıktan sonra tekrardan login ekranına tekardan geri gelinemeyecek.
            navigationController?.viewControllers.remove(at: 0)
        } else {
            
            performSegue(withIdentifier: "SegueSignUp", sender: nil)
        }
        
    }
    
}

