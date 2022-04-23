////
//  FirebaseNetwork
//  Created by halilkrkn on 23.04.2022
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewControllerGiris: UIViewController {

    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfHizmetKonusu: UITextField!
    @IBOutlet weak var tfEposta: UITextField!
    @IBOutlet weak var tfSifre: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    // Kullanıcı Authentication İşlemi
    @IBAction func btnKaydet(_ sender: Any) {
        Auth.auth().createUser(withEmail: tfEposta.text!, password: tfSifre.text!) { authResult, error in
          
            if error != nil {
                
                print(error?.localizedDescription)
                
            } else {
                
                self.hizmetKaydet()
            }
            
        }
    }
    
    func hizmetKaydet(){
        
        var kullanici = Kullanici()
        kullanici.ad = tfAd.text
        kullanici.soyad = tfSoyad.text
        kullanici.hizmetKonusu = tfHizmetKonusu.text
        
        
        let dic = [
            "Ad" : kullanici.ad,
            "Soyad": kullanici.soyad,
            "HizmetKonusu": kullanici.hizmetKonusu
        ]
        
        
        
        // Database İşlemleri
        var ref = Database.database().reference()        
        ref.child("Kullanicilar").child(Auth.auth().currentUser!.uid).setValue(dic)
        
        
        // Bir önceki ekrana dönmek için
        dismiss(animated: true, completion: nil)
        
        
        
        
    }
}
