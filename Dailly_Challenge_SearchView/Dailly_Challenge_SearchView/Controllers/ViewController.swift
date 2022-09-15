//
//  ViewController.swift
//  Dailly_Challenge_SearchView
//
//  Created by Hertz on 9/14/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: DesignableUITextField!
    
    @IBOutlet weak var searchTitle: UILabel!
    
    @IBOutlet weak var textFieldContainerView: UIView!
    
    @IBOutlet weak var recommendedLabel: UILabel!
    
    @IBOutlet weak var recommendedStackView: UIStackView!
    
    @IBOutlet weak var popularSearchTermsLabel: UILabel!
    
    
    // MARK: - 전역변수
    // 데이터를 관리하기위한 에러이
    var model: [PopularTerms] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 모델 데이터 셋업
        self.model = setUpData()
        // 테이블뷰 닙파일 등록
        let uiNib = UINib(nibName: TableViewCell.identifier, bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: TableViewCell.identifier)
        // 테이블 뷰 셋업
        setUpTableView()
        // 텍스트필드 셋업
        setUpTextField()
    }
    
    // MARK: - @IBAction
    @IBAction func recommendedkeywords(_ sender: UIButton) {
        // ⭐️키워드를 클릭하면 해당 키워드가 검색창에 입력됩니다 - 완료
        textField.text = sender.currentTitle
    }
    
    
    func setUpTextField() {
        // 텍스트 필드 델리게이트 채택
        textField.delegate = self
        // 텍스트 필드 text 색깔 설정
        textField.textColor = .black
    }
    
    func setUpData() -> [PopularTerms]  {
        let model = PopularTermsDataManager.makePopularTerms()
        return model
    }
    
    func setUpTableView() {
        // 테이블뷰 밑줄 라인 제거
        tableView.separatorStyle = .none
        
        // 테이블뷰 델리게이트 채택
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.allowsSelection = true
        
        
        
        // 쎌의 백그라운드 색깔 설정
        tableView.backgroundColor = UIColor.white
        
    }
    
//    // 쎌사이의 인셋 주기
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
//    }
    


}

// MARK: - 텍스트 필드 델리게이트
extension ViewController: UITextFieldDelegate {
    // 텍스트 필드 포커시시 한번만 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("⭐️ - 키보드 포커스 상태")
        // 1. 검색창 나머지 다른 요소 지우기?? 가리기 ?
        self.searchTitle.isHidden = true
        self.popularSearchTermsLabel.isHidden = true
        self.recommendedLabel.isHidden = true
        self.recommendedStackView.isHidden = true
        //    *
        // 2. 검색창 위로 올리기
        //    * 노티피케이션 센터 이용?
        
        
    }
    
}


// MARK: - 테이블뷰 데이터 소스
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setUpData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        // 쎌 선택시 색상 없애기
        cell.selectionStyle = .none
        
        cell.popularSearchTermLabel.text = setUpData()[indexPath.row].title
        cell.backgroundColor = UIColor.white
        
        // 쿵짝쿵짝
        return cell
    }
    
    
}

// MARK: - 테이블뷰 델리게이트
extension ViewController: UITableViewDelegate {
    // ⭐️ 인기 검색어를 클릭하면 검색창에 해당 검색어가 입력됩니다 - 완료
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 쎌 클릭시 선택된 데이터 가져오기
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.popularSearchTermLabel.text = model[indexPath.row].title
        self.textField.text = cell.popularSearchTermLabel.text
    }

}

//키보드 포커스가 되면 아래 추천 키워드와, 인기 검색어 부분이 사라집니다.
//위에 검색 타이틀도 사라지고 검색창은 위로 올라갑니다

// 생각 나누기
//1. 델리게이트 , 노티피케이션 같은걸로 키보드를 포커스 시킨다
//2. 키보드가 포커스 되면 검색창만 위로 올리고 검색창 외에 다른 배경은 흰색으로 바꾼다
