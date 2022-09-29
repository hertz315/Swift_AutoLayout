//
//  ViewController.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/25/22.
//

import UIKit
import SnapKit

final class CustomerCenterVC: UIViewController {
    
    // MARK: - 전역변수
    // 쎌에 뿌려줄 데이터 배열
    var customerCenterSectionsDataArray = [CustomerCenterSectionModel]()
    
    // MARK: - 네비게이션 바 생성
    // 네비게이션바 생성
    lazy var customNavigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.titleText = "고객센터"
        /// 네비게이션바 타이틀 텍스트 지정
        navigationBar.titleText = "고객센터"
        /// 네비게이션바 높이 지정, 미지정시 60
        navigationBar.navigationHeight = 50
        /// 네비게이션 우측 텍스트 지정
        navigationBar.rightTitleText = "채팅"
        /// 네비게이션 알림 텍스트
        navigationBar.noticeText = "2"
        /// 네비게이션바 왼쪽에 버튼을 넣을것인지
        navigationBar.isUseLeftButton = false
        /// 네비게이션바 오른쪽에이미지를 넣을것인지
        navigationBar.isUserNavigationRightImageView = true
        /// 네비게이션바오른쪽에 텍스트를 넣을것인지
        navigationBar.isNavigationBarRightTextLabel = true
        /// 네비게이션바오른쪽에 버튼을 넣을것인지
        navigationBar.isUserNavigationRightButton = true
        /// 네비게이션바에 알림을 넣을것인지
        navigationBar.isNoticeCountMode = true
        return navigationBar
    }()
    
    // MARK: - 컬렉션뷰 생성
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: CustomerCenterVC.getCollectionViewCompositionalLayout())
        // 스크롤링 사용할것인지
        view.isScrollEnabled = true
        // 가로 스크롤바 표시 여부
        view.showsHorizontalScrollIndicator = false
        // 세로 스크롤바 표시 여부
        view.showsVerticalScrollIndicator = true
        // contentInset은 컨텐츠에 상하좌우 여백
        view.contentInset = .zero
        // 백그라운드 컬러
        view.backgroundColor = .clear
        // subview들이 view의 bounds에 가둬질 수 있는 지를 판단하는 Boolean 값
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupCollectionViewData()
        setupLayout()
    }
    /// 네비게이션바 컬렉션바 위치잡기
    fileprivate func setupLayout() {
        /// 네비게이션바 오토레이아웃
        self.view.addSubview(customNavigationBar)
        self.customNavigationBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(customNavigationBar.containerView)
        }
        /// 컬렉션뷰 오토레이아웃
        self.view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    fileprivate func setupCollectionViewData() {
        // mainKategories
        let mainKategoriesModel = MainKategories.getCustomerCenterModel()
        let mainKaterogiesSection = CustomerCenterSectionModel.mainKategories(mainKategoriesModel)
        // horizentalKategories
        let horizentalKategories = DetailHorizentalKategories.getDetailHorizentalKategories()
        let horizentalSectionKategories = CustomerCenterSectionModel.detailHorizentalKategories(horizentalKategories)
        // VerticalKategories
        let verticalKategories = DetailVerticalKategories.getDetailVerticalKategories()
        let verticalSectionKategories = CustomerCenterSectionModel.detailVerticalKategories(verticalKategories)
        self.customerCenterSectionsDataArray = [mainKaterogiesSection, horizentalSectionKategories, verticalSectionKategories]
        self.collectionView.reloadData()
    }
    
    // MARK: - 컴포지셔널 레이아웃 생성
    static func getCollectionViewCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return CustomerCenterVC.getMainCompostionalLayoutSection()
            case 1:
                return CustomerCenterVC.getHorizentalCompositinalLayoutSection()
            case 2:
                return CustomerCenterVC.getVerticalCompositionalLayoutSection()
            default:
                return nil
            }
        }
        return layout
    }
    
    // MARK: - 컬렉션뷰 레지스터, 델리게이트 채택
    fileprivate func setupCollectionView() {
        /// 메인 카테고리 쎌 레지스터
        let uiNib = UINib(nibName: "MainKategoriesCVC", bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: MainKategoriesCVC.reuseIdentifier)
        
        /// 메인 카테고리 헤더 레지스터
        let mainHeaderUiNib = UINib(nibName: "MainKategoriesHeader", bundle: nil)
        collectionView.register(mainHeaderUiNib, forSupplementaryViewOfKind: "mainHeader", withReuseIdentifier: MainKategoriesHeader.reuseIdentifier)
        /// 메인 카테고리 푸터 레지스터
        let mainFooterUiNib = UINib(nibName: MainKategoriesFooter.nibName, bundle: nil)
        collectionView.register(mainFooterUiNib, forSupplementaryViewOfKind: "mainFooter", withReuseIdentifier: MainKategoriesFooter.reuseIdentifier)
        /// 호리젠탈 카테고리 쎌 레지스터
        let horizentalnUiNib = UINib(nibName: HorizentalKategoriesCVC.nibName, bundle: nil)
        collectionView.register(horizentalnUiNib, forCellWithReuseIdentifier: HorizentalKategoriesCVC.reuseIdentifier)
        /// 호리젠탈 카테고리 헤더 레지스터
        let horizentalHeaderUiNib = UINib(nibName: HorizentalKategoriesHeader.nibName, bundle: nil)
        collectionView.register(horizentalHeaderUiNib, forSupplementaryViewOfKind: "horizentalHeader", withReuseIdentifier: HorizentalKategoriesHeader.reuseIdentifier)
        /// 버티컬 카테고리 쎌 레지스터
        let verticalUiNib = UINib(nibName: VerticalKategoriesCVC.nibName, bundle: nil)
        collectionView.register(verticalUiNib, forCellWithReuseIdentifier: VerticalKategoriesCVC.reuseIdentifier)
        
        /// 버티컬 카테고리 푸터 레지스터
        
        /// 델리게이트 등록
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        /// 쎌 셀프 사이징
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
}





// MARK: - 컬렉션뷰 델리게이트 관련
extension CustomerCenterVC: UICollectionViewDelegate {
    /// 컬렉션뷰 뷰 등록
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == "mainHeader" {
            let mainHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainKategoriesHeader.reuseIdentifier, for: indexPath) as! MainKategoriesHeader
            return mainHeaderView
        } else if kind == "mainFooter" {
            let mainFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainKategoriesFooter.reuseIdentifier, for: indexPath) as! MainKategoriesFooter
            return mainFooterView
        } else if kind == "horizentalHeader" {
            let horizentalHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HorizentalKategoriesHeader.reuseIdentifier, for: indexPath) as! HorizentalKategoriesHeader
            return horizentalHeaderView
        } else {
            return UICollectionReusableView()
        }
        
    }
}


// MARK: - 컬렉션뷰 데이터소스 관련
extension CustomerCenterVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return customerCenterSectionsDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(customerCenterSectionsDataArray.count, "⭐️")
        switch self.customerCenterSectionsDataArray[section] {
            
        case let .mainKategories(mainKategoriesModel):
            print(mainKategoriesModel.count, "🍎")
            return mainKategoriesModel.count
        case let .detailHorizentalKategories(detailHorizentalKategoriesModel):
            print(detailHorizentalKategoriesModel.count, "🍎🍎")
            return detailHorizentalKategoriesModel.count
        case let .detailVerticalKategories(detailVerticalKategoriesModel):
            print(detailVerticalKategoriesModel.count, "🍎🍎🍎")
            return detailVerticalKategoriesModel.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.customerCenterSectionsDataArray[indexPath.section] {
        case let .mainKategories(mainKategoriesModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainKategoriesCVC.reuseIdentifier, for: indexPath) as! MainKategoriesCVC
            let cellData = mainKategoriesModel[indexPath.item]
            cell.kategorieImageView.image = cellData.kategoriesImage
            cell.kategorieLabel.text = cellData.kategoriesName
            return cell
            
        case let .detailHorizentalKategories(detailHorizentalKategoriesModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizentalKategoriesCVC.reuseIdentifier, for: indexPath) as! HorizentalKategoriesCVC
            let cellData = detailHorizentalKategoriesModel[indexPath.item]
            cell.kategoriesTitleLabel.text = cellData.kategoriesLabel
            cell.kategoriesBodyLabel.text = cellData.bodyTextLabel
            cell.heartButton.imageView?.image = cellData.likeImage
            cell.messageButton.imageView?.image = cellData.chatImage
            cell.likeCountLabel.text = cellData.likeCountLabel
            cell.chatCountLabel.text = cellData.chatCountLabel
            return cell
            
        case let .detailVerticalKategories(detailVerticalKategoriesModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalKategoriesCVC.reuseIdentifier, for: indexPath) as! VerticalKategoriesCVC
            let cellData = detailVerticalKategoriesModel[indexPath.item]
            cell.kategoriesTitleLabel.text = cellData.kategoriesLabel
            cell.kategoriesBodyTitleLabel.text = cellData.titleLabel
            cell.kategoriesBodyLabel.text = cellData.bodyTextLabel
            cell.kategoriesBodyImage.image = cellData.mainImage
            cell.kategoriesTagLabel.text = cellData.hashTag
            cell.heartButton.imageView?.image = cellData.likeImage
            cell.likeCountLabel.text = cellData.likeCountLabel
            cell.chatButton.imageView?.image = cellData.chatImage
            cell.chatCountLabel.text = cellData.chatCountLabel
            cell.timeDifferenceLabel.text = cellData.initDate
            
            return cell
        }
    }
    
    
}

// MARK: - ⭐️컴포지셔널 섹션 레이아웃 잡기⭐️
extension CustomerCenterVC {
    /// 메인섹션 레이아웃 잡기
    static func getMainCompostionalLayoutSection() -> NSCollectionLayoutSection {
        
        /// 아이템사이즈 - 그룹의 가로크기의 1/5, 최소크기 50
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/6), heightDimension: .estimated(50))
        /// 아이템사이즈로 아이템 만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // 아이템간의 여백 설정
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0)
        /// 그룹사이즈 - 컬렉션뷰 가로길의의 1, 아이템사이즈의 높이크기(50)
        let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.3),
                                                heightDimension: .estimated(80))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        /// 헤더사이즈 -
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(65))
        /// 헤더만들기
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "mainHeader", alignment: .top)
        /// 풋터사이즈 -
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        /// 풋터만들기
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: "mainFooter", alignment: .bottom)
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더, 풋터 등록
        section.boundarySupplementaryItems = [header,footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        /// 반환
        return section
    }
    /// 호리젠탈 섹션 레이아웃 잡기
    static func getHorizentalCompositinalLayoutSection() -> NSCollectionLayoutSection {
        /// 아이템사이즈 - 그룹 가로길이의 1/2, 그룹 세로길이의 1/1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        /// 아이템사이즈로 아이템 만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        /// 그룹사이즈 - 컬렉션 뷰의 가로 길이의 1.15배, 컬렉션 뷰의 세로 길이의 1/3.8
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.15), heightDimension: .fractionalHeight(1.0/3.0))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        /// 헤더사이즈 -
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        /// 헤더 만들기
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "horizentalHeader", alignment: .top)
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더 등록
        section.boundarySupplementaryItems = [header]
        /// 섹션의 스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        /// 섹션 반환
        return section
    }
    /// 버티컬 섹션 레이아웃 잡기
    static func getVerticalCompositionalLayoutSection() -> NSCollectionLayoutSection {
        /// 아이템사이즈 - 그룹 가로길이의 1/1, 그룹 세로길이의 1/4,
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(237))
        /// 아이템사이즈로 아이템만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        /// 그룹사이즈 - 컬렉션뷰 가로길이의 1/1, 컬렉션뷰 세로길이의 1/3
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        /// 헤더
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션의 스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        /// 섹션반환
        return section
    }
}


extension CustomerCenterVC: CustomNavigationBarProtocol {
    func didTapRightButton() {
        print("👍🏻")
    }
    
    func didTapLeftButton() {
        print("⭐️")
    }
    
    
}
