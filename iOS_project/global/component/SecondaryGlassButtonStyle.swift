//
//  SecondaryGlassButtonStyle.swift
//  iOS_project
//
//  Created by sonjuwan on 6/5/25.
//

import Foundation
import SwiftUI

struct SecondaryGlassButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color(hex: "#667eea"))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.6),
                                    Color.white.opacity(0.3)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "#667eea").opacity(0.5), lineWidth: 1)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
