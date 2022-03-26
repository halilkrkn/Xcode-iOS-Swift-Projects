//
//  ViewController.swift
//  OutletAndAction
//
//  Created by karkinh on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {

    // Senaryo: Ekranın açılış zamanı ve ekranda bulunan butona tıklanma zamanının ekranda gösterilmesi senaryosudur.
    
    
    @IBOutlet weak var lblEkranZamani: UILabel!
    @IBOutlet weak var lblTiklanmaZamani: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Ekran kullanıcıya tam gösterilmeye başlandığın zamanı almasın için gerek yaşam döngüsü(lifecycle) fonksiyonu
    override func viewWillAppear(_ animated: Bool) {
        let ekranAcilisZamani = zamanGetir()
        lblEkranZamani.text = ekranAcilisZamani
    }

    // Butona tıkladığımızda alınan zaman için gereken action
    @IBAction func btnTikla(_ sender: Any) {
        lblTiklanmaZamani.text = zamanGetir()
    }
    
    
    // Cihaz içerisindeki zamanı alabilmemiz için yazılan bir fonksiyon.
    func zamanGetir() -> String {
        
        var time = Date()
        let dateFormatter = DateFormatter() // Zamanın nasıl gözükmesini ayalarmak için bu Sınıfı kullandık.
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        
        return dateFormatter.string(from: time)
    }
    
}

