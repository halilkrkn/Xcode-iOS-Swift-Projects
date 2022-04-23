////
//  FirebaseNetwork
//  Created by halilkrkn on 23.04.2022
//

// SENARYO:
// - Uygulama açılışında tüm hizmet veren kişilerin adı, soyadı, ve hizmet konusu listelenecektir.
// - Eğer kullanıcı hizmet vermek istiyorsa giriş yapması gerekecektir.
// - Ekranda giriş yap o butonu bulunacaktır. Bu butona basıldığında kullanıcı giriş ekranı açılacaktır.
// - Giriş eposta ve şifre ile olacaktır.
// - Giriş ekranında kullanıcıdan ad, soyad ve hizmet konusu bilgileri alınacaktır.
// - Giriş yaptıktan sonra ana ekrana geri dönülecek ve giriş yap butonu kaybolacaktır.
// - Uygulama açıldığında kullanıcı daha önce giriş yapmışsa otomatik giriş yapılmış olacaktır.

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tvListe: UITableView!
    @IBOutlet weak var btnGirisYap: UIButton!
    
    var kullaniciListesi : [Kullanici]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if Auth.auth().currentUser != nil {
//            btnGirisYap.isHidden = true
//        }
        
        
        
        // Database'den Verileri Okumak ve Listelemek için
        Database.database().reference().child("Kullanicilar").observe(.value) { DataSnapshot in
            
            var k: Kullanici // kullanici referansı
            
            if self.kullaniciListesi == nil {
                self.kullaniciListesi = []
                
            } else {
                
                self.kullaniciListesi?.removeAll()
            }
            
            
            for kullaniciSnapshot in DataSnapshot.children {
                
                let deger = (kullaniciSnapshot as! DataSnapshot).value as! NSDictionary
                
                k = Kullanici()
                k.ad = deger["Ad"] as? String
                k.soyad = deger["Soyad"] as? String
                k.hizmetKonusu = deger["HizmetKonusu"] as? String
                
                // Database'deki verileri listeye ekledik.
                self.kullaniciListesi?.append(k)
                
            }
            
            // Databasedeki verileri alıp lsitedik.
            self.tvListe.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if kullaniciListesi != nil {
            return kullaniciListesi!.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let satir = Bundle.main.loadNibNamed("TVC_Satir", owner: self, options: nil)?.first as! TVC_Satir
        
        let kullanici = kullaniciListesi![indexPath.row]
        
        satir.lblAdSoyad.text = "\(kullanici.ad ?? "") \(kullanici.soyad ?? "")"
        satir.lblHizmetKonusu.text = kullanici.hizmetKonusu
        
        return satir
        
    }
    
    
    
}

