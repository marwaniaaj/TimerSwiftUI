//
//  Extensions.swift
//  Timer
//
//  Created by Marwa Abou Niaaj on 26/09/2023.
//

import Foundation
import SwiftUI


// MARK: - Extensions

extension View {
    func timerButtonStyle(isValid: Bool = true) -> some View {
        self
            .font(.title2)
            .padding()
            .background(Color.primaryColor.opacity(isValid ? 1.0 : 0.2))
            .foregroundColor(Color.labelColor)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

extension Color {
    /// Primary color used in app
    static var primaryColor: Color = Color(uiColor: UIColor(named: "AccentColor")!)

    /// Secondary color used in app
    static var secondaryColor: Color = .yellow

    /// Light gray color
    static var lightColor: Color = Color(uiColor: UIColor.systemGray6)

    /// Gray color for placeholders, lines .. etc
    static var labelColor: Color = Color(uiColor: UIColor.label)

    /// List background color
    static var backgroundColor: Color = Color(uiColor: UIColor.systemGroupedBackground)

    /// List row color
    static var listRowColor: Color = Color(uiColor: UIColor.secondarySystemGroupedBackground)
}
