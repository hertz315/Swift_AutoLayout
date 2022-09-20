//
//  BottomSheetVC.swift
//  Dailly_Challenge_BottomSheet
//
//  Created by Hertz on 9/18/22.
//

import UIKit
import PanModal

class BottomSheetVC: UIViewController {
    
    static let identifier = "BottomSheetVC"
    
    // MARK: - 전역 변수
    let data: BottomSheetModel = BottomSheetModel(title: "🎉 빡코딩 레스토랑 200주년 이벤트 ",
                                                  image: UIImage(named: "bottomSheetImage")!,
                                                  leftButtonLabel: "never 보지 않기",
                                                  rightBattonLabel: "30시간 보지 않기")
    
    
    
    // MARK: - @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var neverSeeAgainButton: UIButton!
    @IBOutlet weak var doNotWatchFor24Hours: UIButton!
    
    
    // MARK: - viewDidLoad - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bottomSheetImageTapped()
        setUpMainImageAutoLayout()
        
    }
    
    func setUpMainImageAutoLayout() {
        self.mainImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeUI() {
        self.titleLabel.text = data.title
        // 서버에 이미지가 없다면 플레이스 홀더 이미지 띄우기
        if data.image == nil {
            self.mainImage.image = UIImage(systemName: "person")
            NSLayoutConstraint.activate([
                self.mainImage.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                self.mainImage.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                self.mainImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                self.mainImage.bottomAnchor.constraint(equalTo: neverSeeAgainButton.topAnchor, constant: -26),
                self.mainImage.heightAnchor.constraint(equalToConstant: 245)
            ])
            self.mainImage.contentMode = .scaleAspectFit
        } else {
            self.mainImage.image = data.image
        }
        self.neverSeeAgainButton.setTitle(data.leftButtonLabel, for: .normal)
        self.doNotWatchFor24Hours.setTitle(data.rightBattonLabel, for: .normal)
    }
    
    
    func bottomSheetImageTapped() {
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        mainImage.addGestureRecognizer(imageTapped)
        mainImage.isUserInteractionEnabled = true
    }
    
    // 이미지를 클릭하게되면 타게될 함수
    @objc func tapImage(sender: UITapGestureRecognizer) {
        print("⭐️")
        // 팝업창 닫기
        let webViewViewController = WebViewVC()
        webViewViewController.modalPresentationStyle = .pageSheet //or .overFullScreen for transparency
        self.present(webViewViewController, animated: true)
    }
    
    // MARK: - @IBAction
    @IBAction func neverSeeAgainButtonTapped(_ sender: UIButton) {
        
        // "다시보지않기" 버튼을 눌르면 불리언값 true로 저장
        UserDefaults.standard.set(true, forKey: "다시보지않기")
        dismiss(animated: true)
        
    }
    
    @IBAction func doNotWatchFor24HoursButtonTapped(_ sender: UIButton) {
        
        // 버튼을 눌르면 상태를 저장할 코드 설정 (UserDefaults)
        // 클릭하면 팝업이 닫힌다
        dismiss(animated: true)
    }
    
    
}


extension BottomSheetVC: PanModalPresentable {
    // 스크롤되는 tableview 나 collectionview 가 있다면 여기에 넣어주면 PanModal 이 모달과 스크롤 뷰 사이에서 팬 제스처를 원활하게 전환합니다.
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(UIScreen.main.bounds.height / 2)
    }
    
    var cornerRadius: CGFloat {
        return 15
    }
    
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(0)
    }
    
}

