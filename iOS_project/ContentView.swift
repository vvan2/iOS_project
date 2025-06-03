//
//  ContentView.swift
//  iOS_project
//
//  Created by sonjuwan on 6/2/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Buggi Mate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("스케줄링 일상 메이트")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}


#Preview {
    SplashView()
}
