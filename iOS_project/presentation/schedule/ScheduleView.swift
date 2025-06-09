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
                // Enhanced Header with Glass Effect
                ZStack(alignment: .topLeading) {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hex: "#667eea"),
                            Color(hex: "#9080ed"),
                            Color(hex: "#BCA5FF")
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 280)
                    .overlay(
                        // Subtle pattern overlay
                        Rectangle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.1),
                                        Color.clear
                                    ]),
                                    center: .topTrailing,
                                    startRadius: 10,
                                    endRadius: 200
                                )
                            )
                    )
                    .overlay(
                        VStack(spacing: 24) {
                            // Top Icons with better spacing
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "questionmark.circle.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white.opacity(0.9))
                                        .background(
                                            Circle()
                                                .fill(Color.white.opacity(0.15))
                                                .frame(width: 36, height: 36)
                                        )
                                }
                                .padding(.leading, 20)
                                .padding(.top, 50)
                                
                                Spacer()
                                
                                Button(action: {}) {
                                    Image(systemName: "bell.fill")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white.opacity(0.9))
                                        .background(
                                            Circle()
                                                .fill(Color.white.opacity(0.15))
                                                .frame(width: 36, height: 36)
                                        )
                                }
                                .padding(.trailing, 20)
                                .padding(.top, 50)
                            }

                            // Enhanced Date Card with Shadow
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 80)
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)

                                VStack(spacing: 4) {
                                    Text("Today")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text(formattedDate)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(Color(hex: "#BCA5FF"))
                                }
                            }
                            .padding(.top, 10)

                            // Enhanced Tab Selection
                            HStack(spacing: 12) {
                                TabButton(
                                    title: "일간 시간표",
                                    isSelected: selectedTab == 0,
                                    action: { selectedTab = 0 }
                                )
                                
                                TabButton(
                                    title: "월간 시간표",
                                    isSelected: selectedTab == 1,
                                    action: { selectedTab = 1 }
                                )
                            }
                            .padding(.horizontal, 20)
                        }
                        .padding(.bottom, 30)
                    )
                }

                // Content Area
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
#Preview{
    ScheduleView()
}
