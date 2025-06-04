import SwiftUI


struct DayScheduleView: View {
    let days = ["월", "화", "수", "목", "금"]
    let timeBlocks = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]

    @State private var showDialog = false
    @State private var lectures: [Lecture] = []

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                // 요일 헤더
                HStack(spacing: 8) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.12))
                            .cornerRadius(8)
                    }
                }

                // 시간표 그리드
                HStack(spacing: 8) {
                    ForEach(0..<5) { dayIndex in
                        VStack(spacing: 4) {
                            ForEach(timeBlocks, id: \.self) { time in
                                ZStack {
                                    // 기본 시간블럭
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color.gray.opacity(0.1))
                                        .frame(height: 44)

                                    // 시간표 그리드 내부
                                    if let lecture = lectures.first(where: { $0.dayIndex == dayIndex && $0.timeRange.contains(time) }) {
                                        VStack(spacing: 2) {
                                            Text(lecture.title).font(.caption2).bold()
                                            Text(lecture.professor).font(.caption2)
                                            Text(lecture.timeRange).font(.caption2)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(4)
                                        .background(Color(hex: lecture.colorHex)) 
                                        .foregroundColor(.white)
                                        .cornerRadius(6)
                                    }

                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            // Floating Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showDialog = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color(hex: "#A28CF5"))
                            .cornerRadius(30)
                            .shadow(radius: 4)
                    }
                    .padding()
                }
            }

            // Dialog
            if showDialog {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showDialog = false }

                AddLectureDialog { newLecture in
                    lectures.append(newLecture)
                    showDialog = false
                }
            }
        }
    }
}
