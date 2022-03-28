//
//  ViewController.swift
//  MovingDataBetweenScreensLAB
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VC_Login: UIViewController {

    /* SENARYO:
        - İLK EKRANDA AD, SOYAD, VE KOD ALINACAK VE İKİNCİ EKRANA GEÇİŞ İÇİN LOG IN BUTONU OLACAK. GİRİLEN KOD "123" İSE İKİNCİ EKRANA GİRİLEN AD SOYAD BİLGİLERİ GÖNDERİLECEK VE ÜST BARDA GÖSTERİLECEK.
     */
    
    
    
    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfKod: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnLogIn(_ sender: Any) {

        if tfKod.text == "123" {

            performSegue(withIdentifier: "segueLogIn", sender: nil)
            
        } else {
           alertController()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLogIn"{
            
            let vcInfo = segue.destination as! VC_Info
            vcInfo.adSoyad = "Segue ile " + tfAd.text! + " " + tfSoyad.text! + " gönderildi"
        }
    }
    @IBAction func btnIdentifierLogin(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcInfo = storyboard.instantiateViewController(withIdentifier: "VC_Info") as! VC_Info
        
        if tfKod.text == "123" {
            vcInfo.adSoyad = "Indentifier ile " + tfAd.text! + " " + tfSoyad.text! + " gönderildi"
            present(vcInfo, animated: true, completion: nil)
        } else {
            alertController()
        }
    }
    
    func alertController(){
        
        // Burda da ek olarak bir tanede hata mesajı oluşturduk.
        let alertController = UIAlertController(title: "Hata", message: "Kod'u Yanlış Girdiniz. Lütfen Tekrar Deneyiniz.", preferredStyle: .actionSheet)
        
        // Hata Mesajına buttton ekledik
        alertController.addAction(UIAlertAction(title: "Tamam", style: .destructive, handler: nil))
        
        // present fonksiyonu ile alertt'ümüzü gösteriyoruz.
        present(alertController, animated: true, completion: nil)
    }
}

