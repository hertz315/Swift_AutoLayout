//
//  ReviewTVC.swift
//  Dailly_Challenge_reviewList
//
//  Created by Hertz on 9/21/22.
//

import UIKit

class ReviewTVC: UITableViewCell {

    
    
    @IBOutlet weak var storeName: UILabel!
    
    
    @IBOutlet weak var storeDetailName: UILabel!
    
    @IBOutlet weak var ratingImage: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var reivewWriteDate: UILabel!
    
    @IBOutlet weak var reviewTitle: UILabel!
    
    @IBOutlet weak var reviewBody: UILabel!
    
    @IBOutlet weak var seeMoreButton: UIButton!
    
    @IBOutlet weak var likeImage: UIImageView!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var chatImage: UIImageView!
    
    @IBOutlet weak var chatCountLabel: UILabel!
    
    @IBOutlet weak var reportReviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
