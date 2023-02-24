//
//  MainViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit
import Service

public final class MainViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            do {
                let request = SearchRequest(keyword: "")
                let okashi = try await APIClient.shared.call(with: request)
                print(okashi)
            } catch {
                print(error)
            }
        }
    }
}
