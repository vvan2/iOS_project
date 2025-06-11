//
//  LectureDetailDialog.swift
//  iOS_project
//
//  Created by sonjuwan on 6/10/25.
//

import Foundation
import SwiftUI

struct LectureDetailDialog: View {
    let lecture: Lecture
    let day: String
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // Header with colored accent
            VStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(hex: lecture.colorHex))
                    .frame(width: 40, height: 4)
                
                Text(lecture.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            
            // Lecture Details
            VStack(spacing: 16) {
                DetailRow(
                    icon: "person.fill",
                    title: "교수님",
                    value: lecture.professor,
                    color: Color(hex: lecture.colorHex)
                )
                
                DetailRow(
                    icon: "calendar",
                    title: "요일",
                    value: "\(day)요일",
                    color: Color(hex: lecture.colorHex)
                )
                
                DetailRow(
                    icon: "clock.fill",
                    title: "시간",
                    value: lecture.timeRange,
                    color: Color(hex: lecture.colorHex)
                )
            }
            
            // Close Button
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                    isShowing = false
                }
            }) {
                Text("확인")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: lecture.colorHex),
                                        Color(hex: lecture.colorHex).opacity(0.8)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    )
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.regularMaterial)
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
        )
        .padding(.horizontal, 40)
    }
}
