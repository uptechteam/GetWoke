//
//  AppDelegate.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  private var alarmService: AlarmService?
  private let disposeBag = DisposeBag()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    let window = UIWindow()

    let alarmService = AlarmService()
    self.alarmService = alarmService
    alarmService.schedule(alarm: Alarm(date: Date(timeIntervalSinceNow: 5)))

    let appCoordinator = AppCoordinator(window: window)
    appCoordinator.start()
      .subscribe()
      .disposed(by: disposeBag)

    return true
  }
}
