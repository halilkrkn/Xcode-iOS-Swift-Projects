//
//  ViewController.swift
//  AutoLayoutLAB
//
//  Created by karkinh on 30.03.2022.
//

import UIKit

class ViewControllerLogIn: UIViewController {
    
    // SENARYO:
    // Storyboard kullanılmadan ekranda kullanıcı adı ve şifre textfield'larının ve Giriş Yap butonunun bulunduğu login ekranının tasarlanması
    // Tasarımda giriş için kullanılan alan ekranın ortasına yakın olacaktır.
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // VİEW'LARI KODLAR YAZDIK
        
        // Kullanıcı Adi textfield'imizi oluşturduk.
        let tfKullaniciAdi = UITextField(frame:CGRect(x: 0, y: 0, width: 100, height: 100)) // Burdaki frameler constraintleri verene kadar veriyoruz. Sonrasında istenirse frameler constrainler yapıldıktan sonra kaldırılabilir.
        tfKullaniciAdi.placeholder = "Kullanıcı Adi"
        tfKullaniciAdi.backgroundColor = .white
        tfKullaniciAdi.borderStyle = .roundedRect
        tfKullaniciAdi.textColor = .black
        tfKullaniciAdi.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfKullaniciAdi)
        
        
        // Şifre textfield'imizi oluşturduk.
        let tfSifre = UITextField()
        tfSifre.placeholder = "Şifre"
        tfSifre.backgroundColor = .white
        tfSifre.borderStyle = .roundedRect
        tfSifre.textColor = .black
        tfSifre.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(tfSifre)
        
        // Giriş Yap butonunun view'ını oluşturduk.
        let btnGirisYap = UIButton()
        btnGirisYap.setTitle("Giriş Yap", for: .normal)
        btnGirisYap.backgroundColor = .blue
        btnGirisYap.titleLabel?.textColor = .black
        btnGirisYap.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(btnGirisYap)
        
        
        
        // CONSTRAINT'LERİ VERDİK.
        
        // Kullanıcı Adi TextField için constraint
        tfKullaniciAdi.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tfKullaniciAdi.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tfKullaniciAdi.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            tfKullaniciAdi.heightAnchor.constraint(equalToConstant: 50),
            tfKullaniciAdi.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
        
        
        // Şifre TextField için Constraint
        tfSifre.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tfSifre.topAnchor.constraint(equalTo: tfKullaniciAdi.bottomAnchor, constant: 10),
            tfSifre.leadingAnchor.constraint(equalTo: tfKullaniciAdi.leadingAnchor, constant: 0),
            tfSifre.trailingAnchor.constraint(equalTo: tfKullaniciAdi.trailingAnchor, constant: 0),
            tfSifre.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Giriş Yap Buttonu için Constraint
        btnGirisYap.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            btnGirisYap.topAnchor.constraint(equalTo: tfSifre.bottomAnchor, constant: 10),
            btnGirisYap.leadingAnchor.constraint(equalTo: tfSifre.leadingAnchor, constant: 0),
            btnGirisYap.trailingAnchor.constraint(equalTo: tfSifre.trailingAnchor, constant: 0),
            btnGirisYap.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }


}

