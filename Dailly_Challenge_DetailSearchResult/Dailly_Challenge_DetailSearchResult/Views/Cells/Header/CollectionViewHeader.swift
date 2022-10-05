//
//  CollectionViewHeader.swift
//  Dailly_Challenge_DetailSearchResult
//
//  Created by Hertz on 10/3/22.
//

import UIKit

class CollectionViewHeader: UICollectionReusableView {
    /// 전역변수
    static let nibName = "CollectionViewHeader"
    static let reuseIdentifier = "CollectionViewHeader"
    
    // MARK: - DropDown
    @IBOutlet weak var totalProductCoutLabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    
}
