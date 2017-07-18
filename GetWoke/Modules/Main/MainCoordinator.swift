//
//  MainCoordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

class MainCoordinator: ModalCoordinator {
  override func makeViewController() -> Observable<UIViewController> {
    let viewController = MainViewController.storyboardInstance()
    return Observable.just(viewController)
  }
}
