//
//  ViewController.swift
//  Dailly_Challenge_BottomSheet
//
//  Created by Hertz on 9/18/22.
//

import UIKit
import PanModal

class ViewController: UIViewController {
    
    // MARK: - 전역변수
    var isPopUpClose = false
    
    
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
            doNotNeverSeePanModal()
        } else {
            view.isUserInteractionEnabled = false
        }
    }
    
    func doNotNeverSeePanModal() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bottomSheetVC = storyboard.instantiateViewController(withIdentifier: BottomSheetVC.identifier) as! BottomSheetVC
        if isPopUpClose == UserDefaults.standard.bool(forKey: "다시보지않기") {
            self.presentPanModal(bottomSheetVC)
        }
        view.isUserInteractionEnabled = false
    }
    
    
}

// MARK: - Date 익스텐션
extension Date {
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
}
