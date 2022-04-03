////
//  Custom_Cell_Xib
//  Created by halilkrkn on 3.04.2022
//

// TableView içerisinde kullandığımız hücreleri özelleştirirken ayrı bir dosya halinde (custom cell xib) nasıl yapılacağını göreceğiz.
// Xib file daki amaç sadece bir satir için tasarım yapıp birden fazla yerde bu satir'ı kullanabilmemize olanak sağlıyor.
import UIKit

class ViewController: UIViewController {
    
    var liste = ["Eleman1", "Eleman 2", "Eleman 3", "Eleman 4", "Eleman 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Buradaki oluşturmuş olduğumuz Xib dosyasını çağırmak için Bundle'ı Kullanıyoruz.
        // Bundle.main.loadNibNamed methodu sayesinde dosya içerisindeki ilgili dosyamızı tanımlıyoruz.
        let cell  = Bundle.main.loadNibNamed("TVC_Satir", owner: self, options: nil)?.first as! TVC_Satir
        cell.lblMetin.text = liste[indexPath.row]
        return cell
        
    }
    
    
}

