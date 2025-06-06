import SwiftUI

struct MonthCalendarView: View {
    // 날짜별 내용 데이터 예시
    let calendarData: [Int: String] = [
        1: "회의",
        5: "운동",
        10: "프로젝트 마감",
        15: "여행 준비",
        20: "친구와 만남",
        25: "미팅",
        30: "장보기"
    ]
    
    // 각 달의 시작 요일과 일수를 고려하여 조정
    let firstDayOfMonth = 1  // 6월은 1일이 금요일에 시작 (요일의 인덱스: 일=0, 월=1, ...)
    let numberOfDaysInMonth = 30

    var body: some View {
        VStack {
            Text("6월")
                .font(.title3)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 8) {
                // 요일 표시
                ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) { dayOfWeek in
                    Text(dayOfWeek)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(height: 20)
                }

                // 빈 공간을 채우기 위한 첫 번째 빈 날짜
                ForEach(0..<firstDayOfMonth, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 80)
                }

                // 날짜 표시
                ForEach(1...numberOfDaysInMonth, id: \.self) { day in
                    VStack(spacing: 4) {
                        // 날짜 표시
                        Text("\(day)")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        // 해당 날짜에 일정 내용 표시
                        if let event = calendarData[day] {
                            Text(event)
                                .font(.caption)
                                .foregroundColor(.purple)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                        } else {
                            // 내용이 없어도 동일한 공간을 차지하도록 투명한 텍스트 추가
                            Text(" ")
                                .font(.caption)
                                .opacity(0)
                        }
                        
                        Spacer()
                    }
                    .frame(height: 80)  // 모든 셀의 높이를 고정
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
            }
            .padding()
        }
    }
}

#Preview {
    MonthCalendarView()
}
