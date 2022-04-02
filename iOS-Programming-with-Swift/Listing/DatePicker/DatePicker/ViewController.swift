//
//  DatePicker
//  Created by halilkrkn on 2.04.2022
//



// DatePicker:
// Tarih ve zaman seçimi için DatePicker kullanılır.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dpTarih: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // DatePicker'ı özelleştirdik.
        dpTarih.setValue(UIColor.red, forKey: "textColor")
        dpTarih.minimumDate = Date()
        dpTarih.date = Date()
    }

    // View'da zamanı yakalama
    @IBAction func dpTarih_VC(_ sender: Any) {
        
        let zamanYakala = dpTarih.date
        
        // istediğimiz formata çevirdik.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        print(dateFormatter.string(from: zamanYakala))
    }
}

