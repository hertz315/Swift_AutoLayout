//
//  PopUpViewController.swift
//  Dailly_Challenge_PopUp
//
//  Created by Hertz on 9/13/22.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    
    @IBOutlet weak var neverShowButton: UIButton!
    
    @IBOutlet weak var closeButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
        neverShowButton.isSelected = UserDefaults.standard.bool(forKey: "neverShow")
        
        // 팝업창 닫기
        
        print(neverShowButton.isSelected)
        if neverShowButton.isSelected == true {
            self.dismiss(animated: true)
        }
       
    }
    
    func makeUI() {
        // 자세히 보기 버튼
        detailButton.clipsToBounds = true
        detailButton.layer.cornerRadius = 40
        
        // 다시 보지 않기, 닫기 버튼
        neverShowButton.layer.borderWidth = 1
        neverShowButton.layer.borderColor = UIColor.init(red: 217, green: 217, blue: 217, alpha: 1).cgColor
        
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.init(red: 217, green: 217, blue: 217, alpha: 1).cgColor

    }
    
    
    @IBAction func backgroundButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func detailButtonTapped(_ sender: UIButton) {
        print("자세히 보기 버튼 Tapped")
        // 화면을 띄울 뷰컨트롤러 가져오기
        guard let webKitVC = self.storyboard?.instantiateViewController(withIdentifier: "WebKitVC") as? WebKitViewController else {return}
        
        // 뷰컨트롤러가 보여지는 스타일(팝업 효과 설정)
        webKitVC.modalPresentationStyle = .currentContext
        // 뷰컨트롤러가 사라지는 스타일
        webKitVC.modalTransitionStyle = .crossDissolve
        
        // 화면 띄우기
        self.present(webKitVC, animated: true)
        
        // 웹뷰 띄울 url 설정
        let channelUrl = URL(string: "https://www.youtube.com/c/%EA%B0%9C%EB%B0%9C%ED%95%98%EB%8A%94%EC%A0%95%EB%8C%80%EB%A6%AC")
        // 웹뷰 띄우기
        webKitVC.webVIew.load(URLRequest(url: channelUrl!))

        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        // 팝업 닫기 - 완료
        print("닫기 버튼 Tapped")
        dismiss(animated: true)
    }
    
    @IBAction func neverShowButtonTapped(_ sender: UIButton) {
        // 다시보지 않기 클릭시 앱을 다시 껐다 켰을때 팝업창 열리지 않음
        print("다시보지않기 버튼 Tapped")
        // 팝업창 데이터 저장
        if sender.isSelected == true {
            print("⭐️")
        } else {
            print("🍎")
        }
        // 데이터 저장
        UserDefaults.standard.set(sender.isSelected, forKey: "neverShow")
        // 팝업창 닫기
    }
    

}
