//
//  OnboardingViewController.swift
//  Weekly_Challenge_Onboarding_Splash
//
//  Created by Hertz on 9/14/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionView Cell xib 등록
        let uiNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        // 델리게이트 등록
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        slides = [
            OnboardingSlide(subTitle: "Welcome to PpakCoding", mainTitle: "Managing your\ncoding has never\nbeen so easy.", image: #imageLiteral(resourceName: "Illustration 1")),
            OnboardingSlide(subTitle: "Welcome to PpakCoding", mainTitle: "Spend smarter\nevery day, all\nfrom one app.", image: #imageLiteral(resourceName: "Illustration 3")),
            OnboardingSlide(subTitle: "Welcome to PpakCoding", mainTitle: "Safe and secure\ninternational ppck\ncoding deep dive", image: #imageLiteral(resourceName: "Illustration 5"))
        ]
    }
    
    // ⭐️ 페이지 컨트롤러 눌르면 스크롤화면이동
    @IBAction func pageControllerTapped(_ sender: UIPageControl) {
    
        print(#function, "\(currentPage)")
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate {
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        <#code#>
    }
}
