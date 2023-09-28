//
//  ContentView.swift
//  Timer
//
//  Created by Marwa Abou Niaaj on 26/09/2023.
//

import SwiftUI
import ActivityKit

struct ContentView: View {

    @State var startTime = Date()

    // The interval difference between total and remaining duration.
    @State var interval = TimeInterval()

    // The actual total duration.
    @State var totalDuration: TimeInterval = 2 * 60

    // The remaining duration.
    @State var duration: TimeInterval = 2 * 60

    // Timer progress.
    @State var progress = 1.0

    // Boolean indicates wether the timer is running or not.
    @State var isTimerRunning = false

    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State var activity: Activity<TimerAttributes>?

    var body: some View {
        VStack {
            Spacer()
            if isTimerRunning {
                CircleTimerView(progress: $progress, duration: $duration)
            }
            Spacer()

            HStack(spacing: 24) {
                Button {
                    startTime = Date()
                    startTimer()
                } label: {
                    Text("Start")
                    Image(systemName: "stopwatch")
                }
                .timerButtonStyle(isValid: !isTimerRunning)
                .disabled(isTimerRunning)

                Button {
                    stopTimer()
                } label: {
                    Text("Stop")
                    Image(systemName: "stop.circle")
                }
                .timerButtonStyle(isValid: isTimerRunning)
                .disabled(!isTimerRunning)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
        .onReceive(timer) { time in
            if (isTimerRunning) {
                interval = Date().timeIntervalSince(startTime)
                duration = totalDuration - interval
                progress = (duration / totalDuration)

                // Stop timer when it finishes
                if duration <= 0 {
                    stopTimer()
                } else {
                    guard let id = activity?.id else { return }
                    LiveActivityManager().updateActivity(
                        activity: id,
                        duration: duration,
                        progress: progress
                    )
                }
            }
        }
    }

    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        activity = LiveActivityManager().startActivity(duration: duration, progress: progress)
        isTimerRunning.toggle()
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
        LiveActivityManager().endActivity()
        resetTimer()
        isTimerRunning.toggle()
    }

    func resetTimer() {
        totalDuration = 120
        duration = 120
        progress = 1.0
    }
}

#Preview {
    ContentView()
}
