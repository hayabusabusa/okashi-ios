//
//  Translatable.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Combine

public protocol Translatable {
    associatedtype Input
    associatedtype Output

    func translate(_ input: Input) -> Output
}

public extension Publisher {
    func translate<T: Translatable>(with translator: T) -> AnyPublisher<T.Output, Failure> where Output == T.Input {
        map { translator.translate($0) }.eraseToAnyPublisher()
    }
}
