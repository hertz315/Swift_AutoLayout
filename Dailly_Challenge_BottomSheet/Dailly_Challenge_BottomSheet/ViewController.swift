//
//  ViewController.swift
//  Dailly_Challenge_BottomSheet
//
//  Created by Hertz on 9/18/22.
//

import UIKit
import PanModal

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 모달 뷰 관련 함수를 이곳에 작성
        if view.isUserInteractionEnabled == true {
            setUpPanModal()
        } else {
            view.isUserInteractionEnabled = false
        }
        
    }
    
    
    func setUpPanModal() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bottomSheetVC = storyboard.instantiateViewController(withIdentifier: BottomSheetVC.identifier) as! BottomSheetVC
        self.presentPanModal(bottomSheetVC)
        view.isUserInteractionEnabled = false
    }
    
}


