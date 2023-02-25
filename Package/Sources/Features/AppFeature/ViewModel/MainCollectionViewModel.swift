//
//  MainCollectionViewModel.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import Combine
import Foundation
import Service

protocol MainCollectionViewModelInput {
    func viewDidLoad()
}

protocol MainCollectionViewModelOutput {
    var sections: AnyPublisher<[(MainCollectionViewController.Section, [MainCollectionViewController.Item])], Never> { get }
}

protocol MainCollectionViewModelable {
    var input: MainCollectionViewModelInput { get }
    var output: MainCollectionViewModelOutput { get }
}

@MainActor
final class MainCollectionViewModel {

    private let apiClient: APIClientProtocol
    private let sectionsSubject: CurrentValueSubject<[(MainCollectionViewController.Section, [MainCollectionViewController.Item])], Never>

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
        self.sectionsSubject = .init([(.grid, MainCollectionViewController.Item.skeleton)])
    }
}

extension MainCollectionViewModel: MainCollectionViewModelInput {
    func viewDidLoad() {
        Task {
            do {
                let request = SearchRequest(keyword: "", max: 20)
                let response = try await apiClient.call(with: request)
                sectionsSubject.send(MainCollectionTranslator().translate(response))
            } catch {
                print(error)
            }
        }
    }
}

extension MainCollectionViewModel: MainCollectionViewModelOutput {
    var sections: AnyPublisher<[(MainCollectionViewController.Section, [MainCollectionViewController.Item])], Never> {
        sectionsSubject.eraseToAnyPublisher()
    }
}

extension MainCollectionViewModel: MainCollectionViewModelable {
    var input: MainCollectionViewModelInput {
        self
    }

    var output: MainCollectionViewModelOutput {
        self
    }
}
