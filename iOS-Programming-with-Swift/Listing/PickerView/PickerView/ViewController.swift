////
//  PickerView
//  Created by halilkrkn on 3.04.2022
//

// PickerView:
// Dinamik olarak liste çıkarmaya ihtiyaç duyduğumuz yerlerde PickerView yapısı kullanılır.
// ViewController üzerinden DatePicker gibi PickerView'ın viewInda değişilik yapamıyoruz.
// Storyboard ortamında bağlama yaparken PickerView'ı ilk View ile bağlayıp dataSource ve delegate yapılarını veriyoruz.

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pvListe: UIPickerView!
    
    var liste = ["Eleman 1","Eleman 2","Eleman 3","Eleman 4","Eleman 5","Eleman 6","Eleman 7","Eleman 8","Eleman 9"]
    var liste2 = ["E1","E2","E3","E4","E5","E6","E7","E8","E9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // PickerView'ı içerisindeki elemanların başlangıçta nasıl gözükmesi gerektiğini yazdık.
        pvListe.selectRow(1, inComponent: 0, animated: true) // liste için
        pvListe.selectRow(3, inComponent: 1, animated: true) // liste2 için
    }

    @IBAction func btnYenidenYukle(_ sender: Any) {
        
        liste.remove(at: 0)
        pvListe.reloadAllComponents() // Listenin içersindeki tüm elemanlar yeniden yüklenir.
    }
    
    // PickerView içerisinde birden fazla sütunda veri barındırabilir. Herbir sütuna component denilir.
    // Bu method PickerView içerisinde kaç tane component olduğunu belirtmemiz gerekiyor.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
//        return 1 // Bir tane liste vereceğimiz için 1 dedik. sadece 1 liste kullandığımızda
          return 2 // İki tane liste kullanacağımız için.
    }
    
    // numberOfRowsInComponent de herbir component içerisinde kaç tane satır oldğunu belirtmemizi istiyor.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        return liste.count // Burada da listenin içerisindeki elemanların sayısını tanımladık. sadece 1 liste kullandığımızda
        if component == 0 {
            return liste.count
        }
        return liste2.count
    }
    
    // PickerView'in içerisini doldurmamız gerekiyor yoksa liste içeriisindeki elemanlar gözükmüyor.
    // Yani burdaki method ile pickerview'ın içerisini özelleştirdik.
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if component == 0{
            return NSAttributedString(string: liste[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        }
        
        return NSAttributedString(string: liste2[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
    }
    
    // Buradaki methodun içerisindeki didSelectRow parametresi sayesinde PickerView içerisindeki elemanları seçip yakalayabiliyoruz.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            print(liste[row])
        }else {
            print(liste2[row])
        }
       
    }
}

