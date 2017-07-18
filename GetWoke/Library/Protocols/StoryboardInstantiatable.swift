//
//  StoryboardInstantiatable.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit

protocol StoryboardInstantiatable {
  static var storyboard: UIStoryboard { get }
  static func storyboardInstance() -> Self
}

extension StoryboardInstantiatable where Self: UIViewController {
  static var storyboard: UIStoryboard {
    let name = String(describing: Self.self)
    let bundle = Bundle(for: Self.self)
    return UIStoryboard(name: name, bundle: bundle)
  }

  static func storyboardInstance() -> Self {
    guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
      fatalError("Could not instantiate view controller \(Self.self) from \(storyboard)")
    }

    return viewController
  }
}
