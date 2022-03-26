//
//  ViewController.swift
//  AlertController
//
//  Created by karkinh on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {

    // Ekran açıldığında fonksiyonu
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        showAlert()
    }
    
    // Kullanıcıya gösterildikten sonra çalışan fonksiyon.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert()
    }
    
   
    func showAlert(){
        
        // Alert nesnesini kullanabilmemiz için bir alert controller oluşturulması gerekiyor.
        let alertController = UIAlertController(title: "Başlık", message: "Uyarı Mesajı", preferredStyle: UIAlertController.Style.actionSheet)
        
        
        // Alert Gösteriminin içerisinde Birden fazla farklı style'lerde butonlar oluşturulabilir..
        // Burda ise alerte tamam butonu sağlandı.
        alertController.addAction(UIAlertAction(title: "Tamam", style: .default){
            
            UIAlertAction in
            
            print("Tamam'a Basıldı.")
        
        })

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
            
            print("Cancel'e Basılldı.")
        })
        

        alertController.addAction(UIAlertAction(title: "Vazgeç", style: .destructive){
            UIAlertAction in
            
            print("Vazgeç'e Basılldı.")
        })
        
        // present fonksiyonu ile alert ümüzü gösteriyoruz.
        present(alertController, animated: true, completion: nil)
    }


}

