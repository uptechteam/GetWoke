//
//  Coordinator.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

protocol CoordinatorProtocol {
  var identifier: String { get }
  func start() -> Observable<Void>
  func finish() -> Observable<Void>
  func coordinate(to coordinator: CoordinatorProtocol) -> Observable<Void>
  func uncoordinate(from coordinator: CoordinatorProtocol) -> Observable<Void>
  func uncoordinateFromChilds() -> Observable<Void>
}

class Coordinator: CoordinatorProtocol {
  let identifier = UUID().uuidString

  private var childCoordinators = [String: CoordinatorProtocol]()

  func start() -> Observable<Void> {
    fatalError("start() must be implemented by subclasses.")
  }

  func finish() -> Observable<Void> {
    fatalError("finish() must be implemented by subclasses.")
  }

  func coordinate(to coordinator: CoordinatorProtocol) -> Observable<Void> {
    return coordinator.start()
      .do(onNext: { [unowned self] in self.childCoordinators[coordinator.identifier] = coordinator })
  }

  func uncoordinate(from coordinator: CoordinatorProtocol) -> Observable<Void> {
    return coordinator.finish()
      .do(onNext: { [unowned self] in self.childCoordinators[coordinator.identifier] = nil })
  }

  func uncoordinateFromChilds() -> Observable<Void> {
    let uncoordinateObservables = childCoordinators
      .map { [unowned self] in self.uncoordinate(from: $1) }

    return Observable.from(uncoordinateObservables)
      .merge()
  }
}
