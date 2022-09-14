//
//  ViewController.swift
//  Dailly_Challenge_PopUp
//
//  Created by Hertz on 9/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        showPopUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showPopUp() {
        guard let popUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as? PopUpViewController else {return}
        
        popUpVC.modalTransitionStyle = .crossDissolve
        present(popUpVC, animated: true)
                                                               
    }
    
    
}

