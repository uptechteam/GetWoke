//
//  ViewControllerCoordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewControllerCoordinatorProtocol: CoordinatorProtocol {
  func makeViewController() -> Observable<UIViewController>
  func presentViewController(_ viewController: UIViewController) -> Observable<Void>
  func dismissViewController() -> Observable<Void>
}

class ViewControllerCoordinator: Coordinator, ViewControllerCoordinatorProtocol {
  override func start() -> Observable<Void> {
    return makeViewController()
      .flatMap(presentViewController)
  }

  override func finish() -> Observable<Void> {
    return dismissViewController()
  }

  func makeViewController() -> Observable<UIViewController> {
    fatalError("makeViewController must be implemented by subclasses.")
  }

  func presentViewController(_ viewController: UIViewController) -> Observable<Void> {
    fatalError("presentViewController(_:) must be implemented by subclasses.")
  }

  func dismissViewController() -> Observable<Void> {
    fatalError("dismissViewController() must be implemented by subclasses.")
  }
}
