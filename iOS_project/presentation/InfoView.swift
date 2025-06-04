import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // 배경
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#E9DBFF"), Color(hex: "#CFC3F9")]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                // 상단 로고
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.8), lineWidth: 1.5)
                            .frame(width: 60, height: 60)
                        Text("Buggi\nMate")
                            .font(.custom("Marker Felt", size: 10))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    Spacer()
                }

                // 비교과
                InfoCardView(
                    title: "비교과",
                    subtitle: "워크숍, 특강 등 다양한 프로그램",
                    url: "https://hsportal.hansung.ac.kr"
                )

                // 졸업 & 장소 예약
                HStack(spacing: 16) {
                    InfoCardView(
                        title: "졸업",
                        subtitle: "졸업요건, 학점이수 현황",
                        url: "https://hansung.ac.kr/eduinfo/3816/subview.do"
                    )
                    InfoCardView(
                        title: "장소 예약",
                        subtitle: "스터디룸 / 강의실 예약",
                        url: "https://www.hansung.ac.kr/onestop/8952/subview.do"
                    )
                }

                // 강의 후기
                InfoCardView(
                    title: "강의 후기",
                    subtitle: "학생들의 생생한 수강평",
                    url: "https://everytime.kr"
                )

                Spacer()
            }
            .padding(.top, 40)
            .padding(.horizontal)

            // 하단 캐릭터 (탭바 위에 딱 붙게)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack(alignment: .top) {
                        // 반원
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .rotation(.degrees(180))
                            .fill(Color(hex: "#9A83F7"))
                            .frame(width: 220, height: 220)
                            .shadow(radius: 4)

                        // 눈 + 입
                        VStack(spacing: 10) {
                            HStack(spacing: 16) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 16, height: 24)
                                Circle()
                                    .fill(.white)
                                    .frame(width: 16, height: 24)
                            }

                            RoundedRectangle(cornerRadius: 2)
                                .fill(.white.opacity(0.7))
                                .frame(width: 30, height: 4)
                        }
                        .offset(y: 40)
                    }
                    .frame(width: 220, height: 110)
                    .position(x: UIScreen.main.bounds.width - 110, y: UIScreen.main.bounds.height - 150)
                    .ignoresSafeArea()
                }
            }

        }
    }
}

