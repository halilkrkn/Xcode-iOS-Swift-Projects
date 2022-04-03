////
//  Custom_Cell_Xib_LAB
//  Created by halilkrkn on 3.04.2022
//

// SENARYO:
// Ad, Soyad ve Cinsiyet bilgilerini barındıran bir kişi Nesnesinin listesini tableView içinde gösterilmesi


import UIKit

class ViewController: UIViewController {
    
    var kisiListesi: [Kisi] = []
    @IBOutlet weak var tvKisiler: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Kisi Class'ındaki verileri kullanarak kisiListesine veri Eklemiş olduk.
        kisiListesi.append(Kisi(ad: "Halil", soyad: "Karkın", cinsiyet:"E"))
        kisiListesi.append(Kisi(ad: "Katty", soyad: "Perry", cinsiyet:"K"))
        kisiListesi.append(Kisi(ad: "Cristiano", soyad: "Ronaldo", cinsiyet:"E"))
        kisiListesi.append(Kisi(ad: "Lionel", soyad: "Messi", cinsiyet:"E"))
        kisiListesi.append(Kisi(ad: "Angelina", soyad: "Julie", cinsiyet:"K"))
        
        tvKisiler.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    // KisiListesi boyutunu/eleman sayısını tanımladık.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisiListesi.count
    }
    
    
    // TableView'deki satırlara kisiListesindeki verileri Ekledik.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TVC_Kisi", owner: self, options: nil)?.first as! TVC_Kisi
        
        let kisi = kisiListesi[indexPath.row]
        cell.lblAdSoyad.text = kisi.Ad + " " + kisi.Soyad
        
        if kisi.Cinsiyet == "E" {
            cell.ivCinsiyet.image = UIImage(named: "man")
        } else {
            cell.ivCinsiyet.image = UIImage(named: "woman")
        }
        
        return cell
    }
    
    // TableView listesindeki verileri sola kaydırma yaparak silme işlemi yaptık.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            kisiListesi.remove(at: indexPath.row)
            tvKisiler.reloadData()
        }
    }
    
    
}

