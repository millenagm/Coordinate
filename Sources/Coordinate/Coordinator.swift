//
//  Coordinator.swift
//
//  Created by Millena Galvão on 11/08/2020.
//  Copyright © 2020 Millena Galvão. All rights reserved.
//

import UIKit

public protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {

     public func addChild(_ childCoordinator: Coordinator) {
         childCoordinators.append(childCoordinator)
     }

     public func removeChild(_ childCoordinator: Coordinator) {
         childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
     }
}

public protocol Root {

    var root: UIViewController { get }

    func setRoot(_ controller: UIViewController)
    func present(_ controller: UIViewController)
    func dismiss()
}

public typealias RootCoordinator = Coordinator & Root
