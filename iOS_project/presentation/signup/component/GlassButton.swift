//
//  GlassButton.swift
//  iOS_project
//
//  Created by sonjuwan on 6/8/25.
//

import Foundation
import SwiftUI

struct GlassButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    LinearGradient(
                        colors: [Color(hex: "#A28CF5"), Color(hex: "#7C6AE8")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color(hex: "#A28CF5").opacity(0.3), radius: 10, x: 0, y: 5)
        }
        .padding(.horizontal, 24)
    }
}
