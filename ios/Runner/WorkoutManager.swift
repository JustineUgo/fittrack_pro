import Foundation
import CoreMotion
import UserNotifications

extension Notification.Name {
    static let workoutUpdate = Notification.Name("workoutUpdate")
}

class WorkoutManager {
    static let shared = WorkoutManager()
    
    private let motionManager = CMMotionActivityManager()
    private var timer: Timer?
    
    private init() {}

    func startWorkout() {
        startSimulatedMotionUpdates()
        scheduleSimulatedLocalNotification()
    }

    func stopWorkout() {
        timer?.invalidate()
        timer = nil
    }

    private func startSimulatedMotionUpdates() {
        timer?.invalidate() 

        timer = Timer(timeInterval: 2.0, repeats: true) { _ in
           
            let heartRate = Int.random(in: 60...140)
            let steps = Int.random(in: 5...20)
            let calories = Double.random(in: 0.5...5.0)

            NotificationCenter.default.post(name: .workoutUpdate, object: nil, userInfo: [
                "heartRate": heartRate,
                "steps": steps,
                "calories": calories
            ])
        }

        RunLoop.main.add(timer!, forMode: .common)
    }

    private func scheduleSimulatedLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Workout in Progress"
        content.body = "Keep going! You're doing great 💪"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "WorkoutReminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification Error: \(error)")
            }
        }
    }
}
