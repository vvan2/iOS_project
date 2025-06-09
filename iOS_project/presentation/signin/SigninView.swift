import SwiftUI

struct SignInView: View {
    /// 로그인 완료 시 호출되는 클로저
    var onLogin: () -> Void
    
    @State private var animateTitle = false
    @State private var animateButtons = false
    @State private var animateCharacters = false
    @State private var pulseAnimation = false

    var body: some View {
        VStack(spacing: 0) {
            // ────────────────────────────────────────────────────────────────
            // 1) 상단 그라디언트 배경 + 모든 콘텐츠 (이미지, 타이틀, 설명문 등)
            // ────────────────────────────────────────────────────────────────
            ZStack {
    
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(hex: "#9C88FF"),
                        Color(hex: "#A28CF5"),
                        Color(hex: "#B8A9FF"),
                        Color(hex: "#D9D2FB")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                // 배경 장식 요소들
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 200, height: 200)
                    .offset(x: -100, y: -200)
                    .blur(radius: 20)
                
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 150, height: 150)
                    .offset(x: 120, y: -100)
                    .blur(radius: 15)

                VStack(spacing: 40) {
                    // ── 상단 왼쪽 캐릭터 이미지 (img_main_1) ──
                    HStack {
                        Image("img_main_2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                            .padding(.leading, 28)
                            .padding(.top, 40)
                            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 2, y: 4)
                            .scaleEffect(animateCharacters ? 1.0 : 0.8)
                            .animation(.spring(response: 0.8, dampingFraction: 0.6, blendDuration: 0), value: animateCharacters)
                        Spacer()
                    }

                    // ── 중앙 원형 타이틀 (Buggi Mate) - 극한 업그레이드 ──
                    ZStack {
                        // 외곽 글로우 효과
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: 160, height: 160)
                            .blur(radius: 20)
                            .scaleEffect(pulseAnimation ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: pulseAnimation)
                        
                        // 메인 원형 배경
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.3),
                                        Color.white.opacity(0.1)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 150, height: 150)
                            .overlay(
                                Circle()
                                    .strokeBorder(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.white.opacity(0.8),
                                                Color.white.opacity(0.4)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 3
                                    )
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)

                        VStack(spacing: 2) {
                            Text("Buggi")
                                .font(.custom("Marker Felt", size: 32))
                                .fontWeight(.bold)
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0.9)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 1, y: 2)
                            
                            Text("Mate")
                                .font(.custom("Marker Felt", size: 32))
                                .fontWeight(.bold)
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.white, Color.white.opacity(0.9)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 1, y: 2)
                        }
                    }
                    .scaleEffect(animateTitle ? 1.0 : 0.3)
                    .opacity(animateTitle ? 1.0 : 0.0)
                    .animation(.spring(response: 1.2, dampingFraction: 0.7, blendDuration: 0).delay(0.3), value: animateTitle)

                    VStack(spacing: 16) {
                        Text("대학생활 정보의 집약체!")
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(Color.white.opacity(0.2))
                                    .blur(radius: 10)
                            )
                            .overlay(
                                Capsule()
                                    .strokeBorder(Color.white.opacity(0.4), lineWidth: 1)
                            )

                        Text("개인 일정을 관리하고\n학교생활에 모든 정보를 한눈에 봐요!")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white, Color.white.opacity(0.95)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal, 32)
                    .opacity(animateTitle ? 1.0 : 0.0)
                    .offset(y: animateTitle ? 0 : 20)
                    .animation(.easeOut(duration: 0.8).delay(0.8), value: animateTitle)

                    Spacer()

                    HStack {
                        Spacer()
                        Image("img_main_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                            .padding(.trailing, 28)
                            .padding(.bottom, 30)
                            .shadow(color: Color.black.opacity(0.2), radius: 12, x: -2, y: 4)
                            .scaleEffect(animateCharacters ? 1.0 : 0.8)
                            .animation(.spring(response: 0.8, dampingFraction: 0.6, blendDuration: 0).delay(0.2), value: animateCharacters)
                    }
                }
            }

            // ────────────────────────────────────────────────────────
            VStack(spacing: 20) {
           
                Button(action: {
                    onLogin()
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("로그인하기")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "#9C88FF"),
                                Color(hex: "#A28CF5"),
                                Color(hex: "#B8A9FF")
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(28)
                    .shadow(color: Color(hex: "#A28CF5").opacity(0.4), radius: 15, x: 0, y: 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .strokeBorder(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.3),
                                        Color.clear
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 1
                            )
                    )
                    .padding(.horizontal, 40)
                    .padding(.top, 14)
                }
                .scaleEffect(animateButtons ? 1.0 : 0.9)
                .opacity(animateButtons ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0).delay(1.2), value: animateButtons)

                NavigationLink {
                    SignUpStep1View()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "person.badge.plus")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("회원가입하기")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(Color(hex: "#9C88FF"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white,
                                Color(hex: "#F8F7FF")
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .strokeBorder(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "#9C88FF").opacity(0.8),
                                        Color(hex: "#B8A9FF").opacity(0.6)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 2.5
                            )
                    )
                    .cornerRadius(28)
                    .shadow(color: Color(hex: "#A28CF5").opacity(0.2), radius: 10, x: 0, y: 4)
                    .padding(.horizontal, 40)
                }
                .scaleEffect(animateButtons ? 1.0 : 0.9)
                .opacity(animateButtons ? 1.0 : 0.0)
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0).delay(1.4), value: animateButtons)

                Spacer()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white,
                        Color(hex: "#FAFAFF")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .onAppear {
            animateTitle = true
            animateButtons = true
            animateCharacters = true
            pulseAnimation = true
        }
    }
}


#Preview {
    SignInView(onLogin: {
        
    })
}
