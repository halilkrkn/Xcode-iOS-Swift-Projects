////
//  TableViewController
//  Created by halilkrkn on 3.04.2022
//

// TableView:
// Liste olarak birden fazla veriyi tutmak için kullanılır.

import UIKit

class TVCListe: UITableViewController {

    var liste = ["Eleman 1","Eleman 2","Eleman 3","Eleman 4","Eleman 5","Eleman 6","Eleman 7","Eleman 8","Eleman 9","Eleman 11","Eleman 12","Eleman 13","Eleman 14","Eleman 15","Eleman 16","Eleman 17","Eleman 18","Eleman 19","Eleman 21","Eleman 22","Eleman 23","Eleman 24","Eleman 25","Eleman 26","Eleman 27","Eleman 28","Eleman 29"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    // Elimizdeki veride gruplamalara ihtiyaç oludğunda numberOfSections methodu kullanılır.
    // Aslında PickerView daki gibi kaç tane liste olması gerektiğini bu numberOfSections methoduna yazıyoruz. Yani bir liste olacaksa return 1 yazılacak.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1 // Bir tane listemiz olduğu için return olarak 1 döndürdük.
    }

    //Bu method ve içerisindeki numberOfRowsInSection da herbir section için o sectiondaki eleman sayısını dönebildiğimiz bir yapıdır.
    // Yani aslında bu method bir listenin verinin eleman sayısını döndürdüğümüz bir methoddur.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return liste.count // Listedeki eleman sayısını girdik.
    }

    // TableView içerisindeki elemanları doldurmak için bu methodun içerisindeki cellForRowAt parametresi kullanılır.
    // Herbir liste veya veri elemanı için cell oluşturmamız gerekiyor. Bunun içinde cellForRowAt indexPaht methodunu kullanıyoruz.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        
        // Eğer sadece text gösterilmesine ihtiyacı varsa özel bir tasarıma ihtiyaç yoksa bu standart cell yapısı kullanılabilir.
        cell.textLabel?.text = liste[indexPath.row]
        cell.textLabel?.font = .preferredFont(forTextStyle: UIFont.TextStyle.largeTitle)
        cell.textLabel?.font = .italicSystemFont(ofSize: 15)
        cell.textLabel?.shadowColor = .orange
        cell.textLabel?.backgroundColor = .yellow
        
        return cell
    }
    
    
    // TableView daki Liste elemanın değerini okuyabilmek için
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(liste[indexPath.row]) // burda tableview üzerindeki listenin elemanlarına tıkladığımızda hangi elemana tıklamışsak onu okuyoruz.
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
