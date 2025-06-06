//
//  FeatureIcon.swift
//  iOS_project
//
//  Created by sonjuwan on 6/5/25.
//

import SwiftUI

struct FeatureIcon: View {
    let icon: String
    let text: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(Color(hex: "#A28CF5"))
                .frame(width: 36, height: 36)
                .background(Circle().fill(.ultraThinMaterial))
            
            Text(text)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.secondary)
        }
    }
}
