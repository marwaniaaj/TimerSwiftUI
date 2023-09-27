//
//  CircleTimerView.swift
//  Timer
//
//  Created by Marwa Abou Niaaj on 26/09/2023.
//

import SwiftUI

struct CircleTimerView: View {

    @Binding var progress: Double
    @Binding var duration: TimeInterval

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.08)
                .foregroundColor(.black)
                .frame(width: 200, height: 200)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .foregroundColor(Color.primaryColor)
                .frame(width: 200, height: 200)

            Text(duration.format(using: [.minute, .second]))
                .font(.title2.bold())
                .foregroundColor(Color.labelColor)
                .contentTransition(.numericText())
        }
    }
}

#Preview {
    // progress is Double value between 0.0 and 1.0
    // duration is TimeInterval value representing seconds
    CircleTimerView(progress: .constant(0.4), duration: .constant(100))
}
