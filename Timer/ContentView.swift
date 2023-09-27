//
//  ContentView.swift
//  Timer
//
//  Created by Marwa Abou Niaaj on 26/09/2023.
//

import SwiftUI

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

    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

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
                    isTimerRunning.toggle()
                    //activity = startActivity()

                } label: {
                    Text("Start")
                    Image(systemName: "stopwatch")
                }
                .timerButtonStyle(isValid: !isTimerRunning)
                .disabled(isTimerRunning)

                Button {
                    isTimerRunning.toggle()
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
            }
        }
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
        resetTimer()
    }

    func resetTimer() {
        totalDuration = 120
        duration = 120
        progress = 1.0
    }

    mutating func startTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

#Preview {
    ContentView()
}
