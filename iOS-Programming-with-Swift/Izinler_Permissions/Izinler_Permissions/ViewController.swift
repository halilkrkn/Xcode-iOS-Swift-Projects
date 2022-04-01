//
//  ViewController.swift
//  Izinler_Permissions
//
//  Created by karkinh on 1.04.2022.
//

/* PERMISSIONS - IZINLER
// Cihazın özelliklerini kullanmak ya da kullanıcının verilerine erişmek için kullanıcıdan izin almamız gerekir.

// Permissions(İzin) için Kullanılan Değerler:

// Takvim : Pravicy - Calendars Usage Description
// Adres Defteri : Pravicy - Contacts Usage Description
// Galeri : Pravicy - Photo Library Usage Description
// Bluetooth : Pravicy - Bluetooth Peripheral Usage Description
// Kamera : Pravicy - Camera Usage Description
// Konum : Pravicy - Location Always Usage Description
// Siri : Pravicy - Siri Usage Description

// Yukarıda belirtilmiş olan izinler Info.plist dosyası içerisine yazıldıktan sonra İzin Alma işlemi yapılacaktır.
// İzin Alma İçin:
// Kullanıcı Onayı
// Onayın sadece 1 kez çıkması
// İzin Kontrolü
// işlemleri yapılmalıdır.

// Örnek olarak Kamera izni alacağız ve kameranın nasıl kullanıldığını öğreneceğiz.
*/

import UIKit

// Kamerada çekilen fotoğrafı nasıl yakalabiliriz.
// Kameradan çekilen fotoğrafı yakalayabilmek için "UIImagePickerControllerDelegate"  ve "UINavigationControllerDelegate" portocol'ü kullanılır.
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func btnOpenCamera(_ sender: Any) {
        
        // İlk Önce cihazda bir kamera olup olmadığı kontrol edilmelidir.
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            // Kamerayı Açmak için UIImagePickerController'ı kullandık.
            let imagePicker = UIImagePickerController()
            // Burda kaynak tipi olarak kamerayı seçtik.
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            // present methodu ile gösterimini yapıyoruz.
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Resmi yakalayabilmek için
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        dismiss(animated: true, completion: nil)
    }
}

