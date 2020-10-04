//
//  WindowRoutable.swift
//
//  Created by Millena Galvão on 11/08/2020.
//  Copyright © 2020 Millena Galvão. All rights reserved.
//

import UIKit

public protocol WindowRoutable: Root {

    var window: UIWindow { get set }
}

extension WindowRoutable {

    public var root: UIViewController {
        guard let root = window.rootViewController else { fatalError("window.rootViewController not found") }
        return root
    }

    public func present(_ controller: UIViewController) {

        root.present(controller, animated: true)
    }

    public func dismiss() {

        root.dismiss(animated: true)
    }

    public func setRoot(_ controller: UIViewController) {

        window.rootViewController = controller
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
}

extension WindowRoutable where Self: Coordinator {

    public func setRoot(_ coordinator: RootCoordinator) {

        addChild(coordinator)
        coordinator.start()
        setRoot(coordinator.root)
    }
}
