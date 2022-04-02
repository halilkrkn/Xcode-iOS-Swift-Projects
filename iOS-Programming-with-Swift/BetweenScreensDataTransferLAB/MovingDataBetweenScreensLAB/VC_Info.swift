//
//  VC_Info.swift
//  MovingDataBetweenScreensLAB
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VC_Info: UIViewController {

    var adSoyad: String?
    @IBOutlet weak var lblAdSoyad: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblAdSoyad.text = adSoyad
        // Do any additional setup after loading the view.
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
