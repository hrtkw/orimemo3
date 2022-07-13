import UIKit
import UserNotifications

final class UserNotificationUtil: NSObject {

    static var shared = UserNotificationUtil()
    private var center = UNUserNotificationCenter.current()

    func initialize() {
        //center.delegate = UserNotificationUtil.shared
    }
}
