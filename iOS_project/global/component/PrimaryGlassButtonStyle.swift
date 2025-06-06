//
//  PrimaryGlassButtonStyle.swift
//  iOS_project
//
//  Created by sonjuwan on 6/5/25.
//

import Foundation
import SwiftUI

struct PrimaryGlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                LinearGradient(
                    colors: [Color(hex: "#667eea"), Color(hex: "#764ba2")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
