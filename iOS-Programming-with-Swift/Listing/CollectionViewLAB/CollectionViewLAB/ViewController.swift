////
//  CollectionViewLAB
//  Created by halilkrkn on 4.04.2022
//


// SENARYO:
// Ürün sınıfı içerisinde Resmi, Başlığı, Kısa Açıklaması ve Fiyatı bulunan ürünlerin iki sütun halinde listelenmesi


import UIKit

class ViewController: UIViewController{
    
    var urunListe : [Urun] = []

    @IBOutlet weak var cvUrunListe: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var urun = urunListesi()
        cvUrunListe.register(UINib(nibName: "CVC_Urun", bundle: nil), forCellWithReuseIdentifier: "CVC_Urun")
        cvUrunListe.collectionViewLayout = ColumnFlowLayout(sutunSayisi: 3, minSutunAraligi: 10, minSatirAraligi: 10)
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunListe.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Urun", for: indexPath) as! CVC_Urun
        
        let urun = urunListe[indexPath.row]
        
        cell.lblBaslik.text = urun.baslik
        cell.lblKisaAciklama.text = urun.kisaAciklama
        cell.lblFiyat.text = "\(urun.fiyat!) TL"
        cell.ivResim.image = UIImage(named: urun.resimAd!)
        
        
        return cell
    }


}

extension ViewController {
    
    func urunListesi(){
        var urun = Urun()
        
        urun.baslik = "Berry"
        urun.fiyat = 10.21
        urun.kisaAciklama = "Dut "
        urun.resimAd = "berry"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Bread"
        urun.fiyat = 2.5
        urun.kisaAciklama = "Ekmek"
        urun.resimAd = "bread"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Canned Food"
        urun.fiyat = 21.21
        urun.kisaAciklama = "Konserve "
        urun.resimAd = "cannedfood"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Cherry"
        urun.fiyat = 6.99
        urun.kisaAciklama = "Kiraz"
        urun.resimAd = "cherry"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Chili"
        urun.fiyat = 50
        urun.kisaAciklama = "Biber "
        urun.resimAd = "chili"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Date Palm"
        urun.fiyat = 10.21
        urun.kisaAciklama = "Hurma"
        urun.resimAd = "datepalm"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Dragon Fruit"
        urun.fiyat = 14
        urun.kisaAciklama = "Ejder Meyvesi "
        urun.resimAd = "dragonfruit"
        urunListe.append(urun)

        urun = Urun()
        urun.baslik = "Meat"
        urun.fiyat = 100
        urun.kisaAciklama = "Dana Eti "
        urun.resimAd = "meat"
        urunListe.append(urun)
      
        urun = Urun()
        urun.baslik = "Milk"
        urun.fiyat = 35
        urun.kisaAciklama = "Süt "
        urun.resimAd = "milk"
        urunListe.append(urun)
       
        urun = Urun()
        urun.baslik = "Rambutan"
        urun.fiyat = 150
        urun.kisaAciklama = "Rambutan "
        urun.resimAd = "rambutan"
        urunListe.append(urun)
      
        urun = Urun()
        urun.baslik = "Rice"
        urun.fiyat = 10.21
        urun.kisaAciklama = "Pirinç "
        urun.resimAd = "rice"
        urunListe.append(urun)
       
        urun = Urun()
        urun.baslik = "Salt"
        urun.fiyat = 10.21
        urun.kisaAciklama = "Tuz "
        urun.resimAd = "salt"
        urunListe.append(urun)
        
        urun = Urun()
        urun.baslik = "Tomato"
        urun.fiyat = 10.21
        urun.kisaAciklama = "Domates "
        urun.resimAd = "tomato"
        urunListe.append(urun)
    }
     
}

