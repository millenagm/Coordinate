//
//  Navigatable.swift
//
//  Created by Millena Galvão on 11/08/2020.
//  Copyright © 2020 Millena Galvão. All rights reserved.
//

import UIKit

public protocol Navigatable: Root {

    var navigation: UINavigationController { get set }
}

extension Navigatable {

    public func push(_ controller: UIViewController, animated: Bool = true) {

        navigation.pushViewController(controller, animated: animated)
    }

    public func pop() {

        navigation.popViewController(animated: true)
    }
}

extension Navigatable {

    public var root: UIViewController { navigation }

    public func present(_ controller: UIViewController) {

        navigation.present(controller, animated: true)
    }

    public func dismiss() {

        navigation.dismiss(animated: true)
    }

    public func setRoot(_ controller: UIViewController) {

        navigation.setViewControllers([controller], animated: true)
    }
}
