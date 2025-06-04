import SwiftUI

struct ScheduleView: View {
    @State private var selectedTab: Int = 0

    var formattedDate: String {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd"
        return formatter.string(from: today)
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                // 상단 보라색 배경
                ZStack(alignment: .topLeading) {
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#7A5FFF"), Color(hex: "#BCA5FF")]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 240)
                    .overlay(
                        VStack(spacing: 20) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                    .padding(.top, 50)
                                Spacer()
                                Image(systemName: "eyes.inverse") // 대체 아이콘
                                    .foregroundColor(.white)
                                    .padding(.trailing)
                                    .padding(.top, 50)
                            }

                            // 날짜 카드
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .frame(width: 180, height: 70)

                                Text(formattedDate)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color(hex: "#7A5FFF"))
                            }
                            .padding(.top, 20)

                            // 탭 선택
                            HStack {
                                Button(action: { selectedTab = 0 }) {
                                    Text("일간 시간표")
                                        .foregroundColor(selectedTab == 0 ? .white : Color(hex: "#7A5FFF"))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedTab == 0 ? Color(hex: "#7A5FFF") : .white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: "#7A5FFF"), lineWidth: 1)
                                        )
                                }

                                Button(action: { selectedTab = 1 }) {
                                    Text("월간 시간표")
                                        .foregroundColor(selectedTab == 1 ? .white : Color(hex: "#7A5FFF"))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedTab == 1 ? Color(hex: "#7A5FFF") : .white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(hex: "#7A5FFF"), lineWidth: 1)
                                        )
                                }
                            }

                        }
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                    )
                }

                // 콘텐츠 영역
                if selectedTab == 0 {
                    DayScheduleView()
                } else {
                    MonthCalendarView()
                }

                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

