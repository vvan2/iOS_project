import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            // 배경
            Color(hex: "#A28CF5")
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // 상단 타이틀
                HStack {
                    Text("Buggi chat")
                        .font(.custom("Marker Felt", size: 24))
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                        .padding(.leading)
                    Spacer()
                }

                Spacer()

                // 중앙 텍스트
                Text("궁금한 것을 Buggi 한테 물어봐!")
                    .foregroundColor(.white)
                    .font(.subheadline)

                // 말풍선 카드 + 버튼
                RoundedRectangle(cornerRadius: 20)
                                       .fill(Color.white)
                                       .frame(width: 220, height: 180)
                                       .overlay(
                                           VStack {
                                               Spacer()
                                               NavigationLink(destination: ChatRoomView()) {
                                                   Text("시작")
                                                       .foregroundColor(.white)
                                                       .padding(.horizontal, 20)
                                                       .padding(.vertical, 6)
                                                       .background(Color(hex: "#A28CF5"))
                                                       .cornerRadius(20)
                                               }
                                               .padding(.bottom, 24)
                                           }
                    )

                Spacer()
            }

            // 하단 캐릭터 (탭바 위에 딱 붙게)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    // 캐릭터 ZStack
                    ZStack(alignment: .top) {
                        // 반원
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .rotation(.degrees(180))
                            .fill(Color(hex: "#926CE3"))
                            .frame(width: 220, height: 220)
                            .shadow(radius: 4)

                        // 눈 + 입
                        VStack(spacing: 10) {
                            HStack(spacing: 16) {
                                Circle().fill(.white).frame(width: 16, height: 24)
                                Circle().fill(.white).frame(width: 16, height: 24)
                            }

                            RoundedRectangle(cornerRadius: 2)
                                .fill(.white.opacity(0.7))
                                .frame(width: 30, height: 4)
                        }
                        .offset(y: 40)
                    }
                    .frame(width: 220, height: 110)
                    .position(x: UIScreen.main.bounds.width - 110, y: UIScreen.main.bounds.height - 152)
                    .ignoresSafeArea()

                }
            }
        }
    }
}
