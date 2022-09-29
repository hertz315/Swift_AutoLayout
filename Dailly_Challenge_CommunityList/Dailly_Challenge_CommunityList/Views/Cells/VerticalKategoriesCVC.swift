//
//  VerticalKategoriesCVC.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/28/22.
//

import UIKit

class VerticalKategoriesCVC: UICollectionViewCell {
    
    static let reuseIdentifier = "VerticalKategoriesCVC"
    static let nibName = "VerticalKategoriesCVC"
    
    @IBOutlet weak var kategoriesTitleLabel: UILabel!
    @IBOutlet weak var kategoriesBodyTitleLabel: UILabel!
    @IBOutlet weak var kategoriesBodyLabel: UILabel!
    @IBOutlet weak var kategoriesBodyImage: UIImageView!
    @IBOutlet weak var kategoriesTagLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatCountLabel: UILabel!
    @IBOutlet weak var timeDifferenceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
}
