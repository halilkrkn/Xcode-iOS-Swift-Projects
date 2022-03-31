//
//  TBC_Main.swift
//  CustomTabbarController
//
//  Created by karkinh on 31.03.2022.
//

import UIKit

class TBC_Main: UITabBarController {

    @IBOutlet var tbvOzel: UIView!
    @IBOutlet weak var btnEkran1: UIButton!
    @IBOutlet weak var btnEkran2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(tbvOzel)
        
        tbvOzel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tbvOzel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 34),
            tbvOzel.heightAnchor.constraint(equalToConstant: 105),
            tbvOzel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tbvOzel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        
        ])
        
    }
    
    // Bottom Tabbardaki ekranlar arası geçişi sağlatmak için.
    @IBAction func tabDegistir(_ sender: Any) {
        
        // Burada degistir fonksiyonu içerisindeki ekranlar arası geçişi yapmak için herbir buton(Ekran1 ve Ekran2) için tag no'su tanımladık.
        // Burdaki tag numaraları ille ilgili sayfaya yönlendirme yaptık.
        let index = (sender as! UIButton).tag
        degistir(tabIndex: index)
        
        
        
    }
    
    // BottomTabbar da geçişi sağlayabilmek için tabbar'ı özelleştirdik ve switch ile sayffalar arası geçişde butonların durumunu gördükk.
    func degistir(tabIndex: Int) {
        
        btnEkran1.backgroundColor = .clear
        btnEkran2.backgroundColor = .clear
        
        switch tabIndex {
        case 0:
            btnEkran1.backgroundColor = .blue
        
        case 1:
            btnEkran2.backgroundColor = .blue
        default:
            btnEkran1.backgroundColor = .blue
        }
        
        selectedIndex = tabIndex
        
    }
}
