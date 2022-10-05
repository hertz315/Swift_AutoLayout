//
//  CollectionViewHeader.swift
//  Dailly_Challenge_DetailSearchResult
//
//  Created by Hertz on 10/3/22.
//

import UIKit
import SnapKit
///
protocol ProductSortDelegate {
    func sortPickerView()
}
protocol LabelChangeDelegate {
    func chageLabel()
}

class CollectionViewHeader: UICollectionReusableView {
    
    // 버튼을 눌르면 터트려줄 클로저 생성
    var onDropDwonButtonTapped: (()->Void)?
    
    // 델리게이트 선언
    var delegate: ProductSortDelegate?
    var labelDelegate: LabelChangeDelegate?
    
//    let mainVC = DetailSearchResultVC()
    
    /// 전역변수
    static let nibName = "CollectionViewHeader"
    static let reuseIdentifier = "CollectionViewHeader"
    
    // MARK: - @IBOulet
    @IBOutlet weak var productSortLabel: UILabel!
    @IBOutlet weak var totalProductCoutLabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    // MARK: - @IBAction
    @IBAction func dropDownButtonTapped(_ sender: UIButton) {
        // 버튼을 누르면 피커뷰를 띄워야 함
        onDropDwonButtonTapped?()
        delegate?.sortPickerView()
        layoutIfNeeded()
    }
    
  
}

