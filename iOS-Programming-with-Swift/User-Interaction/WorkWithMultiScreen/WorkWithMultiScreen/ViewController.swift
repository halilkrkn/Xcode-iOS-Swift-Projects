//
//  ViewController.swift
//  WorkWithMultiScreen
//
//  Created by halilkrkn on 26.03.2022.
//

import UIKit

class VC_Blue: UIViewController {

    // ilk yüklenen fonksiyon daha kullanıcıya gösterilmedi.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("İlk Did Load")
        // Do any additional setup after loading the view.
    }
    
    // Kullanıcıya Gösterilen fonk
    override func viewDidAppear(_ animated: Bool) {
        print("Ilk Did Apppear")
    }

    // İkinci Ekran gösterilince İlk Ekran arkada kaldığı için kullanıcının önünden bu ilk sayfa kaldırılmış oldu.
    override func viewDidDisappear(_ animated: Bool) {
        print("Ilk Did Disappear")
    }

}

