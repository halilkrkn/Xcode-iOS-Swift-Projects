//
//  ViewController.swift
//  OutletAndActionUseLoginScreen
//
//  Created by karkinh on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    /* Senaryo:
     
     Kullanıcı adi ve şifrenin girilebileceği bir login ekranı tasarlanacak.
     Giriş butonuna tıklandığında textField alanları kontrol edilecek
     Alanlar boş ise print ile boş uyarısı verilecek
     Dolu ise değer kontrolü yapılarak başarılı ya da başarısız yazdırılacak
     
     
     */
    

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnLogIn(_ sender: Any) {
        if textFieldUsername.text != ""  && textFieldPassword.text != "" {
          
            if textFieldUsername.text == "a" && textFieldPassword.text == "s" {
                print("Giriş Başarılı")
                
            } else {
                print("Giriş Başarısız")
            }
                
        } else {
            
            print("Kullanici Adi ve Şifre Boş olamaz")
        }
    }
    
}

