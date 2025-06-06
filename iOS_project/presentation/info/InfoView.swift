import SwiftUI

struct InfoView: View {
    @State private var animateCards = false
    @State private var showCharacter = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // 배경 그라디언트
                backgroundGradient
                
                // 플로팅 요소들
                floatingElements
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 28) {
                        // 상단 로고 헤더
                        headerSection
                            .padding(.top, 60)
                        
                        // 메인 카드들
                        mainCardsSection
                        
                        // 하단 여백 (캐릭터 공간 확보)
                        Spacer()
                            .frame(height: 120)
                    }
                    .padding(.horizontal, 20)
                }
                
                // 하단 캐릭터
                bottomCharacter
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.spring(response: 1.0, dampingFraction: 0.8)) {
                    animateCards = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.spring(response: 1.2, dampingFraction: 0.7)) {
                        showCharacter = true
                    }
                }
            }
        }
    }
    
    // MARK: - 배경 그라디언트
    private var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(hex: "#F3EFFF"), location: 0.0),
                .init(color: Color(hex: "#E9DBFF"), location: 0.4),
                .init(color: Color(hex: "#DFD2FF"), location: 0.7),
                .init(color: Color(hex: "#CFC3F9"), location: 1.0)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - 플로팅 요소들
    private var floatingElements: some View {
        ZStack {
            // 큰 원들
            Circle()
                .fill(Color.white.opacity(0.1))
                .frame(width: 200, height: 200)
                .offset(x: -100, y: -50)
                .blur(radius: 5)
            
            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 150, height: 150)
                .offset(x: 120, y: 100)
                .blur(radius: 3)
            
            Circle()
                .fill(Color.white.opacity(0.06))
                .frame(width: 100, height: 100)
                .offset(x: -50, y: 200)
                .blur(radius: 2)
                
            // 작은 반짝이는 점들
            ForEach(0..<8, id: \.self) { index in
                Circle()
                    .fill(Color.white.opacity(0.4))
                    .frame(width: 6, height: 6)
                    .offset(
                        x: CGFloat.random(in: -150...150),
                        y: CGFloat.random(in: -200...300)
                    )
                    .scaleEffect(animateCards ? 1.0 : 0.3)
                    .animation(
                        .easeInOut(duration: 2.0)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.3),
                        value: animateCards
                    )
            }
        }
    }
    
    // MARK: - 헤더 섹션
    private var headerSection: some View {
        HStack {
            // 로고
            ZStack {
                // 외부 링
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.8), Color.white.opacity(0.4)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
                    .frame(width: 70, height: 70)
                    .scaleEffect(animateCards ? 1.0 : 0.8)
                
                // 내부 원
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 65, height: 65)
                    .blur(radius: 1)
                
                // 텍스트
                VStack(spacing: 2) {
                    Text("Buggi")
                        .font(.custom("Marker Felt", size: 12))
                        .fontWeight(.bold)
                    Text("Mate")
                        .font(.custom("Marker Felt", size: 10))
                        .fontWeight(.medium)
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, Color.white.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: Color.black.opacity(0.3), radius: 2, x: 0, y: 1)
            }
            .scaleEffect(animateCards ? 1.0 : 0.8)
            .rotationEffect(.degrees(animateCards ? 0 : -15))
            
            Spacer()
            
            // 헤더 타이틀
            VStack(alignment: .trailing, spacing: 4) {
                Text("정보 센터")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                
                Text("필요한 정보를 한눈에")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
            }
            .opacity(animateCards ? 1.0 : 0.0)
            .offset(x: animateCards ? 0 : 30)
        }
        .padding(.horizontal, 4)
    }
    
    // MARK: - 메인 카드 섹션
    private var mainCardsSection: some View {
        VStack(spacing: 20) {
            // 비교과 (대형 카드)
            modernInfoCard(
                title: "비교과",
                subtitle: "워크숍, 특강 등 다양한 프로그램",
                url: "https://hsportal.hansung.ac.kr",
                icon: "graduationcap.circle.fill",
                colors: [Color(hex: "#FF6B6B"), Color(hex: "#FF8E8E")],
                isLarge: true,
                index: 0
            )
            
            // 졸업 & 장소 예약 (2개 카드)
            HStack(spacing: 16) {
                modernInfoCard(
                    title: "졸업",
                    subtitle: "졸업요건, 학점이수 현황",
                    url: "https://hansung.ac.kr/eduinfo/3816/subview.do",
                    icon: "medal.fill",
                    colors: [Color(hex: "#4ECDC4"), Color(hex: "#6ED7D3")],
                    isLarge: false,
                    index: 1
                )
                
                modernInfoCard(
                    title: "장소 예약",
                    subtitle: "스터디룸 / 강의실 예약",
                    url: "https://www.hansung.ac.kr/onestop/8952/subview.do",
                    icon: "building.2.fill",
                    colors: [Color(hex: "#45B7D1"), Color(hex: "#6BC5D2")],
                    isLarge: false,
                    index: 2
                )
            }
            
            // 강의 후기 (대형 카드)
            modernInfoCard(
                title: "강의 후기",
                subtitle: "학생들의 생생한 수강평",
                url: "https://everytime.kr",
                icon: "star.circle.fill",
                colors: [Color(hex: "#F7B733"), Color(hex: "#F9CA24")],
                isLarge: true,
                index: 3
            )
            
            // 학식 메뉴 (대형 카드)
            modernInfoCard(
                title: "학식 메뉴",
                subtitle: "오늘의 학식은?",
                url: "https://www.hansung.ac.kr/hansung/1920/subview.do",
                icon: "fork.knife.circle.fill",
                colors: [Color(hex: "#A28CF5"), Color(hex: "#B8A9FF")],
                isLarge: true,
                index: 4
            )
        }
    }
    
    // MARK: - 모던 정보 카드
    private func modernInfoCard(
        title: String,
        subtitle: String,
        url: String,
        icon: String,
        colors: [Color],
        isLarge: Bool,
        index: Int
    ) -> some View {
        Button(action: {
            // URL 열기 액션
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        }) {
            ZStack {
                // 배경 그라디언트
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                // 글래스모피즘 오버레이
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.2))
                    .blur(radius: 0.5)
                
                // 하이라이트
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.6), Color.clear],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
                
                // 컨텐츠
                VStack(alignment: .leading, spacing: isLarge ? 16 : 12) {
                    HStack {
                        // 아이콘
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.3))
                                .frame(width: isLarge ? 50 : 40, height: isLarge ? 50 : 40)
                            
                            Image(systemName: icon)
                                .font(.system(size: isLarge ? 22 : 18, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // 화살표
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    // 텍스트
                    VStack(alignment: .leading, spacing: 6) {
                        Text(title)
                            .font(.system(size: isLarge ? 20 : 16, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                        
                        Text(subtitle)
                            .font(.system(size: isLarge ? 14 : 12, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(isLarge ? 24 : 18)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: isLarge ? 140 : 120)
            .shadow(color: colors.first?.opacity(0.3) ?? Color.clear, radius: 12, x: 0, y: 6)
            .scaleEffect(animateCards ? 1.0 : 0.9)
            .opacity(animateCards ? 1.0 : 0.0)
            .offset(y: animateCards ? 0 : 20)
            .animation(
                .spring(response: 0.8, dampingFraction: 0.7)
                .delay(Double(index) * 0.1),
                value: animateCards
            )
        }
        .buttonStyle(CardButtonStyle())
    }
    
    // MARK: - 하단 캐릭터
    private var bottomCharacter: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                ZStack(alignment: .bottom) {
                    // 캐릭터 섀도우
                    Ellipse()
                        .fill(Color.black.opacity(0.1))
                        .frame(width: 180, height: 40)
                        .blur(radius: 8)
                        .offset(y: 20)
                    
                    // 메인 캐릭터
                    ZStack(alignment: .top) {
                        // 바디 (반원)
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .rotation(.degrees(180))
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "#B8A9FF"),
                                        Color(hex: "#9A83F7")
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 200, height: 200)
                            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                        
                        // 하이라이트
                        Circle()
                            .trim(from: 0, to: 0.5)
                            .rotation(.degrees(180))
                            .stroke(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.4), Color.clear],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                            .frame(width: 200, height: 200)
                        
                        // 얼굴 (눈 + 입)
                        VStack(spacing: 12) {
                            // 눈
                            HStack(spacing: 20) {
                                ForEach(0..<2, id: \.self) { _ in
                                    Ellipse()
                                        .fill(Color.white)
                                        .frame(width: 18, height: 28)
                                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                                }
                            }
                            
                            // 입
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white.opacity(0.8))
                                .frame(width: 35, height: 5)
                                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        }
                        .offset(y: 45)
                        .scaleEffect(showCharacter ? 1.0 : 0.8)
                        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.2), value: showCharacter)
                    }
                    .frame(width: 200, height: 100)
                    .scaleEffect(showCharacter ? 1.0 : 0.8)
                    .offset(y: showCharacter ? 0 : 30)
                    .opacity(showCharacter ? 1.0 : 0.0)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    InfoView()
}
