////
//  Custom_Cell_Xib_LAB
//  Created by halilkrkn on 3.04.2022
//

import UIKit

class TVC_Kisi: UITableViewCell {

    @IBOutlet weak var ivCinsiyet: UIImageView!
    @IBOutlet weak var lblAdSoyad: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
