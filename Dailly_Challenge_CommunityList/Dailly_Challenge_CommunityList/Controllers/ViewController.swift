//
//  ViewController.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/25/22.
//

import UIKit

class ViewController: UIViewController {

    /// 네비게이션바 지정
    let customNavigationBar = CustomNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        customNavigationBar.isUseLeftButton = true
        customNavigationBar.isUserNavigationRightImageView = true
        customNavigationBar.isNavigationBarRightTextLabel = true
        customNavigationBar.isUserNavigationRightButton = true
    }
    
    fileprivate func setupNavigationBar() {
        self.view.addSubview(customNavigationBar)
        customNavigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(customNavigationBar.containerView)
        }
        
        self.customNavigationBar.backgroundColor = .red
        
        self.customNavigationBar.delegate = self
        /// 네비게이션바 타이틀 텍스트 지정
        customNavigationBar.titleText = "고객센터"
        /// 네비게이션바 높이 지정, 미지정시 60
        customNavigationBar.navigationHeight = 50
        /// 네비게이션 우측 텍스트 지정
        customNavigationBar.rightTitleText = "채팅"
    }
    

}

extension ViewController: CustomNavigationBarProtocol {
    func didTapRightButton() {
        print("👍🏻")
    }
    
    func didTapLeftButton() {
        print("⭐️")
    }
    
    
}
