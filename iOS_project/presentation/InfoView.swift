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
                    url: "https://do.it.ac.kr"
                )

                // 졸업 & 장소 예약
                HStack(spacing: 16) {
                    InfoCardView(
                        title: "졸업",
                        subtitle: "졸업요건, 학점이수 현황",
                        url: "https://www.univ.ac.kr/graduation"
                    )
                    InfoCardView(
                        title: "장소 예약",
                        subtitle: "스터디룸 / 강의실 예약",
                        url: "https://www.univ.ac.kr/room"
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

            // 하단 캐릭터 (깔끔하게)
            ZStack(alignment: .topLeading) {
                // 반원 얼굴
                Circle()
                    .trim(from: 0, to: 0.5)
                    .rotation(.degrees(180))
                    .fill(Color(hex: "#9A83F7"))
                    .frame(width: 180, height: 180)
                    .shadow(radius: 4)
                    .overlay(
                        VStack(spacing: 8) {
                            // 눈
                            HStack(spacing: 12) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 14, height: 20)
                                Circle()
                                    .fill(.white)
                                    .frame(width: 14, height: 20)
                            }
                            // 입
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.white.opacity(0.8))
                                .frame(width: 28, height: 4)
                        }
                        .offset(y: 30)
                    )

                // 느낌표
                Text("!  !")
                    .font(.caption2)
                    .foregroundColor(.white.opacity(0.8))
                    .offset(x: 24, y: 10)
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .padding(.leading, 12)
            .padding(.bottom, 10)
        }
    }
}

