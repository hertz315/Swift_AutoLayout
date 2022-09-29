//
//  KategorieCVC.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/26/22.
//

import UIKit

class MainKategoriesCVC: UICollectionViewCell {
    
    static let reuseIdentifier = "MainKategoriesCVC"
    static let nibName = "MainKategoriesCVC"
    
    
    @IBOutlet weak var kategorieImageView: UIImageView!
    @IBOutlet weak var kategorieLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
