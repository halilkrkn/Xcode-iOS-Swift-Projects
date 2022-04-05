////
//  TableView_SearchBar
//  Created by halilkrkn on 5.04.2022
//


// TableView'de SearchBar Kullanımı
import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var sbListe: UISearchBar!
    @IBOutlet weak var tvListe: UITableView!
    @IBOutlet weak var tfArama: UITextField!
    
    // SearchBar'da arama yapıldığında TableView'e filtrelenmiş olan listeyi doldurmamız gerekiyor.
    // Bunun için iki tane listeye ihtiyacımız var. Bunlardan bir tanesi TAM LİSTE diğeri ise FILTRELENMİŞ LİSTE
    //
    
    var tamListe = ["Elma", "Armut", "Portakal", "Kiraz", "Erik", "Ayva", "Üzüm", "Ejder Meyvesi", "Karpuz"]
    var filtreliListe: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        filtreliListe.append(contentsOf: tamListe)
    }

    @IBAction func tfArama(_ sender: Any) {
        
        filtreliListe.removeAll()
        
        if tfArama.text!.isEmpty {
            
            filtreliListe.append(contentsOf: tamListe)
            
        } else {
            
            for meyve in tamListe {
                
                if meyve.range(of: tfArama.text!) != nil {
                    
                    filtreliListe.append(meyve)
                    
                }
                    
            }
        }
        tvListe.reloadData()
        
        
    }
}



// SearhBar için gerekli olan protocolü ekledik.
extension ViewController: UISearchBarDelegate {
    
    // TextDidChange methodunu kullanıyoruz.
    // Burada Filtreleme işlemini yapacaz.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filtreliListe = searchText.isEmpty ? tamListe : tamListe.filter({(str: String) -> Bool in

            let filter = str.range(of: searchText, options: .literal) != nil

            return filter
        })

        tvListe.reloadData()
    }
}



// TableView için gerekli olan protocol'ü ve bu protocol'ün zorunlu methodlarını ekledik.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filtreliListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = filtreliListe[indexPath.row]
        
        return cell
    }
 
}

