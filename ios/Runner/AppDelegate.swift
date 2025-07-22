import UIKit
import Flutter
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {

    private let workoutChannelName = "fittrack/workout"
    private var workoutChannel: FlutterMethodChannel?

    private var latestHeartRate = 0
    private var latestSteps = 0
    private var latestCalories = 0.0

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        GeneratedPluginRegistrant.register(with: self)
        
        UNUserNotificationCenter.current().delegate = self
        
        if let controller = window?.rootViewController as? FlutterViewController {
            workoutChannel = FlutterMethodChannel(name: workoutChannelName, binaryMessenger: controller.binaryMessenger)
            
            workoutChannel?.setMethodCallHandler { [weak self] call, result in
                guard let self = self else { return }
                
                switch call.method {
                case "startWorkout":
                    self.startWorkout()
                    result("Workout started")
                case "stopWorkout":
                    self.stopWorkout()
                    result("Workout stopped")
                default:
                    result(FlutterMethodNotImplemented)
                }
            }
            
            // Listen for native workout updates and forward to Flutter
            NotificationCenter.default.addObserver(forName: .workoutUpdate, object: nil, queue: .main) { [weak self] notification in
                guard let self = self, let userInfo = notification.userInfo else { return }
                
                self.latestHeartRate = userInfo["heartRate"] as? Int ?? 0
                self.latestSteps = userInfo["steps"] as? Int ?? 0
                self.latestCalories = userInfo["calories"] as? Double ?? 0.0
                
                // Send update event to Flutter
                self.workoutChannel?.invokeMethod("onWorkoutUpdate", arguments: userInfo)
            }
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error)")
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func startWorkout() {
        WorkoutManager.shared.startWorkout()
    }
    
    private func stopWorkout() {
        WorkoutManager.shared.stopWorkout()
    }
    
    // Show notifications in foreground
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert, .sound])
    }
}
