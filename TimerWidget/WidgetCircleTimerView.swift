//
//  WidgetCircleTimerView.swift
//  TimerWidgetExtension
//
//  Created by Marwa Abou Niaaj on 27/09/2023.
//

import SwiftUI

struct WidgetCircleTimerView: View {

    var progress: Double
    var duration: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.25)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .foregroundColor(Color.primaryColor)
                .frame(width: 36, height: 36)
        }
    }
}

//#Preview {
//    WidgetCircleTimerView(progress: 0.8, duration: "2:41")
//}
