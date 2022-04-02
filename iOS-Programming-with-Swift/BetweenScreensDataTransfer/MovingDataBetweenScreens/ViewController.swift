//
//  ViewController.swift
//  MovingDataBetweenScreens
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VC_Red: UIViewController {

    // Segue'ler ile ekran geçişi ve Ekranlar arası veri transferi.
    // Veri taşıma yapmak istediğimiz durumda oluşturulan Seque ye identifier vermek zorundayız.
    // Ekranlar arası birden fazla segue olabilir.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSegueGec(_ sender: Any) {
        // Bu tanımlama işlemi yaptıktan sonra butona basıldıktan sonra diğer ekrana geçiş olacak.
        performSegue(withIdentifier: "Segue_Gec", sender: nil/*"Gönderilen Değer2"*/)
    }
    
    
    
    // Bu fonksiyon sayesinde başka ekrana veri transferi yapabiliyoruz.
    // Mesela VC_Red Controller Ekranında VC_White Controller Ekranına veri gönderebilliyoruz.
    // Segue kullanıldığında prepare methodu kullanılıyor.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Ekranlar arası birden fazla segue olabilir o yüzden identifier'larına göre kontrol etmekte fayda var.
        // Yani burda identifier "Segue_Gec" olduğu için yani VC_White ekranına geçişim olacağını biliyoruz.
        if segue.identifier == "Segue_Gec"{
            
            // VC_White view controllerına ulaşmış olduk.
            // VC_White içerisindeki oluşturduğumuız gelen adlı string tanımlamıza ulaştık.
            let vc_white = segue.destination as! VC_White
            vc_white.gelen = "Segue Yöntemi ile Gönderilen Mesaj" // VC_White Controller Ekranına Veriyi GÖnderdik.
            
            // BİR DİĞER YÖNTEM İSE;
            // performSegue'de tanımlı olan sender'a istenilen değeri, meyhodu verip te diğer ekrana veri gönderebiliriz.
            
            // vc_white.gelen = sender as! String
            
        }
    }
    
    // Burdaki ise bir başka Ekranlar Arası Geçiş ve Veri Taşıması yapılan yöntem.
    // Bu yöntemin adı İlgili ViewController'a Storyboard ID'si verilerek ekranlar arası geçiş ve veri transferi yapacaz.
    @IBAction func btnIdentifierGec(_ sender: Any) {
        
        // İlgili storyboardımızın adını yazdık.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Geçilecek Ekran veya verinin gönderileceği ekranın StoryboardID sini yazdık. Burda VC_White Controller'ı ile aynı ismi verdim.
        let vcWhite = storyboard.instantiateViewController(withIdentifier: "VC_White") as! VC_White
        
        // VC_Red Ekranından VC_White Ekranına hem geçiş yaptık hem de veri göndermiş olduk.
        vcWhite.gelen = "Identifier Yöntemi ile Gönderilen Mesaj"
        
        // Identifier kullanıldığında ise present methodu kullanılarak veri diğer ekrana gönderilebiliyor..
        present(vcWhite, animated: true, completion: nil)
    }
}


