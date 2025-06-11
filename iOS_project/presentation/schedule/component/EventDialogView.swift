//
//  EventDialogView.swift
//  iOS_project
//
//  Created by sonjuwan on 6/10/25.
//

import Foundation
import SwiftUI

struct EventDialogView: View {
    let day: Int
    let event: String?
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            VStack(spacing: 16) {
                HStack {
                    Spacer()
                    Button(action: {
                        isShowing = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                            .frame(width: 28, height: 28)
                            .background(
                                Circle()
                                    .fill(Color.gray.opacity(0.1))
                            )
                    }
                }
                
                VStack(spacing: 8) {
                    Text("6월 \(day)일")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("일정 정보")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 24)
            
            // Content
            VStack(spacing: 20) {
                if let event = event {
                    VStack(spacing: 16) {
                        // Event Icon
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(hex: "#667EEA"),
                                            Color(hex: "#764BA2")
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: getEventIcon(for: event))
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        // Event Details
                        VStack(spacing: 8) {
                            Text(event)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.primary)
                            
                            Text("오늘의 중요한 일정입니다")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                } else {
                    VStack(spacing: 16) {
                        // Empty State Icon
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "calendar")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.gray)
                        }
                        
                        VStack(spacing: 8) {
                            Text("일정 없음")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.primary)
                            
                            Text("이 날에는 등록된 일정이 없습니다")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                
                // Action Button
                Button(action: {
                    isShowing = false
                }) {
                    Text("확인")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "#667EEA"),
                                    Color(hex: "#764BA2")
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(24)
                }
            }
            .padding(.top, 32)
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
        )
        .frame(maxWidth: 320)
        .padding(.horizontal, 40)
    }
    
    private func getEventIcon(for event: String) -> String {
        switch event {
        case "회의", "미팅":
            return "person.3.fill"
        case "운동":
            return "figure.run"
        case "프로젝트 마감":
            return "doc.text.fill"
        case "여행 준비":
            return "airplane"
        case "친구와 만남":
            return "heart.fill"
        case "장보기":
            return "cart.fill"
        default:
            return "calendar"
        }
    }
}
