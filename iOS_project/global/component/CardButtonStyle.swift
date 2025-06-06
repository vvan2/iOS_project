//
//  CardButtonStyle.swift
//  iOS_project
//
//  Created by sonjuwan on 6/5/25.
//

import Foundation
import SwiftUI

struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
