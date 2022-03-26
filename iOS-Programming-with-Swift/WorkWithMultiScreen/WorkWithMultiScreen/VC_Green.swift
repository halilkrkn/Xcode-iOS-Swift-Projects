//
//  VC_Green.swift
//  WorkWithMultiScreen
//
//  Created by halilkrkn on 26.03.2022.
//

import UIKit

class VC_Green: UIViewController {

    
    @IBOutlet weak var lblGreen: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Ikinci Did Load")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Ikinci Did Appear")
    }
    

    @IBAction func btnBackScreen(_ sender: Any) {
        
        // İlk Ekrana Tekrardan geri dönüş için dismiss fonksiyonu kullanıldı.
        dismiss(animated: true, completion: nil)
    }

}
