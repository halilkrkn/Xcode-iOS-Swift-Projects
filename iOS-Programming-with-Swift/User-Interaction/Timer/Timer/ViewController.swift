//
//  ViewController.swift
//  Timer
//
//  Created by halilkrkn on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // TIMER:
    // Timer nesnesi, bizim vermiş olduğumuz kural ve zaman ralıklarında istediğimiz işlevlerin başlatılmasını sağlar.
    // Tİmer'lar saniye cinsinden süre alırlar.
    
    var timer: Timer? // İnitializer istememesi içinde optinal yaptık.
    let timerSure = 2.5
    var calismaSayisi = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Timer oluşturduk.
        // 1. Versiyon
        timer = Timer.scheduledTimer(withTimeInterval: timerSure, repeats: true, block: zamanSonuTimer)
        
        // 2. Versiyon
//        timer = Timer.scheduledTimer(timeInterval: timerSure, target: self, selector: #selector(zamanSonuSelector), userInfo: nil, repeats: true)
    }
    
    func zamanSonuTimer(t: Timer){
        print("Zaman Sonu")
        
        calismaSayisi += 1
        
        if calismaSayisi == 3 {
            timer?.invalidate()
            print("Timer Sonlandırıldı.")
        }
        
    }
    
    // 2.Versiyon için objectiv-c formatlı bir fonksiyon yazdık. Sadece @objc getirerek objective-c formatına dönüştürdük.
    @objc func zamanSonuSelector(){

        print("Zaman Sonu")
        
        calismaSayisi += 1
        
        if calismaSayisi == 3 {
            timer?.invalidate()
            print("Timer Sonlandırıldı.")
        }
        
    }
}

