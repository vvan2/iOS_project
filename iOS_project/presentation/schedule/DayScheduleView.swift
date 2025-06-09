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
                // Enhanced Day Headers
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

                // Enhanced Schedule Grid
                ScrollView {
                    HStack(spacing: 8) {
                        ForEach(0..<5) { dayIndex in
                            VStack(spacing: 6) {
                                ForEach(timeBlocks, id: \.self) { time in
                                    ZStack {
                                        // Base Time Block with subtle gradient
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

                                        // Lecture Block
                                        if let lecture = lectures.first(where: { $0.dayIndex == dayIndex && $0.timeRange.contains(time) }) {
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

            // Enhanced Floating Button
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
                    .scaleEffect(showDialog ? 0.95 : 1.0)
                    .animation(.easeInOut(duration: 0.1), value: showDialog)
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
                }
            }

            // Enhanced Dialog
            if showDialog {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { showDialog = false }
                    .transition(.opacity)

                // Placeholder for AddLectureDialog
                VStack(spacing: 20) {
                    Text("강의 추가")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Button("취소") {
                        showDialog = false
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(30)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showDialog)
    }
}
