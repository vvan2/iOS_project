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
    
    var body: some View {
        VStack {
            Text("6월")
                .font(.title3)
                .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                // 요일 표시
                ForEach(["일", "월", "화", "수", "목", "금", "토"], id: \.self) {
                    Text($0)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                // 날짜 표시
                ForEach(1..<32) { day in
                    VStack {
                        // 날짜 표시
                        Text("\(day)")
                            .frame(maxWidth: .infinity)
                            .padding(4)
                            .background(Circle().fill(Color.white).opacity(0.3))
                            .foregroundColor(.black.opacity(0.7))
                        
                        // 해당 날짜의 일정이나 메모 표시
                        if let event = calendarData[day] {
                            Text(event)
                                .font(.footnote)
                                .foregroundColor(.purple)
                        }
                    }
                    .frame(height: 60)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MonthCalendarView()
}
