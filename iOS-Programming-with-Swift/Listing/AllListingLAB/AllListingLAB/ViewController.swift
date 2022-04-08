////
//  AllListingLAB
//  Created by halilkrkn on 5.04.2022
//

// SENARYO:
// Başlık, kısa açıklama ve açıklaması bulunan bir makale yapısı bulunacak
// Listede Makalelerin başlık ve kısa açıklaması görülebilecek
// 105 adet makele bulunacak ve makaleler 20'şerli olarak listeye yüklenecek
// Makalelerin başlıkları ve kısa açıklamalarında aramalar yapılabilecek.
// Aramada girilen değerleri kapsayan kayıtlar filtrelenecek
// Yapılan aramaya göre tüm kayıtlar filtrelenip listeye veriler yüklenecek.

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tvListe: UITableView!
    @IBOutlet weak var sbListe: UISearchBar!
    
    var tumListe : [Makale] = []
    var yuklenmisListe : [Makale] = [] // Sayfalama yapılması için gereken liste
    var tumFiltreliListe : [Makale] = [] // Search Bardan filtreleme yapılması için
    
    var sayfa = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var makale: Makale
        
        for i in 0..<105 {
            
            makale = Makale(baslik: "Baslik \(i)", kisaAciklama: "Kısa Açıklama \(i)", aciklama: "Açıklama\(i)")
            tumListe.append(makale)
            
            if i < 20 {
                
                yuklenmisListe.append(makale)
            }
            
        }
        
        tumFiltreliListe.append(contentsOf: tumListe)
        tvListe.reloadData()
    }
    
    
    // SearchBarda Filtreleme Yapmak için gerekn Method.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        sayfa = 0
        
        tumFiltreliListe = searchText.isEmpty ? tumListe : tumListe.filter({ makale in
            
            let searchMakale = makale.baslik.range(of: searchText, options: .caseInsensitive) != nil || makale.kisaAciklama.range(of: searchText, options: .caseInsensitive) != nil
            return searchMakale
        })
        
        yuklenmisListe.removeAll()
        
        for i in 0..<tumFiltreliListe.count{
            
            if i < 20 {
                yuklenmisListe.append(tumFiltreliListe[i])
            }
        }
        
        tvListe.reloadData()
    }
    
}


// TableView'da listeleme ve sayfalama yapılarını burdan yaptık.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yuklenmisListe.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TVC_Makale", owner: self, options: nil)?.first as! TVC_Makale
        
        cell.lblBaslik.text = yuklenmisListe[indexPath.row].baslik
        cell.lblKisaAciklama.text = yuklenmisListe[indexPath.row].kisaAciklama
        
        return cell
    }
    
    
    // TableView'dan istenilen satırın tıklanma özelliği getirilmesi
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var alert = UIAlertController(title:tumListe[indexPath.row].baslik, message: tumListe[indexPath.row].kisaAciklama, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction.init(title: "Tamam", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcInfo = storyboard.instantiateViewController(withIdentifier: "VC_Info") as! VC_Info
        
        vcInfo.makaleBaslik = tumListe[indexPath.row].baslik
        vcInfo.makaleKisaAciklama = tumListe[indexPath.row].kisaAciklama
        
        present(vcInfo, animated: true, completion: nil)
        

        
    }
    
    


    // TableView'dan istenilen satırın silinmesi.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

            yuklenmisListe.remove(at: indexPath.row)
            tumListe.remove(at: indexPath.row)
            tvListe.reloadData()
        }
    }
    
    
    // Scroll'un konumu ile liste de yenileme yapılan kısım
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if((scrollView.contentOffset.y + scrollView.frame.height) > (scrollView.contentSize.height * 0.90)){
            makaleEkle()
        }
    }

    // Sayfalama için her 20 satırda bir sayfa artırma işlemi
    func makaleEkle(){
        
        if (((sayfa + 1) * 20) < tumFiltreliListe.count){
            
            for i in ((sayfa + 1 ) * 20)..<((sayfa + 2 ) * 20){
                
                if i < tumFiltreliListe.count {
                    
                    yuklenmisListe.append(tumFiltreliListe[i])
                }
            }
            sayfa += 1
            tvListe.reloadData()
        }
    }
    
}

