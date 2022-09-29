//
//  HorizentalKategoriesCVCCollectionViewCell.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/28/22.
//

import UIKit

class HorizentalKategoriesCVC: UICollectionViewCell {
    
    static let nibName = "HorizentalKategoriesCVC"
    static let reuseIdentifier = "HorizentalKategoriesCVC"
    
    @IBOutlet weak var kategoriesTitleLabel: UILabel!
    @IBOutlet weak var kategoriesBodyLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var chatCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
