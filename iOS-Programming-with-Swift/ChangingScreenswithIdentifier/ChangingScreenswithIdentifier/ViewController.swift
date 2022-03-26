//
//  ViewController.swift
//  ChangingScreenswithIdentifier
//
//  Created by karkinh on 26.03.2022.
//

import UIKit

class VC_Orange: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // Normal View'lar arası geçişi seque ile yaptık
    @IBAction func btnSequeGec(_ sender: Any) {
        performSegue(withIdentifier: "sqGec", sender: nil)
    }
    
    
    // Aynı viewlar arasındaki geçişi ise indetifier ile yaptık.
    // Yani burda ekranın identifier'ı ile geçiş yaptık.
    @IBAction func btnIdentifierGec(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "VC_Green")
        
        present(viewController, animated: true, completion: nil)
        
    }
}

