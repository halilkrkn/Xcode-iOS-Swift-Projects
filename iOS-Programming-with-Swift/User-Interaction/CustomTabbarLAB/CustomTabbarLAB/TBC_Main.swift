//
//  TBC_Main.swift
//  CustomTabbarLAB
//
//  Created by karkinh on 31.03.2022.
//

import UIKit

class TBC_Main: UITabBarController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var ivApple: UIImageView!
    @IBOutlet weak var ivBrave: UIImageView!
    @IBOutlet var tbvAnaView: UIView!
    
    let seciliRenk = UIColor(named: "SeciliRenk")
    let seciliApple = UIColor(named: "SeciliOlmayanApple")
    let seciliBrave = UIColor(named: "SeciliOlmayanBrave")
    
    
    let appleSecili = UIImage(named: "AppleSecili")
    let appleSeciliOlmayan = UIImage(named: "AppleSeciliOlmayan")
    
    let braveSecili = UIImage(named: "BraveSecili")
    let braveSeciliOlmayan = UIImage(named: "BraveSeciliOlmayan")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tbvAnaView)
        
        tbvAnaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tbvAnaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 44),
            tbvAnaView.heightAnchor.constraint(equalToConstant: 84),
            tbvAnaView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tbvAnaView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        
        ])
        
        // Standartta bulunan tabbarın görselini gizlemek için;
        tabBar.isHidden = true
        
        // Başlangıçta istenilen tabbarı gösteriyoruz.
        tabDegistir(tabIndex: 1)
        
    }

    // Butonua tıklattıkça ekranlar değişiyor.
    @IBAction func btnTabDegistir(_ sender: Any) {
        
        let tabDegistirr = (sender as! UIButton).tag
        tabDegistir(tabIndex: tabDegistirr)
    }
    
    
    // Tabbarı özelleştirdik ve ilgili tabbara göre sayfa yönlendirdik.
    func tabDegistir(tabIndex: Int) {
        
        view1.backgroundColor = seciliRenk
        view2.backgroundColor = seciliRenk
        
        ivApple.image = appleSecili
        ivBrave.image = braveSecili
        
        switch tabIndex {
        case 0:
            view1.backgroundColor = seciliApple
            ivApple.image = appleSeciliOlmayan
            
        case 1:
            view2.backgroundColor = seciliBrave
            ivBrave.image = braveSeciliOlmayan
        default:
            view1.backgroundColor = seciliRenk
        }
        
        selectedIndex = tabIndex
    }
}
