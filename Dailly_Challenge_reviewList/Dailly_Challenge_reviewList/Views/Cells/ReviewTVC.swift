//
//  ReviewTVC.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class ReviewTVC: UITableViewCell {
    
  

    
    // MARK: - @IBOulet
    @IBOutlet weak var storeName: UILabel!
    
    @IBOutlet weak var userUploadImage: UIImageView!
    
    @IBOutlet weak var storeDetailName: UILabel!
    
    @IBOutlet weak var ratingImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var reivewWriteDate: UILabel!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
    @IBOutlet weak var reviewBody: UILabel!
    
    @IBOutlet weak var seeMoreButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeTappedCount: UILabel!
    
    @IBOutlet weak var chatButton: UIButton!
    
    @IBOutlet weak var chatTappedCount: UILabel!
    
    @IBOutlet weak var reportReviewButton: UIButton!
    
    // MARK: - seeMoreHieghtConstraint
    
    @IBOutlet weak var seeMoreButtonHeight: NSLayoutConstraint!
    
    
    // MARK: - awakeFromNib-LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
