//
//  GlassTextFieldStyle.swift
//  iOS_project
//
//  Created by sonjuwan on 6/5/25.
//

import Foundation
import SwiftUI

struct GlassTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
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
                        .stroke(Color.white.opacity(0.8), lineWidth: 1)
                }
            )
    }
}
