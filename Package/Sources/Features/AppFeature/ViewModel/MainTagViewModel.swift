//
//  MainTagViewModel.swift
//  
//
//  Created by Shunya Yamada on 2023/02/25.
//

import Combine
import Foundation
import Service

protocol MainTagViewModelInput {
    func viewDidLoad() async
}

protocol MainTagViewModelOutput {
    var sections: AnyPublisher<[(MainTagViewController.Section, [MainTagViewController.Item])], Never> { get }
}

protocol MainTagViewModelable {
    var input: MainTagViewModelInput { get }
    var output: MainTagViewModelOutput { get }
}

final class MainTagViewModel {

    private let apiClient: APIClientProtocol
    private let sectionsSubject: CurrentValueSubject<[(MainTagViewController.Section, [MainTagViewController.Item])], Never>

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
        self.sectionsSubject = .init([])
    }
}

// MARK: - Input

extension MainTagViewModel: MainTagViewModelInput {
    func viewDidLoad() async {
        do {
            let request = OkashiTypesRequest()
            let response = try await apiClient.call(with: request)
            let items = response.type.map { MainTagViewController.Item.tag(MainTagCell.Configuration(title: $0.name, titleLabelColor: .white, backgroundColor: .systemBlue)) }
            sectionsSubject.send([(.grid, items)])
        } catch {
            print(error)
        }
    }
}

// MARK: - Output

extension MainTagViewModel: MainTagViewModelOutput {
    var sections: AnyPublisher<[(MainTagViewController.Section, [MainTagViewController.Item])], Never> {
        sectionsSubject.eraseToAnyPublisher()
    }
}

extension MainTagViewModel: MainTagViewModelable {
    var input: MainTagViewModelInput {
        self
    }

    var output: MainTagViewModelOutput {
        self
    }
}
