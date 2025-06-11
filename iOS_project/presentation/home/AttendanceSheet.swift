//
//  AttendanceSheet.swift
//  iOS_project
//
//  Created by sonjuwan on 6/11/25.
//

import Foundation
import SwiftUI


struct AttendanceSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLecture: String?
    @State private var attendanceCode = ""
    @State private var showingSuccess = false

    let availableLectures = [
        "데이터베이스 시스템",
        "소프트웨어 공학",
        "알고리즘 및 자료구조",
        "인공지능 개론"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient
                VStack(spacing: 32) {
                    headerIcon
                    headerText
                    lectureSelectionView
                    codeInputView
                    submitButton
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { closeButton }
            .alert("출석 완료", isPresented: $showingSuccess) {
                Button("확인") { dismiss() }
            } message: {
                Text("\(selectedLecture ?? "") 강의가 성공적으로 출석 처리되었습니다.")
            }
        }
    }

    // MARK: – Background
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color(hex: "#F8F7FF"), .white],
            startPoint: .top, endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    // MARK: – Header
    private var headerIcon: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(hex: "#9C6ADE").opacity(0.2),
                                 Color(hex: "#7B4ECB").opacity(0.1)],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .frame(width: 100, height: 100)
            Image(systemName: "hand.raised.fill")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(Color(hex: "#8B5FBF"))
        }
        .padding(.top, 20)
    }

    private var headerText: some View {
        VStack(spacing: 8) {
            Text("강의 출석")
                .font(.system(size: 28, weight: .bold, design: .rounded))
            Text("수강 중인 강의를 선택하고 출석 코드를 입력하세요")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }

    // MARK: – Lecture Selection
    private var lectureSelectionView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("강의 선택")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
            VStack(spacing: 12) {
                ForEach(availableLectures, id: \.self) { lecture in
                    Button {
                        withAnimation(.spring(response: 0.3)) {
                            selectedLecture = lecture
                        }
                    } label: {
                        HStack(spacing: 16) {
                            selectionCircle(isSelected: selectedLecture == lecture)
                            Text(lecture)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selectedLecture == lecture
                                      ? Color(hex: "#9C6ADE").opacity(0.1)
                                      : .white)
                                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.horizontal, 24)
    }

    // 작은 원 그리는 컴포넌트
    private func selectionCircle(isSelected: Bool) -> some View {
        ZStack {
            Circle()
                .fill(
                    isSelected
                        ? AnyShapeStyle(
                            LinearGradient(
                                colors: [Color(hex: "#9C6ADE"), Color(hex: "#7B4ECB")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                          )
                        : AnyShapeStyle(Color.gray.opacity(0.2))
                )
                .frame(width: 20, height: 20)

            if isSelected {
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }


    // MARK: – Code Input
    private var codeInputView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("출석 코드")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
            TextField("코드를 입력하세요", text: $attendanceCode)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
        .padding(.horizontal, 24)
    }

    // MARK: – Submit Button
    private var submitButton: some View {
        Button(action: submitAttendance) {
            Text("출석 완료")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    LinearGradient(
                        colors: [Color(hex: "#9C6ADE"), Color(hex: "#7B4ECB")],
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(12)
                .shadow(color: Color(hex: "#9C6ADE").opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .disabled(selectedLecture == nil || attendanceCode.isEmpty)
        .padding(.horizontal, 24)
    }

    // MARK: – Toolbar
    private var closeButton: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button("닫기") { dismiss() }
                .foregroundColor(.secondary)
        }
    }

    // MARK: – Action
    private func submitAttendance() {
        // 실제 로직을 여기에
        showingSuccess = true
    }
}
