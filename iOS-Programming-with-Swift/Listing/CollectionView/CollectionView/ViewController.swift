////
//  CollectionView
//  Created by halilkrkn on 4.04.2022
//

// CollectionView:
// CollectionView yapısı ile listeleri farklı akışlarda oluşturabiliyoruz.
// Birden fazla sütunda verileri göstermek, yatat scroll'da verileri göstermek gibi
// Sadece dikey değil yatay oval şekillerde listeleme yapmamıza olanak sağlıyor.
// Android'dki RecyclerView Yapısı gibidir. 


import UIKit

class ViewController: UIViewController {

    var liste = ["E1","E2","E3","E4","E5","E6","E7","E8","E9","E10","E11","E12"]
    
    // Kullanacağımız hücreyi CollectionView'ın içerisine mutlaka register edilmesi gerekiyor.
    // Register edilmesi içinde ilgili CollectionView'ın Outletini oluşturmamız gerekiyor.
    @IBOutlet weak var cvListe: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // CollectionView'ın Register Edilmesi Gerek
        // 1. Yöntem = register etmek için Xib dosyasını kullanırız. Yani Xib Dosyası ile bir Cell yapısı oluşturuyorsak bu methodu kullanmalıyız.
          cvListe.register(UINib(nibName: "CVC_Item", bundle: nil), forCellWithReuseIdentifier: "CVC_Item")
        
        
        // 2. Yöntem = register etmek için bu cellClass yapısnı kullanırız. Ama bu methodu kullanmak için storyboard'un içerisindeki CollectionView'ın cell'ini storyboad üzerinden değiştireceksek kullacağız.
        // cvListe.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        
        
        // Akışı ve görseli değiştirebilmek için CollectionView içerisindeki FlowLayout nesnelerini kullanmamız gerekiyor.
        // Burada CollectionView'ın FlowLayout'unu oluşturacaz.
        // ColumnFlowLayout Sınıfı burda cocollectionViewLayout methoduna atadık ve UI kişiselleştirmiş olduğumuz sutün sayısı görselini gösterdik.
        cvListe.collectionViewLayout = ColumnFlowLayout(sutunSayisi: 5, minSutunAraligi: 10, minSatirAraligi: 20)
        

    }
}

// Burdaki eklemeler TableView'daki gibi aynı formatta sadece protocoller CollectionView'ın ki olacak.
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 1. Yöntem ya da 2. Yöntem fark etmez iki yapı için bu yöntem kullnanılıyor.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Item", for: indexPath) as! CVC_Item
        
        cell.lblMetin.text = liste[indexPath.row]
        cell.lblMetin.textAlignment = .center
        cell.backgroundColor = .yellow
       
        return cell
    }
    
    
}

