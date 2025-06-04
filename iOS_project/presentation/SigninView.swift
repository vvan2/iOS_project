import SwiftUI

struct SignInView: View {
    /// 로그인 완료 시 호출되는 클로저
    var onLogin: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // ────────────────────────────────────────────────────────────────
            // 1) 상단 그라디언트 배경 + 모든 콘텐츠 (이미지, 타이틀, 설명문 등)
            // ────────────────────────────────────────────────────────────────
            ZStack {
                // 1-1) 보라색 위→연보라색 아래 그라디언트
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "#A28CF5"),
                        Color(hex: "#D9D2FB")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack(spacing: 32) {
                    // ── 상단 왼쪽 캐릭터 이미지 (img_main_1) ──
                    HStack {
                        Image("img_main_2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .padding(.leading, 24)
                            .padding(.top, 60)
                        Spacer()
                    }

                    // ── 중앙 원형 타이틀 (Buggi Mate) ──
                    ZStack {
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 2)
                            .frame(width: 140, height: 140)

                        VStack(spacing: 4) {
                            Text("Buggi")
                            Text("Mate")
                        }
                        .font(.custom("Marker Felt", size: 28))
                        .foregroundColor(.white)
                    }

                    // ── 설명 문구 (줄바꿈 + 고정되지 않도록) ──
                    VStack(spacing: 12) {
                        Text("대학생활 정보의 집약체!")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)

                        Text("개인 일정을 관리하고\n학교생활에 모든 정보를 한눈에 봐요!")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true) // 세로로 스크롤되지 않도록
                    }
                    .padding(.horizontal, 24) // 좌우 여백을 줘서 잘리지 않도록

                    Spacer()

                    // ── 하단 오른쪽 캐릭터 이미지 (img_main_2) ──
                    HStack {
                        Spacer()
                        Image("img_main_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 24)
                            .padding(.bottom, 20)
                    }
                }
            }
            // Note: frame(height:) 을 제거하여 VStack이 화면에 맞춰 유연하게 늘어나도록 함
            // ────────────────────────────────────────────────────────────────


            // ────────────────────────────────────────────────────────────────
            // 2) 하단 흰색 영역 – “로그인하기” 버튼만
            // ────────────────────────────────────────────────────────────────
            VStack {
                Button(action: {
                    // 로그인 성공 시 onLogin() 호출
                    onLogin()
                }) {
                    Text("로그인하기")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color(hex: "#A28CF5"))
                        .cornerRadius(20)
                        .padding(.horizontal, 40)
                        .padding(.top, 40) // 버튼과 상단 콘텐츠 사이 간격
                }
                

                Spacer()
            }
            NavigationLink {
                                    SignUpStep1View()
                                } label: {
                                    Text("회원가입하기")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(Color(hex: "#A28CF5"))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 48)
                                        .background(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color(hex: "#A28CF5"), lineWidth: 2)
                                        )
                                        .cornerRadius(20)
                                        .padding(.horizontal, 40)
                                }
            .background(Color.white)
        }
    }
}

#Preview {
    SignInView(onLogin: {
        // 여기에 미리보기용 래치나 별도 동작이 필요하다면 작성
    })
}
