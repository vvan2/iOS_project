import SwiftUI

struct ScheduleView: View {
    @State private var selectedTab: Int = 0

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
                    .frame(height: 200)
                    .overlay(
                        VStack(spacing: 20) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "eyes.inverse") // 대체 아이콘
                                    .foregroundColor(.white)
                                    .padding(.trailing)
                            }

                            // 날짜 카드
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .frame(width: 180, height: 70)

                                Text("25/06/02")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color(hex: "#7A5FFF"))
                            }

                            // 탭 선택
                            HStack {
                                Button(action: { selectedTab = 0 }) {
                                    Text("일간 시간표")
                                        .foregroundColor(selectedTab == 0 ? .white : .white.opacity(0.6))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedTab == 0 ? Color(hex: "#7A5FFF") : .clear)
                                        .cornerRadius(8)
                                }

                                Button(action: { selectedTab = 1 }) {
                                    Text("월간 시간표")
                                        .foregroundColor(selectedTab == 1 ? .white : .white.opacity(0.6))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedTab == 1 ? Color(hex: "#7A5FFF") : .clear)
                                        .cornerRadius(8)
                                }
                            }
                        }
                            .padding(.top, 40)
                            .padding(.bottom, 40)
                       
                    )
                }

                // 콘텐츠 영역
                if selectedTab == 0 {
                    // 일간 시간표
                    DayScheduleView()
                } else {
                    // 월간 시간표
                    MonthCalendarView()
                }

                Spacer()
            }

        }
        .ignoresSafeArea(edges: .top)
    }
}


