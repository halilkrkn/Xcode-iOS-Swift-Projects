////
//  CoreDataIntro
//  Created by halilkrkn on 9.04.2022
//

// lazy, nesne çağrılıncaya kadar belleğe çıkmıyor demektir.
// CoreData'da verilere erişmek için bir context yapısı vardır.
// Verilerle işlem yapmak için context değeri üzerinden işlem yapmamız gerekir.
// context ise AppDelegate içerisinde persistentContainer'ın içerisindedir.
// Yani context'e erişmek için AppDelegate'in içerisindeki persistentContainer'ı kullan demeliyiz.

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Yapilacak Entity'sinin içerisine veriyi database'e ekledik.
        yapilacakEkle(baslik: "baslik 3", icerik: "içerik 3")
        yapilacakGetir()
        
          // Güncelleme İşlemi Yaparken sadece burayı çalıştır.
//        yapilacakGetir()
//        yapilacakGuncelle()
        
        
        
        // Silme İşlemi Yaparken Sadece burayı çalıştır.
//        yapilacakSil()
//        yapilacakGetir()
        
    }
    
    // AppDelegate'in içerisinden persistentContainer'ın context'ine erişmek için fonksiyon yazıyoruz ki defalarca aynı erişimi yapmayalım.
    // Yani bir contextGetir fonksiyonu oluşturduk.
    func contextGetir() -> NSManagedObjectContext {
        
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }

    // Veritabanına Kayıt Etme işlemi - Database'e Veri Ekleme
    func yapilacakEkle(baslik : String, icerik: String) {
        
        // context'i aldık. Yani bir nevi database'i aldık.
        let context = contextGetir()
        
        // Burdaki entity ile context'ten(yani databaseden) oluşturmuş olduğumuz "yapilacak" entity'imizi aldık.
        let entity = NSEntityDescription.entity(forEntityName: "Yapilacak", in: context)
        
        // yapılacak nesnemizi oluşturduk.
        let yapilacak = NSManagedObject(entity: entity!, insertInto: context)
        
        // Yapilacak Entity'sinin içerisindeki baslik ve içerik değerlerine atama yaoılabilmesi için setValue kullandık.
        yapilacak.setValue(baslik, forKey: "baslik")
        yapilacak.setValue(icerik, forKey: "icerik")
        
        // kaydetme işlemi yaptık.
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

    // Database Üzerinden Sorgu İşlemleri - Database'den Veri Sorgulama
    func yapilacakGetir(){
        
        // Bütün Yapılacak Listesinin içerisindeki verileri getirmek için fecthRequest'i oluşturduk.
        let fetchRequest: NSFetchRequest<Yapilacak> = Yapilacak.fetchRequest()
        
        // Sorgu yapabilmemiz için.
        // fetchRequest.predicate = NSPredicate(format: "baslik contains 1")
        // fetchRequest.predicate = NSPredicate(format:"baslik = %@","baslik 2")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "baslik", ascending: true)] // burda ise liste içerisinde sorgu yapabiliriz.
        do{
            // Veritabanın içerisindeki Yapilacak Listesini getirdik. YAni eklenmiş olan verileri gösterdik.
            let yapilacaklar = try contextGetir().fetch(fetchRequest)
            
            for yapilacak in yapilacaklar {
                print("Baslik: \(yapilacak.baslik!) İçerik: \(yapilacak.icerik!)")
            }
            
        } catch {
            print("Hata Oluştu.")
        }
        
        
    }
    
    // Database'den Güncellenen Veriyi Getirme
    func yapilacakGetirGuncelle(baslik: String) -> [Yapilacak]? {
        
       
        let fetchRequest: NSFetchRequest<Yapilacak> = Yapilacak.fetchRequest()
        
         fetchRequest.predicate = NSPredicate(format: "baslik = %@", baslik)
        
        do{
           
            return try contextGetir().fetch(fetchRequest)
            
        } catch {
            
            print("Hata Oluştu.")
        }
    
        return nil
    }
    
    // Database'den Veri Güncelleme
    func yapilacakGuncelle(){
        
        if let yapilacak = yapilacakGetirGuncelle(baslik: "baslik 1") {
            
            for yapilacak in yapilacak {
                yapilacak.baslik = "Güncel Başlık"
            }
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    // Database'den Veri Silme
    func yapilacakSil(){
        
        if let yapilacak = yapilacakGetirGuncelle(baslik: "baslik 3") {
            
            for yapilacak in yapilacak {
                
                contextGetir().delete(yapilacak)
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    }

}

