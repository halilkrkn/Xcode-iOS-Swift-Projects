//
//  ViewController.swift
//  NavigationController
//
//  Created by halilkrknon 28.03.2022.
//

import UIKit

class NavigationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        navigationController?.setNavigationBarHidden(true, animated: false)

    }

    @IBAction func btnKodlaGec(_ sender: Any) {
        performSegue(withIdentifier: "KodlaGec", sender: nil)
    }
    
    
}

