//
//  ViewController.swift
//  Izinler_PermissionsLAB
//
//  Created by halilkrkn on 1.04.2022.
//


// SENARYO:
// Kameradan çekilenm bir resmin ekranın arkaplanına eklenmesi
// Bu işlemler yapılırken gerekli izin kontrolleri de yapılacaktır.

import UIKit
import AVFoundation

// Çekilen resmi kullanabilmek için "UIImagePickerControllerDelegate, UINavigationControllerDelegate" implemente ediliyor.
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var ivBackground: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnOpenCamera(_ sender: Any) {
        cameraControl()
    }
    
    
    // Bu fonksiyonu yazdığımızda çekilen resmi alabiliyoruz.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        // çekilen resmi image'ye atadık ve ivBackground'un imagesine atadık.
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // Çekilen imageyi ivBackground'a atadık.
        ivBackground.image = image
        dismiss(animated: true, completion: nil) // Kameranın kapanmasını sağladık.
    }
    
    
    // Kamera Kontrollerinin olduğu method.
    // Kontrolleri yapabilmek için "AVFoundation" kütüphanesi çağırıyoruz ve bu şekilde izin kontrollerini yapabileceğiz.
    func cameraControl(){
        
        // Burdaki video ile kameranın erişim iznini kontrol edebiliriz.
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        // Kameranın belirlenmediği-belirsizlik olduğu durumlarda
        case .notDetermined:
            openCamera()
        // Kameranın Sınırlı(kısıtlı) durum
        case .restricted:
            showAlert()
        // Kameranın rededilmiş olduğu durum
        case .denied:
            showAlert()
        // Kameranın uygulamaya izin verildiği durum. Yani burda kameraya erişim sağlanmış olur.
        case .authorized:
            // Kamera açma işlemi
            openCamera()
        default:
            showAlert()
        }
    }
    
    // kullanıcıyı bilgilendirmek için bir uyarı mesaj'ı oluşturduk.
    func showAlert(){
        
        let title = "Kameraya Erişilemiyor."
        let message = "Erişim sağlamak için ayarlardan kamera erişimini açmalısınız"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Ayarlar", style: .default, handler: openSettings))
        present(alert, animated: true, completion: nil)
    }
    
    // Uyarı Mesajı içerisindeki butonlar içerisinde Ayarlar butonu ile doğrudan ilgili uygulamanın ayarlarına gitmesini için
    func openSettings(alert: UIAlertAction){
        
        // guard Yapısı: Guard yapıları if yapılarına çok benzer. Aynı if yapılarındaki gibi ardından gelen bir ifade(koşul) bulunur.
        // Ve o koşula göre true veya false değeri döner ve dönen ifadeye göre işlem yapılır.
        // Ayrıldıkları noktalardan biri ise guard hatayı başta yakalar
        
        // Burada uygulamaının ayarları kısmına erişiyoruz.
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {return}
        
        
        // Uygulamanın ayarlar kısmında açılıp/açılmadığını kontrol ediyoruz.
        if UIApplication.shared.canOpenURL(settingsUrl){
            
            // iOS 10 ve öncesinde farklı açılıyorken iOS 10'dan sonra bu URL açma sistemi değişti.
            // Url açma sistemi için versiyon kontrolü yapıyoruz.
            if #available(iOS 10.0, *){
                // iOS 10'dan sonrası için
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            }else {
                // iOS 10'dan öncesi için
                UIApplication.shared.openURL(settingsUrl)
            }
            
        }
        
        
    }
    
    // Kamera açma işlemi
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
        
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.cameraDevice = .front
            imagePicker.cameraFlashMode = .off
            present(imagePicker, animated: true, completion:nil)
        }
    }
}

