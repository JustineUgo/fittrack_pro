package com.example.fittrack_pro

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

object WorkoutManager {

    @Volatile
    private var isRunning = false

    private val handler = Handler(Looper.getMainLooper())
    private val random = Random.Default

    private var methodChannel: MethodChannel? = null
    private var activity: MainActivity? = null

    
    private val workoutRunnable = object : Runnable {
        override fun run() {
            if (!isRunning) return

            val data = mapOf(
                "heartRate" to (60 + random.nextInt(81)),           
                "steps" to (5 + random.nextInt(16)),                
                "calories" to (0.5 + random.nextDouble() * 4.5)     
            )

            methodChannel?.invokeMethod("onWorkoutUpdate", data)
            handler.postDelayed(this, 2000)
        }
    }

    // Start the workout simulation
    fun startWorkout(channel: MethodChannel, activity: MainActivity) {
        if (isRunning) return

        isRunning = true
        methodChannel = channel
        this.activity = activity

        // Show notification when workout starts
        activity.showWorkoutNotification()

        // Begin periodic updates
        handler.post(workoutRunnable)
    }

    // Stop the workout simulation
    fun stopWorkout() {
        if (!isRunning) return

        isRunning = false
        handler.removeCallbacks(workoutRunnable)
        activity?.cancelNotification()

        methodChannel = null
        activity = null
    }
}
