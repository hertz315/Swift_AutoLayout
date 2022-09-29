//
//  KategoriesHeader.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/27/22.
//

import UIKit
import SnapKit

class MainKategoriesHeader: UICollectionReusableView {
    
    
    static let reuseIdentifier = "MainKategoriesHeader"
    let customTextField = CustomTextField()
    let customNavigationBar = CustomNavigationBar()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        setupTextField()
//        setupNavigationBar()
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID, #function, #line, "- <#comment#>")
//        setupNavigationBar()
//        setupTextField()
        self.backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- ")
        
//        setupNavigationBar()
        setupTextField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#fileID, #function, #line, "- <#comment#>")
        
    }
    
    fileprivate func setupNavigationBar() {
        
        self.addSubview(customNavigationBar)
        
        customNavigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
            make.bottom.equalTo(customNavigationBar.containerView)
        }
        
        self.customNavigationBar.backgroundColor = .blue
        /// 네비게이션바 타이틀 텍스트 지정
        customNavigationBar.titleText = "고객센터"
        /// 네비게이션바 높이 지정, 미지정시 60
        customNavigationBar.navigationHeight = 50
        /// 네비게이션 우측 텍스트 지정
        customNavigationBar.rightTitleText = "채팅"
        /// 네비게이션 알림 텍스트
        customNavigationBar.noticeText = "2"
        /// 네비게이션바 왼쪽에 버튼을 넣을것인지
        customNavigationBar.isUseLeftButton = false
        /// 네비게이션바 오른쪽에이미지를 넣을것인지
        customNavigationBar.isUserNavigationRightImageView = true
        /// 네비게이션바오른쪽에 텍스트를 넣을것인지
        customNavigationBar.isNavigationBarRightTextLabel = true
        /// 네비게이션바오른쪽에 버튼을 넣을것인지
        customNavigationBar.isUserNavigationRightButton = true
        /// 네비게이션바에 알림을 넣을것인지
        customNavigationBar.isNoticeCountMode = true
    }
    
    fileprivate func setupTextField() {
        self.addSubview(customTextField)
        customTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
        /// 커스텀텍스트필드를 기본모든 사용모드로 할것인지
        self.customTextField.isUseDefaultTextField = true
        /// 커스텀텍스트필드의 높이를 지정
        self.customTextField.textFieldHeight = 44
    }
    
}



