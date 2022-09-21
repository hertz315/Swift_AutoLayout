//
//  ViewController.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class MainVC: UIViewController {
    

    
    // MARK: - 전역변수
    
    // MARK: - @IBOulet
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var followerCount: UILabel!
    
    @IBOutlet weak var userStatusMessage: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var averagyRatingLabel: UILabel!
    
    @IBOutlet weak var averagyRatingStarStackView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - 컨스트레이트
    
    
    // MARK: - viewDidLoad() - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    fileprivate func setupTableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
        
        // 커스텀 헤더 등록
        let uiNib = UINib(nibName: ReviewTVCH.identifier, bundle: nil)
        tableView.register(uiNib, forHeaderFooterViewReuseIdentifier: ReviewTVCH.identifier)
        
    }
    
    
    // MARK: - @IBAction


}

//// MARK: - UITableViewDataSource 델리게이트
//
//extension MainVC: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reviewDummyData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =
//    }
//
//
//}
//
//// MARK: - UITableViewDelegate 델리게이트
//extension MainVC: UITableViewDelegate {
//
//}
