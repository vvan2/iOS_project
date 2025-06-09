import SwiftUI

struct MonthCalendarView: View {
    let calendarData: [Int: String] = [
        1: "회의", 5: "운동", 10: "프로젝트 마감",
        15: "여행 준비", 20: "친구와 만남", 25: "미팅", 30: "장보기"
    ]
    
    let firstDayOfMonth = 5
    let numberOfDaysInMonth = 30

    var body: some View {
        VStack(spacing: 24) {
            // Enhanced Month Header
            HStack {
                Text("6월 2024")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(hex: "#667EEA"))
                        .frame(width: 32, height: 32)
                        .background(
                            Circle()
                                .fill(Color(hex: "#667EEA").opacity(0.1))
                        )
                }
                
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(hex: "#667EEA"))
                        .frame(width: 32, height: 32)
                        .background(
                            Circle()
                                .fill(Color(hex: "#667EEA").opacity(0.1))
                        )
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)

            // Enhanced Calendar Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 12) {
                // Day Headers
                ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) { dayOfWeek in
                    Text(dayOfWeek)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.secondary)
                        .frame(height: 24)
                }

                // Empty spaces for month start
                ForEach(0..<firstDayOfMonth, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 85)
                }

                // Calendar Days
                ForEach(1...numberOfDaysInMonth, id: \.self) { day in
                    VStack(spacing: 6) {
                        Text("\(day)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                        
                        if let event = calendarData[day] {
                            Text(event)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color(hex: "#FF6B6B"),
                                                    Color(hex: "#FF8E85")
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                )
                                .lineLimit(1)
                        } else {
                            Text(" ")
                                .font(.system(size: 10))
                                .opacity(0)
                        }
                        
                        Spacer()
                    }
                    .frame(height: 85)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                day == 15 ? // Today highlight
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "#667EEA").opacity(0.1),
                                        Color(hex: "#764BA2").opacity(0.1)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ) :
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.gray.opacity(0.04),
                                        Color.gray.opacity(0.08)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                day == 15 ? Color(hex: "#667EEA").opacity(0.3) : Color.clear,
                                lineWidth: 2
                            )
                    )
                    .scaleEffect(day == 15 ? 1.02 : 1.0)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

#Preview {
    ScheduleView()
}
