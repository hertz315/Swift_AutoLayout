//
//  LodingButton.swift
//  CustomButton
//
//  Created by Hertz on 10/9/22.
//

import Foundation
import UIKit

class LoadingButton: UIButton {
    /// 아이콘 정렬 상태 관련
    enum IconAlignment {
        case leading
        case trailing
    }
    /// 로딩상태 관련
    enum LoadingState {
        case loading
        case normal
    }
    

    /// 멤버 변수
    var indicator: UIActivityIndicatorView?
    
    var iconAlignment: IconAlignment = .leading
    
    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    var loadingState: LoadingState = .normal {
        didSet {
            DispatchQueue.main.async {
                switch self.loadingState {
                case .normal: self.hideLoading()
                case .loading: self.showLoding()
                }
            }
        }
    }
    
    /// 객체가 메모리 공간에 올라가면 해당 생성자가 호출된다
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID, #function, #line, "⭐️frame")
    }
    /// 코드로 레이아웃을 짤 경우
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - 생성자
    convenience init(
        iconAlign: IconAlignment = .leading,
        title: String = "타이틀 없음",
        font: UIFont = UIFont.Font(.medium, size: 17),
        bgColor: UIColor = .black,
        tintColor: UIColor = .white,
        cornerRadius: CGFloat = 8,
        icon: UIImage? = nil,
        padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
    ){
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        self.tintColor = tintColor
        self.layer.cornerRadius = cornerRadius
        self.setImage(icon, for: .normal)
        self.padding = padding
        self.iconAlignment = iconAlign
        self.titleLabel?.font = font
        
    }
    
    /// 메모리에 올라간 녀석들이 레이아웃 위치를 잡을때 호출된다
    /// 생성자가 생성되고 나서 레이아웃 위치를 잡을때 호출된다
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#fileID, #function, #line, "⭐️layoutSubviews")
        
        switch iconAlignment {
        case .leading:
            /// 왼쪽 정렬
            alignIconLeading()
        case .trailing:
            /// 오른쪽 정렬
            alignIconTrailing()
        }
    }
    
}

// MARK: - 아이콘 정렬 관련
extension LoadingButton {
    /// 아이콘 왼쪽 정렬
    fileprivate func alignIconLeading() {
        contentHorizontalAlignment = .left
        let imageWidth = imageView?.frame.width ?? 0
        let availableSpace = bounds.inset(by: contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        
        let leftPadding = (availableWidth / 2) - (imageWidth / 2)
        
        /// 타이틀 관련 패딩
        titleEdgeInsets = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        /// 전체적인 패딩
        contentEdgeInsets = padding
    }
    
    /// 아이콘 오른쪽 정렬
    fileprivate func alignIconTrailing() {
        semanticContentAttribute = .forceRightToLeft
        contentHorizontalAlignment = .right
        let imageWidth = imageView?.frame.width ?? 0
        let availableSpace = bounds.inset(by: contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.left - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        let rightPadding = (availableWidth / 2) - (imageWidth / 2)
        
        /// 타이틀 관련 패딩
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightPadding)
        /// 전체적인 패딩
        contentEdgeInsets = padding
    }
}

// MARK: - 로딩 관련
extension LoadingButton {
    
    /// 로딩 숨기기
    fileprivate func hideLoading() {
        UIView.transition(with: self, duration: 0.2, options: .curveEaseIn) {
            // 로딩중이 아닐땐 타이틀을 불투명하게 처리
            self.titleLabel?.alpha = 1
            // 로딩중이 아닐때 버튼 이미지를 불투명하게처리
            self.imageView?.alpha = 1
            self.indicator?.alpha = 0
        }
        
    
    }
    
    /// 로딩 보여주기
    fileprivate func showLoding() {
       
        // 인디케이터 위치 크기 잡기
        if indicator == nil {
            let myIndicator = UIActivityIndicatorView(style: .medium).then {
                $0.color = .white
                $0.startAnimating()
            }
            self.addSubview(myIndicator)
            myIndicator.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            self.indicator = myIndicator
        }
        
        self.titleLabel?.alpha = 0
        self.imageView?.alpha = 0
        
        UIView.transition(with: self, duration: 0.2, options: .curveEaseOut) {
            self.titleLabel?.alpha = 0
            self.imageView?.alpha = 0
            self.indicator?.alpha = 1
        }
        
    }
}
