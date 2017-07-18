//
//  ModalCoordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

protocol ModalCoordinatorProtocol: ViewControllerCoordinatorProtocol { }

class ModalCoordinator: ViewControllerCoordinator, ModalCoordinatorProtocol {
  private let parentViewController: UIViewController

  init(parentViewController: UIViewController) {
    self.parentViewController = parentViewController
  }

  override func presentViewController(_ viewController: UIViewController) -> Observable<Void> {
    return Observable.create { observer in
      self.parentViewController.present(viewController, animated: true, completion: nil)
      observer.onNext()
      observer.onCompleted()
      return Disposables.create()
    }
  }

  override func dismissViewController() -> Observable<Void> {
    return Observable.create { observer in
      self.parentViewController.dismiss(animated: true, completion: nil)
      observer.onNext()
      observer.onCompleted()
      return Disposables.create()
    }
  }
}
