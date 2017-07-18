//
//  MainCoordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

class MainCoordinator: Coordinator {

  init(window: UIWindow) {
    self.window = window
    super.init()
  }

  override func start() -> Observable<Void> {
    let viewController = MainViewController()
    return Observable.create {
      
    }
  }

  func finish() -> Observable<Void> {
    return Observable.never()
  }
}
