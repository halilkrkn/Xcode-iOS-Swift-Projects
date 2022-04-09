////
//  CoreDataIntroLAB
//  Created by halilkrkn on 9.04.2022
//

// - SENARYO:
// - Giriş Ekranında Kişi Listesi bulunacak.
// - Ekranın sağ üst köşesinde + butonu olacak ve basıldığında yeni kişi ekleme sayfası açılacak.
// - Yeni ekleme sayfasında kişilerin Ad, Soyad, E-Mail bilgileri alınacak.
// - Kaydet butonuna basıldığında bilgiler veritabanına kaydedilecek.
// - Kayıt işlemi sonrasında giriş ekranına geri dönülecek ve yeni kişi listeye eklenecek.
// - Listede veriler alfabetik olarak sıralı gelecek.
// - Listedeki kayıt edilmiş bir elemana basıldığında düzenleme ekranına gidilecek ve bilgiler güncelenebilecek.
// - Düzenleme Ekranı yeni ekleme ekranı ile aynı tasarıma sahip olacak.
// - Listedeki eleman sola çekildiğinde silinebilecek.

import UIKit
import CoreData


class ViewController: UIViewController {

    
    @IBOutlet weak var tvKisiListe: UITableView!
    
    var kisiListesi: [Kisi]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        kisilerGetir()
    }
    
    
    // Kişiler Listelendi.
    func kisilerGetir() {
        
        // Sorgulama işlemi
        let fetchRequest: NSFetchRequest<Kisi> = Kisi.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "ad", ascending: true)]
        
        do {
            kisiListesi = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            tvKisiListe.reloadData()
            
        }
        catch{}
    }
}



// TableView Kurulumu ve database'deki verilerin tableView'de gösterilmesi
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if kisiListesi != nil {
            
            return kisiListesi!.count
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = kisiListesi![indexPath.row].ad! + " " + kisiListesi![indexPath.row].soyad!
        return cell
        
    }
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "sgDuzenle", sender: indexPath.row)
    }
    
    
    // Düzenleme - Güncelleme İşlemi Yapıldı.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgDuzenle" {
            
            let hedefViewController = segue.destination as! ViewControllerEkleDuzenle
            hedefViewController.kisi = kisiListesi![sender as! Int]
        }
    }
    
    
    // Silme İşlemi Yapıldı.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(kisiListesi![indexPath.row])
            kisilerGetir()
            
        }
    }
    
}

