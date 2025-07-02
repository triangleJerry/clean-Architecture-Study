//
//  Mockable.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 7/2/25.
//

/// 목(Mock) 데이터 생성에 대한 규칙을 정의하는 프로토콜입니다.
///
/// `Mockable` 프로토콜을 준수하는 타입은 특정 타입의 목 데이터를 생성하기 위해
/// `MockType` 연관 타입과 `mockInstance` 정적 속성을 반드시 구현해야 합니다.
/// 이 프로토콜은 테스트 또는 샘플 데이터를 제공하는 데 사용됩니다.
public protocol Mockable {
    
    /// 목 데이터 생성에 사용될 타입입니다.
    associatedtype MockType
    
    /// 목 데이터를 반환하는 정적 속성입니다.
    ///
    /// 이 속성은 특정 타입의 목 데이터를 반환하며, 테스트 목적이나
    /// 데이터 샘플링을 위해 사용됩니다.
    static var mockInstance: MockType { get }
}
