////
//  ViewController_TableViewLAB
//  Created by halilkrkn on 3.04.2022
//



// SENARYO:
// Ekranda bulunan metin alanından girilen değerin ekle butonuna basıldığında alttaki listeye değeri eklemesi

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tfMetin: UITextField!
    @IBOutlet weak var tvListe: UITableView!
    
    var liste: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnEkle(_ sender: Any) {
        liste.append(tfMetin.text!) // TextField'den aldığımız string değerleri lsiteeye ekliyoruz.
        tvListe.reloadData() // Listeye eklediğimiz verileri TableView'i her eleman eklendiğinde yenileyerek ekliyoruz.
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count // Listenin eleman sayısı/boyutu
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        cell.textLabel?.text = liste[indexPath.row] // Listeye Eklenen veya liste var olan verilerin TableView'ın herbbir satırında gösterilmesi
        return cell
    }
    
    // Listede istenilen satırdaki veriyi okuma ve alert içerisinde gösterme
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(liste[indexPath.row])
        
        // Listedeki var olan veriye tıklayıp tıklanılan verinin değerlerini alrtte gösterme
        var alert = UIAlertController(title: "Liste", message: liste[indexPath.row], preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    // Listeden Veri Silme
    // iOS'da standart olan sola çekme ile silme işlemi
    // edittingStyle satırın düzenleme methodudur.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Listeden veri silme
        if editingStyle == .delete {
            liste.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            print(liste[indexPath.row])
        }
    }
}

