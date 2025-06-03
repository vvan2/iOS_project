import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
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
                

                // 흰색 말풍선 + 버튼
                VStack(spacing: 14) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 220, height: 180)
                        .overlay(
                            VStack {
                                Spacer()
                                Button(action: {
                                    print("챗 시작")
                                }) {
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
                }

                Spacer()
            }


            // 하단 캐릭터 반원
            ZStack(alignment: .top) {
                // 반원 (하단 고정)
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
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 16)
     

        }
        
    }
}

#Preview {
    ChatView()
}
