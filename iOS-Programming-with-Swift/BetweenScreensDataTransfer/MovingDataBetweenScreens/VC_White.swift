//
//  VC_White.swift
//  MovingDataBetweenScreens
//
//  Created by karkinh on 28.03.2022.
//

import UIKit

class VC_White: UIViewController {

    var gelen: String?
    @IBOutlet weak var lbl_Message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbl_Message.text = gelen
    }

}
