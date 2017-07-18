//
//  AppCoordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator {
  private let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  override func start() -> Observable<Void> {
    let rootViewController = UIViewController()
    rootViewController.view.backgroundColor = UIColor.black

    return Observable<Void>.create { observer -> Disposable in
      self.window.rootViewController = rootViewController
      self.window.makeKeyAndVisible()
      observer.onNext()
      observer.onCompleted()
      return Disposables.create()
    }
      .flatMapLatest { _ in
        return self.showMain(in: rootViewController)
      }
  }

  override func finish() -> Observable<Void> {
    return Observable.never()
  }

  private func showMain(in parentViewController: UIViewController) -> Observable<Void> {
    let coordinator = MainCoordinator(parentViewController: parentViewController)
    return coordinate(to: coordinator)
  }
}
