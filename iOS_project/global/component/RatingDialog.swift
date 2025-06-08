//
//  RatingDialog.swift
//  iOS_project
//
//  Created by sonjuwan on 6/8/25.
//

import Foundation
import SwiftUI

struct RatingDialog: View {
    @Binding var rating: Int
    var onConfirm: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Text("서비스 이용 만족도를 평가해주세요")
                .font(.headline)

            HStack(spacing: 12) {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= rating ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.yellow)
                        .onTapGesture { rating = star }
                }
            }

            Button("확인") {
                onConfirm()
            }
            .font(.system(size: 16, weight: .semibold))
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding(40)
    }
}
