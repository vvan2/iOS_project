//
//  AnimatedProgressBar.swift
//  iOS_project
//
//  Created by sonjuwan on 6/8/25.
//

import Foundation
import SwiftUI

struct AnimatedProgressBar: View {
    let progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.white.opacity(0.2))
                .frame(height: 8)
            
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [Color(hex: "#A28CF5"), Color(hex: "#7C6AE8")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: UIScreen.main.bounds.width * 0.8 * progress, height: 8)
                .animation(.easeInOut(duration: 0.5), value: progress)
        }
        .padding(.horizontal, 20)
    }
}
