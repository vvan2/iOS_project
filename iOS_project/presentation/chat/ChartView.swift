import SwiftUI

struct ChatView: View {
    @State private var animateWobble = false
    @State private var animateGlow = false
    
    let quickQuestions = [
        "오늘 일정이 뭐야?",
        "과제 마감일 알려줘",
        "동아리 추천해줘",
        "학점 계산해줘"
    ]
    
    var body: some View {
        ZStack {
            // 배경 그라데이션
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#A28CF5"),
                    Color(hex: "#B5A0F7"),
                    Color(hex: "#C4B2F9")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 상단 헤더
                HStack {
                    Text("Buggi chat")
                        .font(.custom("Marker Felt", size: 28))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.white, .white.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 20)
                
                Spacer()
                
                // 메인 컨텐츠
                VStack(spacing: 32) {
                    // 메인 텍스트
                    VStack(spacing: 12) {
                        Image("img_main_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
//                            .rotationEffect(.degrees(animateWobble ? 8 : -8))
//                            .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateWobble)
                        
                        Text("궁금한 것을 Buggi 한테 물어봐!")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .multilineTextAlignment(.center)
                    }
                    
                    // 빠른 질문 버튼들
                    VStack(spacing: 12) {
                        Text("자주 묻는 질문")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 14, weight: .medium))
                        
                        VStack(spacing: 8) {
                            ForEach(quickQuestions, id: \.self) { question in
                                Button(action: {
                                    // 질문 선택 액션
                                }) {
                                    HStack {
                                        Text(question)
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                        Spacer()
                                        Image(systemName: "arrow.right.circle.fill")
                                            .foregroundColor(.white.opacity(0.7))
                                            .font(.system(size: 16))
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                            .opacity(0.3)
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // 메인 채팅 시작 카드
                    VStack(spacing: 20) {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(.ultraThinMaterial)
                            .frame(width: 280, height: 200)
                            .overlay(
                                VStack(spacing: 20) {
                                    // 채팅 미리보기
                                    VStack(spacing: 12) {
                                        HStack(spacing: 8) {
                                            Circle()
                                                .fill(Color(hex: "#A28CF5"))
                                                .frame(width: 32, height: 32)
                                                .overlay(
                                                    Image("img_main_1")
                                                        .scaledToFit()
                                                        .frame(width: 40, height: 40)
                                                
                                                )
                                            
                                            VStack(alignment: .leading, spacing: 2) {
                                                Text("Buggi")
                                                    .font(.system(size: 12, weight: .semibold))
                                                    .foregroundColor(.primary)
                                                Text("안녕하세요! 무엇을 도와드릴까요?")
                                                    .font(.system(size: 11))
                                                    .foregroundColor(.secondary)
                                            }
                                            
                                            Spacer()
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(12)
                                    }
                                    
                                    // 시작 버튼
                                    NavigationLink(destination: ChatRoomView()) {
                                        HStack {
                                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                                .font(.system(size: 16))
                                            Text("채팅 시작하기")
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 24)
                                        .padding(.vertical, 12)
                                        .background(
                                            LinearGradient(
                                                colors: [Color(hex: "#A28CF5"), Color(hex: "#926CE3")],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .cornerRadius(25)
//                                        .shadow(color: Color(hex: "#926CE3").opacity(0.3), radius: 8, x: 0, y: 4)
//                                        .scaleEffect(animateGlow ? 1.05 : 1.0)
//                                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateGlow)
                                    }
                                }
                                    .padding(20)
                            )
                        
                        // 기능 소개
                        VStack(spacing: 8) {
                            HStack(spacing: 16) {
                                FeatureIcon(icon: "brain.head.profile", text: "AI 도우미")
                                FeatureIcon(icon: "calendar", text: "일정 관리")
                                FeatureIcon(icon: "lightbulb.fill", text: "맞춤 추천")
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            // 하단 캐릭터
            //            VStack {
            //                Spacer()
            //                HStack {
            //                    Spacer()
            //                    ZStack(alignment: .top) {
            //                        // 반원 몸체
            //                        Circle()
            //                            .trim(from: 0, to: 0.5)
            //                            .rotation(.degrees(180))
            //                            .fill(
            //                                LinearGradient(
            //                                    colors: [Color(hex: "#926CE3"), Color(hex: "#8A5FE0")],
            //                                    startPoint: .top,
            //                                    endPoint: .bottom
            //                                )
            //                            )
            //                            .frame(width: 200, height: 200)
            //                            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
            //
            //                        // 얼굴 표정
            //                        VStack(spacing: 12) {
            //                            HStack(spacing: 18) {
            //                                Circle()
            //                                    .fill(.white)
            //                                    .frame(width: 16, height: 20)
            //                                    .overlay(
            //                                        Circle()
            //                                            .fill(.black)
            //                                            .frame(width: 6, height: 6)
            //                                            .offset(x: animateFloat ? 2 : -2, y: 0)
            //                                    )
            //                                Circle()
            //                                    .fill(.white)
            //                                    .frame(width: 16, height: 20)
            //                                    .overlay(
            //                                        Circle()
            //                                            .fill(.black)
            //                                            .frame(width: 6, height: 6)
            //                                            .offset(x: animateFloat ? 2 : -2, y: 0)
            //                                    )
            //                            }
            //
            //                            RoundedRectangle(cornerRadius: 3)
            //                                .fill(.white.opacity(0.8))
            //                                .frame(width: 24, height: 4)
            //                        }
            //                        .offset(y: 35)
            //                    }
            //                    .frame(width: 200, height: 100)
            //                    .position(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height - 140)
            //                    .ignoresSafeArea()
            //                }
            //            }
            //        }
            .onAppear {
                animateWobble = true
                animateGlow = true
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
