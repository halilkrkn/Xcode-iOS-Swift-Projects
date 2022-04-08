////
//  AllListingLAB
//  Created by halilkrkn on 5.04.2022
//

import UIKit

class VC_Info: UIViewController {
    
    @IBOutlet weak var lblMakaleBaslik: UILabel!
    @IBOutlet weak var lblMakaleKisaAciklama: UILabel!
    
    
    var makaleBaslik: String?
    var makaleKisaAciklama: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblMakaleBaslik.text = makaleBaslik
        lblMakaleKisaAciklama.text = makaleKisaAciklama
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
