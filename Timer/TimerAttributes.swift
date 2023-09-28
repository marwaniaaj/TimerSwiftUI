//
//  TimerAttributes.swift
//  Timer
//
//  Created by Marwa Abou Niaaj on 27/09/2023.
//

import ActivityKit

struct TimerAttributes: ActivityAttributes {

    public typealias TimeTrackingStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var duration: String
        var progress: Double
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

