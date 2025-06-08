//
//  TabButton.swift
//  iOS_project
//
//  Created by sonjuwan on 6/8/25.
//

import Foundation
import SwiftUI

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(isSelected ? .white : Color(hex: "#BCA5FF"))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Group {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(hex: "#BCA5FF"))
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(hex: "#BCA5FF").opacity(0.3), lineWidth: 1)
                                )
                        }
                    }
                )
                .shadow(color: isSelected ? Color(hex: "#BCA5FF").opacity(0.3) : Color.clear, radius: 8, x: 0, y: 4)
        }
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
