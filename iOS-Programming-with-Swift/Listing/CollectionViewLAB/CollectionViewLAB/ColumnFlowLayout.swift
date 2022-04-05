////
//  CollectionView
//  Created by halilkrkn on 4.04.2022
//


// CollectionView - FlowLayout:
// Akışı ve görseli değiştirebilmek için CollectionView içerisindeki FlowLayout nesnelerini kullanmamız gerekiyor.

import UIKit

// Bu ColumnFlowLayout class'ında CollectionViewda gözükecek bir görsel işlemi yapacağız.
// Dinamik bir CollectionView görseli oluşturuyorruz. Bu Flow Layout ile.
// Burada birden fazla sütun olmasını istiyoruz ve bunu kendimiz verebileceğimiz bir sınıf oluşturduk.
class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    let sutunSayisi : Int
    let yukseklikOrani : CGFloat = (3.0 / 2.0)
    
    init(sutunSayisi : Int, minSutunAraligi : CGFloat = 0, minSatirAraligi : CGFloat = 0) {
        self.sutunSayisi = sutunSayisi
        super.init()
        self.minimumInteritemSpacing = minSutunAraligi // Sütunlara arası mesafeyi tanımlattık
        self.minimumLineSpacing = minSatirAraligi // Satırlar arası mesafeti tanımlattık.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // İlgili işlemleri prepare methodunun içerisinde yaptık.
    override func prepare() {
        super.prepare()
        
        // CollentionView'ı guard ile kontrol edip tanımladık.
        guard let collectionView = collectionView else {return}
        
        // CollectionView İçerisinde sütunlar arası aralığı, herbir eleman arasındaki genişliği ve yüksekliği hesaplattık
        let araliklar = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(sutunSayisi - 1)
        
        let elemanGenisligi = ((collectionView.bounds.size.width - araliklar) / CGFloat(sutunSayisi)).rounded(.down)
        
        let elemanYuksekligi = elemanGenisligi * yukseklikOrani
        
        itemSize = CGSize(width: elemanGenisligi, height: elemanYuksekligi)
    }
}
