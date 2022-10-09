//
//  ViewController.swift
//  CustomButton
//
//  Created by Hertz on 10/6/22.
//

import UIKit
import SnapKit
import Then

@available(iOS 15.0, *)
class ViewController: UIViewController {

    lazy var scrollView: UIScrollView = UIScrollView().then{
        // 사용자 터치
        $0.isUserInteractionEnabled = true
        //
        $0.alwaysBounceVertical = true
        $0.alwaysBounceHorizontal = false
        //
        $0.translatesAutoresizingMaskIntoConstraints = false
        //
        $0.addSubview(containerView)
    }
    
    lazy var buttonStackView: UIStackView = UIStackView().then{
        $0.spacing = 10
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var containerView: UIView = UIView().then{
        $0.backgroundColor = .systemYellow
        $0.addSubview(buttonStackView)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - 뷰디드로드 입니다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemGray
        setupUI()
        
    }
    
    /// UI설정 관련
    fileprivate func setupUI() {
        /// 위치 잡기
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        /// ⭐️중요⭐️
        containerView.snp.makeConstraints {
            // ⭐️중요⭐️
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
            // ⭐️중요⭐️
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(30)
        }
        
        let icon = UIImage(systemName: "person")
       
        /// 더미 버튼 만들기
        let dummyButtons: [UIButton] = Array(1...20).map { index in
            LoadingButton(title: "아이콘 번호\(index)", icon: icon)
        }
        
        dummyButtons.forEach {
            buttonStackView.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(onButtonTapped(_:)), for: .touchUpInside)
        }
    }


}

// MARK: - 액션관련
@available(iOS 15.0, *)
extension ViewController {
    /// 버튼 클릭시 호출되는 함수
    @objc fileprivate func onButtonTapped(_ sender: LoadingButton) {
        
        sender.loadingState = sender.loadingState == .loading ? .normal : .loading
        
    }
}



#if DEBUG

import SwiftUI

@available(iOS 15.0, *)
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getPreview()
            .ignoresSafeArea()
    }
}

#endif
