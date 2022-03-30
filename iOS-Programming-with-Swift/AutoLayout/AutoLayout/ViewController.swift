//
//  ViewController.swift
//  AutoLayout
//
//  Created by karkinh on 30.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var vCenter: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
        
        
        // AutoLayout bir kod yazmak istiyorsak Constraintler viewController'da aktif edilmelidir.
        // İki farklı constrainleri aktif etme yöntemi var.
        
        // vHeader ve vCenter üzerinde yapmış olduğumuz constraintleri uygulayabilmek için
        vHeader.translatesAutoresizingMaskIntoConstraints = false
//        vCenter.translatesAutoresizingMaskIntoConstraints = false
        
        // 1. Constraintleri Aktif Etme 1.Yol
        NSLayoutConstraint.activate([
         
            // BU alana constainleri teker teker vereceğiz.
            // vHeader'ın Top'a olan mesafesini verdik.
            vHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            vHeader.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 0),
            vHeader.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 0),
            vHeader.heightAnchor.constraint(equalToConstant: 100),
            
            // Aşağıdaki 2. yol ile aynı işlemleri yapıyor sadece constrainttleri aktif etme yönteminin farklı bir yolu.
//            vCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            vCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            vCenter.heightAnchor.constraint(equalToConstant: 120),
//            vCenter.widthAnchor.constraint(equalTo: view.widthAnchor)
            
            
        ])
        
        // 2. Constraintleri Aktif Etme 2.Yol
        // vCenter üzerinde yapmış olduğumuz constraintleri uygulayabilmek için
        vCenter.translatesAutoresizingMaskIntoConstraints = false
        vCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vCenter.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        vCenter.heightAnchor.constraint(equalToConstant: 120).isActive = true
        vCenter.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

    }


}

