//
//  CollectionViewCell.swift
//  Weekly_Challenge_Onboarding_Splash
//
//  Created by Hertz on 9/14/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = String("CollectionViewCell")
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    @IBOutlet weak var slideImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(_ slide: OnboardingSlide) {
        slideImage.image = slide.image
        mainTitleLabel.text = slide.mainTitle
        subTitleLabel.text = slide.subTitle
    }

}
