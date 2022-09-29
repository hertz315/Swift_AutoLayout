//
//  CustomerCenterModel.swift
//  Dailly_Challenge_CommunityList
//
//  Created by Hertz on 9/26/22.
//

import UIKit


enum CustomerCenterSectionModel {
    case mainKategories([MainKategories])
    case detailVerticalKategories([DetailVerticalKategories])
    case detailHorizentalKategories([DetailHorizentalKategories])
}


struct MainKategories {
    let kategoriesName: String
    var kategoriesImage: UIImage?
    
    static func getCustomerCenterModel() -> [MainKategories] {
        let array: [MainKategories] = [
            MainKategories(kategoriesName: "전체", kategoriesImage: UIImage(named: "E1")),
            MainKategories(kategoriesName: "문의", kategoriesImage: UIImage(named: "E2")),
            MainKategories(kategoriesName: "가격", kategoriesImage: UIImage(named: "E3")),
            MainKategories(kategoriesName: "전문가검색", kategoriesImage: UIImage(named: "E4")),
            MainKategories(kategoriesName: "의뢰하기", kategoriesImage: UIImage(named: "E4")),
            MainKategories(kategoriesName: "전체", kategoriesImage: UIImage(named: "E1")),
            MainKategories(kategoriesName: "문의", kategoriesImage: UIImage(named: "E2")),
            MainKategories(kategoriesName: "가격", kategoriesImage: UIImage(named: "E3")),
            MainKategories(kategoriesName: "전문가검색", kategoriesImage: UIImage(named: "E4")),
            MainKategories(kategoriesName: "의뢰하기", kategoriesImage: UIImage(named: "E4")),
            MainKategories(kategoriesName: "전체", kategoriesImage: UIImage(named: "E1")),
            MainKategories(kategoriesName: "문의", kategoriesImage: UIImage(named: "E2")),
            MainKategories(kategoriesName: "가격", kategoriesImage: UIImage(named: "E3")),
            MainKategories(kategoriesName: "전문가검색", kategoriesImage: UIImage(named: "E4")),
            MainKategories(kategoriesName: "의뢰하기", kategoriesImage: UIImage(named: "E4")),
            
        ]
        return array
    }
    
}

struct DetailHorizentalKategories {
    let kategoriesLabel: String
    let bodyTextLabel: String
    let likeCountLabel: String
    let chatCountLabel: String
    var likeImage: UIImage?
    var chatImage: UIImage?
    
    static func getDetailHorizentalKategories() -> [DetailHorizentalKategories] {
        let array: [DetailHorizentalKategories] = [
            DetailHorizentalKategories(kategoriesLabel: "문의", bodyTextLabel: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?", likeCountLabel: 2222222.roundedWithAbbreviations, chatCountLabel: 11111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailHorizentalKategories(kategoriesLabel: "가격", bodyTextLabel: "볶음밥 7000원 인가요? 새우볶음밥은 얼마에요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailHorizentalKategories(kategoriesLabel: "문의", bodyTextLabel: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailHorizentalKategories(kategoriesLabel: "가격", bodyTextLabel: "볶음밥 7000원 인가요? 새우볶음밥은 얼마에요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),           DetailHorizentalKategories(kategoriesLabel: "문의", bodyTextLabel: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailHorizentalKategories(kategoriesLabel: "가격", bodyTextLabel: "볶음밥 7000원 인가요? 새우볶음밥은 얼마에요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),            DetailHorizentalKategories(kategoriesLabel: "문의", bodyTextLabel: "실크벽지 폭이 110 이면 일반인가요? 아니면 광폭인가요?", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailHorizentalKategories(kategoriesLabel: "가격", bodyTextLabel: "볶음밥 7000원 인가요? 새우볶음밥은 얼마에요?", likeCountLabel: 22222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
        ]
        return array
    }
}


struct DetailVerticalKategories {
    let kategoriesLabel: String
    let titleLabel: String
    let bodyTextLabel: String
    let likeCountLabel: String
    let chatCountLabel: String
    let hashTag: String
    let initDate: String
    var mainImage: UIImage?
    var likeImage: UIImage?
    var chatImage: UIImage?
    
    static func getDetailVerticalKategories() -> [DetailVerticalKategories] {
        let array: [DetailVerticalKategories] = [
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 1111.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 11111.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 2222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 22222.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 3333.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
            DetailVerticalKategories(kategoriesLabel: "문의", titleLabel: "천장 도배", bodyTextLabel: "아파트 천장 도배하려고 합니다. 견적 부탁드려요", likeCountLabel: 33333.roundedWithAbbreviations, chatCountLabel: 1111.roundedWithAbbreviations, hashTag: "# 도배", initDate: "30분 전", mainImage: UIImage(named: "도배"), likeImage: UIImage(systemName: "heart"), chatImage: UIImage(systemName: "message")),
        ]
        return array
    }
}

