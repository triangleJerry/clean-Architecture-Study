//
//  PokemonCard.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

/// 포켓몬 트레이딩 카드 게임의 카드를 나타내는 모델입니다.
struct PokemonCard: Identifiable, Equatable {
    
    /// 카드의 고유 식별자입니다.
    public let id: String
    /// 카드의 이름입니다.
    public let name: String
    /// 카드의 상위 유형입니다. (예: Pokémon, Energy, Trainer)
    public let supertype: String
    /// 카드에 속한 타입 목록입니다. (예: 불, 물)
    public let types: [String]?
    /// 카드 이미지의 작은 버전 URL입니다.
    public let imageSmallURL: URL
    /// 카드 이미지의 고해상도 버전 URL입니다.
    public let imageLargeURL: URL
    /// 카드가 속한 세트의 정보입니다.
    public let set: SetInfo
    /// 즐겨찾기로 표시되었는지 여부입니다.
    public var isFavorite: Bool = false
}
