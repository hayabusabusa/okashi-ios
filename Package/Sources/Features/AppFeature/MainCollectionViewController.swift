//
//  MainCollectionViewController.swift
//  
//
//  Created by Shunya Yamada on 2023/02/24.
//

import UIKit

final class MainCollectionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

#if DEBUG
import SwiftUI

private extension MainCollectionViewController {
    struct Wrapped: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainCollectionViewController

        func makeUIViewController(context: Context) -> MainCollectionViewController {
            let vc = MainCollectionViewController()
            return vc
        }

        func updateUIViewController(_ uiViewController: MainCollectionViewController, context: Context) {}
    }
}

struct MainCollectionViewController_Preview: PreviewProvider {
    static var previews: some View {
        MainCollectionViewController.Wrapped()
    }
}
#endif
