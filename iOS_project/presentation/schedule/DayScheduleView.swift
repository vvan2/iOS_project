import SwiftUI

struct DayScheduleView: View {
    let days = ["월", "화", "수", "목", "금"]
    let timeBlocks = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]

    @State private var showDialog = false
    @State private var lectures: [Lecture] = [
        Lecture(title: "iOS 개발", professor: "김교수", dayIndex: 0, timeRange: "09:00", colorHex: "#FF6B6B"),
        Lecture(title: "데이터베이스", professor: "이교수", dayIndex: 2, timeRange: "11:00", colorHex: "#4ECDC4")
    ]

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                // Day Headers
                HStack(spacing: 8) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.gray.opacity(0.08),
                                                Color.gray.opacity(0.15)
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                            )
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 20)

                // Time Blocks Grid
                ScrollView {
                    HStack(spacing: 8) {
                        ForEach(0..<5) { dayIndex in
                            VStack(spacing: 6) {
                                ForEach(timeBlocks, id: \.self) { time in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.gray.opacity(0.05),
                                                        Color.gray.opacity(0.12)
                                                    ]),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                            )
                                            .frame(height: 50)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                                            )

                                        if let lecture = lectures.first(where: { $0.dayIndex == dayIndex && $0.timeRange == time }) {
                                            VStack(spacing: 2) {
                                                Text(lecture.title)
                                                    .font(.system(size: 11, weight: .bold))
                                                Text(lecture.professor)
                                                    .font(.system(size: 10))
                                                    .opacity(0.9)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 6)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
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
                                                    .shadow(color: Color(hex: lecture.colorHex).opacity(0.4), radius: 4, x: 0, y: 2)
                                            )
                                            .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 20)
                }

                Spacer()
            }
            .padding(.top, 20)

            // Floating Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showDialog = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 56, height: 56)
                            .background(
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
                            )
                            .shadow(color: Color(hex: "#667EEA").opacity(0.5), radius: 12, x: 0, y: 6)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                }
            }
        }
        .sheet(isPresented: $showDialog) {
            AddLectureDialog(isPresented: $showDialog) { newLecture in
                lectures.append(newLecture)
            }
        }

    }
}
