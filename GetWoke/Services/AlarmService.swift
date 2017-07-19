//
//  AlarmService.swift
//  GetWoke
//
//  Created by UPTechMac on 7/19/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import Foundation
import RxSwift
import UserNotifications

protocol AlarmServiceProtocol {

}

class AlarmService: NSObject, AlarmServiceProtocol {

  private let currentDate: () -> Date
  private var alarms = [Alarm]()

  init(currentDate: @escaping () -> Date = { Date() }) {
    self.currentDate = currentDate
    super.init()
    setupObserving()
  }

  func setupObserving() {
    UNUserNotificationCenter.current().delegate = self
  }

  func schedule(alarm: Alarm) {
    let identifier = UUID().uuidString
    let content = UNMutableNotificationContent()
    content.sound = UNNotificationSound.default()
    let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: alarm.date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
  }

  func some() {

  }
}

extension AlarmService: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    completionHandler()
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler(.sound)
  }
}
