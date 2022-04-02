//
//  VC_Green.swift
//  ChangingScreenswithIdentifier
//
//  Created by karkinh on 26.03.2022.
//

import UIKit

class VC_Green: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackScreen(_ sender: Any) {
        // Dismiss fonksiyonu ile bir önceki ekrana geri döndük.
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
