////
//  TableViewPaging
//  Created by halilkrkn on 5.04.2022
//

// TableView'in içerisinde sayfalama işleminin nasıl yapılacağı ve verilerin parçalı olarak nasıl yüklendiğini görecez.


import UIKit

class ViewController: UIViewController {

    var liste: [String] = []
    
    
    @IBOutlet weak var tvListe: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        elemanEkle()
        
    }
    
    func elemanEkle(){
         
        let listeEklenecek = ["Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman","Eleman",]
        
        liste.append(contentsOf: listeEklenecek) // contentsOf ile listenin tamamı eklenir
        
        tvListe.reloadData()
    }

    // Scroll'ın pozisyonunu alabildiğimiz bir method.
    // Yani bu method aslında scroll'un her hareketinde tetiklenen bir method'dur.
    // Bu scroll'un pozisyonuna göre veri yükleme yapılacak.
    // İşte sayfalama bu şekilde olmuş oluyor ki tüm verileri hemen yüklenmiyor scroll'un durumuna göre yükleniyor.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Scroll'un her hareketinde tekrar tekrar veri almaması için yani eleman yüklemesi yapmaması için ve istenilen pozisyona geldiğinde yükleme işlemi yapması için bir kontrol işlemi yapıyoruz.
        // Burda scrollView'ın listedeki durumlarını yazıyoruz ve liste daha sona gelmeden(yani elemanların %95'i yüklendiğinde) verilerin yüklenmesini sağlatıyoruz.
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) > (scrollView.contentSize.height * 0.95)) {
            elemanEkle()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = liste[indexPath.row] + " \(indexPath.row)"
        
        return cell
    }
    
    

    
}

