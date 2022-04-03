////
//  ViewController_TableView
//  Created by halilkrkn on 3.04.2022
//

import UIKit

// Eğer storyboard'da sadece TableView kullanacaksak bu bir controller yapısında olmadığı için ilgli ViewController'a "UITableViewDelegate, UITableViewDataSource" protocolleri eklenmelidir. İlgli ViewControllerda gösterelim.
// Ve TableView Nesnesinin storyboard'daki View'a "delegate ve dataSource"'larının bağlanması gerekmektedir.
class ViewController: UIViewController {
   
    var liste = ["Eleman 1", "Eleman 2","Eleman 3", "Eleman 4","Eleman 5", "Eleman 6","Eleman 7", "Eleman 8","Eleman 9", "Eleman 10","Eleman 11", "Eleman 12","Eleman 13", "Eleman 14","Eleman 15"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}

// Bu işlemleri daha okunaklı bir hale getirmek için class'ları ayırıp işlevleri ayırıp kullanmak için extension yazarakda kullanılabilir.
// Bunu extension'lar ile yapabiliriz.
// Hemen Aynı dosya içerisinde veya darklı bir dosya içerisinde de kullanılabilir.
// Mesela bu extension yöntemi ile ViewController classı içerisi daha sade ve okunabilir oldu. Böylelikle bu extensionlar sayesinde kod kalabalıkları gitmiş oldu.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Burda Listenin boyutunu yani toplam elemanını veriyoruz.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    // Burda ise TableView içerisinde listedeki verilerin gözükmesini sağlatmaya çalışıyoruz.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = liste[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
}



