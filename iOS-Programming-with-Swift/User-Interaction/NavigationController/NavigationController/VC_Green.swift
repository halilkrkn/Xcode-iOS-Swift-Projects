//
//  VC_Green.swift
//  NavigationController
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VC_Green: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // toolbar'ı gizledik. Ama yazmış ollduğumuz NavigationController tüm Ekranların Hepsinde toolbarı gizli olarak kulanır.
        // Burda geri tuşuda gitti yani kadırırsak bbir önceki sayfaya geri dönemiyoruz.
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Manuel olarak geri butonu kendimiz geri gidebiliriz.
    @IBAction func btnGeri(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    // Eğer sadece İlgili ekranın toolbarını Gizlemek istiyorsak
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
