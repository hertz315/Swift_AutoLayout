//
//  CustomViewTest.swift
//  CustomButton
//
//  Created by Hertz on 10/7/22.
//

import Foundation
import UIKit
import SnapKit
import Then

class CustomViewTest: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// UI관련
    fileprivate func setupUI() {
        self.backgroundColor = .blue
        let icon = UIImage(systemName: "person")
       
     
        /// 버튼 만들기
        let button = LoadingButton(title: "아이콘 번호", icon: icon)
        
        self.addSubview(button)
        
        // 버튼의 위치잡기
        button.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(10)
        }
    }
    
}



#if DEBUG
import SwiftUI

struct CustomViewTest_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewTest()
            .getPreview()
            .frame(width: 250, height: 200)
            .previewLayout(.sizeThatFits)
    }
}
#endif
