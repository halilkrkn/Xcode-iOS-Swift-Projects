////
//  CoreDataIntroLAB
//  Created by halilkrkn on 9.04.2022
//

import UIKit
import CoreData
class ViewControllerEkleDuzenle: UIViewController {

    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    var kisi: Kisi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Kişi Güncellemesi Yapmak için
       // Burada database'e eklenen kişilerin bilgilerini güncellemek istediğimiz de tekrardan textField'lara aktardık.
        if kisi != nil {
            tfAd.text = kisi!.ad
            tfSoyad.text = kisi!.soyad
            tfEmail.text = kisi!.email
        }
    }

    
    @IBAction func btnKaydet(_ sender: Any) {
        
        kisiEkle()
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnVazgec(_ sender: Any) {
    
        dismiss(animated: true, completion: nil)
    }
    
    
    func kisiEkle() {
        // Database Erişmek için
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if kisi == nil {
            
            // Kişilerin Eklenmesi için
            let entity = NSEntityDescription.entity(forEntityName: "Kisi", in: context)
            
            let kisi = NSManagedObject(entity: entity!, insertInto: context)

            // Database'de oluşturudğumuz ad, soyad, email değerlerini vererek textfieldlar vasıtasıyla bu değerlere veri ekleyebileceğiz.
            kisi.setValue(tfAd.text!, forKey: "ad")
            kisi.setValue(tfSoyad.text!, forKey: "soyad")
            kisi.setValue(tfEmail.text!, forKey: "email")
            
        } else {
            // TextField'lardan Aldığımız verileri ilgili değişkenlere atadık.
            kisi!.ad = tfAd.text!
            kisi!.soyad = tfSoyad.text!
            kisi!.email = tfEmail.text!
            
        }

        (UIApplication.shared.delegate as! AppDelegate).saveContext() // Database veri eklendiğinde kaydetmesi için.
        
        
    }
    
}
