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
    return Observable<Void>.create { observer -> Disposable in
      self.window.makeKeyAndVisible()
      observer.onNext()
      observer.onCompleted()
      return Disposables.create()
    }
      .flatMapLatest { _ -> Observable<Void> in
        return self.showMain()
      }
  }

  override func finish() -> Observable<Void> {
    return Observable.never()
  }

  private func showMain() -> Observable<Void> {
    let coordinator = MainCoordinator()
    return coordinate(to: coordinator)
  }
}
