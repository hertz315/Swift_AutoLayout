//
//  ViewController.swift
//  Dailly_Challenge_DetailSearchResult
//
//  Created by Hertz on 10/3/22.
//

import UIKit
import SnapKit


final class DetailSearchResultVC: UIViewController {
    
    /// 데이터 배열
    /// 색션을 구분하기 위해 2차원 배열로 만듬
    var dataList: [SearchResultModel] = []
    
    /// 네비게이션 바 생성
    var customNavigationBar = CustomNavigationBar()
    
    /// 컬렉션 뷰 생성
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: DetailSearchResultVC.getCollectionViewCompositionalLayout())
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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 셋업 네비게이션바
        setupNaviBar()
        /// 셋업 UI
        setupUI()
        /// 셋업 데이터
        setupCollectionViewData()
        /// 셋업 컬렉션뷰
        setupCollectionView()
    }
    
    /// 네비게이션바 셋팅
    fileprivate func setupNaviBar() {
        self.customNavigationBar.titleText = "빡코빡코 님의 식탁"
        self.customNavigationBar.isUseLeftButton = true
        self.customNavigationBar.isDrawBottomLine = true
        self.customNavigationBar.isUserRightButton = true
        self.customNavigationBar.isUserRightSearchButton = true
        self.customNavigationBar.rightButtonImage = UIImage(named: "Buy") ?? UIImage(systemName: "message")!
        self.customNavigationBar.rightSearchButtonImage = UIImage(named: "Search") ?? UIImage(systemName: "message")!
        self.customNavigationBar.navigationHeight = 60
    }
    
    /// UI오토레이아웃 잡기
    fileprivate func setupUI() {
        self.view.addSubview(customNavigationBar)
        self.customNavigationBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(customNavigationBar.containerView)
        }
        
        self.view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    /// 컬렉션뷰 데이터 생성
    fileprivate func setupCollectionViewData() {
        dataList = SearchResultModel.getProduct()
    }
    
    /// 컬렉션뷰 필수요소 레지스터
    fileprivate func setupCollectionView() {
        /// 컬렉션뷰 쎌 레지스터
        let cellUiNib = UINib(nibName: CollectionViewCell.nibName, bundle: nil)
        collectionView.register(cellUiNib, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        /// 헤더 레지스터
        let headerUiNib = UINib(nibName: CollectionViewHeader.nibName, bundle: nil)
        collectionView.register(headerUiNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.reuseIdentifier)
        /// 풋터 레지스터
        
        /// 델리게이트 채택
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
}


extension DetailSearchResultVC {
    // MARK: - 컴포지셔널 레이아웃 생성
    static func getCollectionViewCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            print("\(sectionIndex) ✅")
            switch sectionIndex {
            case 0:
                return DetailSearchResultVC.getCompostionalLayoutSection()
            default:
                return nil
            }
        }
        return layout
    }
    
    // MARK: - ⭐️컴포지셔널 섹션 레이아웃 잡기⭐️
    /// 메인섹션 레이아웃 잡기
    static func getCompostionalLayoutSection() -> NSCollectionLayoutSection {
        
        /// 아이템사이즈 - 그룹의 가로크기의 1/2, 최소크기 50
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .estimated(232))
        /// 아이템사이즈로 아이템 만들기
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // 아이템간의 여백 설정
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8)
        /// 아이템 사이즈 - 그룹의
        let itemSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .estimated(232))
        /// 아이템 사이즈로 아이템 만들기
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)
        /// 아이템간의 여백 설정
        item2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 16)
        
        
        /// 그룹사이즈 - 컬렉션뷰 가로길의의 1, 컬렉션 뷰 세로길이의 3)
        let groupSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(235))
        /// 그룹사이즈로 그룹만들기
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item2])
        /// 헤더사이즈 -
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(55))
        /// 헤더만들기
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        /// 풋터사이즈 -
        /// 풋터만들기
        /// 섹션
        let section = NSCollectionLayoutSection(group: group)
        /// 섹션에 헤더, 풋터 등록
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//        section.orthogonalScrollingBehavior = .continuous
        /// 반환
        return section
    }
}

// MARK: - 컬렉션뷰 델리게이트
extension DetailSearchResultVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeader.reuseIdentifier, for: indexPath) as! CollectionViewHeader
            #warning("TODO : - ㅇ ")
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - 컬렉션뷰 데이터소스
extension DetailSearchResultVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// 쎌 데이터
        let cellData = dataList[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.productImage.image = cellData.productImage
        cell.productLabel.text = cellData.productLabel
        cell.productPriceLabel.text = cellData.productPrice
        return cell
    }
    
}
