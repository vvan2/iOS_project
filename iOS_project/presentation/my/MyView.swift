import SwiftUI

struct MyView: View {
    let onLogout: () -> Void
    
    // MARK: - 상태 변수
    @State private var alarmOn = true
    @State private var adOn = true
    @State private var messageOn = true
    
    // 별점 다이얼로그 상태만 유지 (로그아웃 상태 제거)
    @State private var showRatingDialog = false
    @State private var selectedRating: Int = 0
    
    @State private var frequentlyUsedKeywords: [String] = ["iOS", "SwiftUI", "알고리즘", "데이터베이스"]
    @State private var animateProfile = false
    @State private var showKeywords = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // MARK: - 헤더 섹션
                        headerSection(geometry: geometry)
                        
                        // MARK: - 메인 컨텐츠
                        mainContent
                    }
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [ Color(hex: "#F8F6FF"), Color.white ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea(edges: .top)
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            // 프로필 애니메이션
            withAnimation(.spring(response: 1.2, dampingFraction: 0.8)) {
                animateProfile = true
            }
            // 키워드 애니메이션
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    showKeywords = true
                }
            }
        }
        // 별점 선택 다이얼로그만 유지
        .sheet(isPresented: $showRatingDialog) {
            RatingDialog(
                rating: $selectedRating,
                onConfirm: {
                    showRatingDialog = false
                    // 별점 제출 후 바로 로그아웃 처리
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        onLogout()
                    }
                }
            )
        }
        // fullScreenCover 제거
    }
    
    // MARK: - 헤더 섹션 (기존과 동일)
    private func headerSection(geometry: GeometryProxy) -> some View {
        ZStack(alignment: .topLeading) {
            // 배경 그라디언트
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(hex: "#A28CF5"), location: 0.0),
                    .init(color: Color(hex: "#8B73F5"), location: 0.6),
                    .init(color: Color(hex: "#7B5AE8"), location: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 280)
            
            decorativeElements
            
            VStack(spacing: 24) {
                // 타이틀 + 설정 버튼
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("My Buggi")
                            .font(.custom("Marker Felt", size: 32))
                            .fontWeight(.bold)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, Color.white.opacity(0.9)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                        
                        Text("나만의 공간")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.8))
                            .frame(width: 40, height: 40)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 1))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
                
                // 프로필 아바타
                profileAvatar
            }
        }
    }
    
    // MARK: - 장식적 요소 (기존과 동일)
    private var decorativeElements: some View {
        ZStack {
            Circle().fill(Color.white.opacity(0.1)).frame(width: 120, height: 120).offset(x: -50, y: 50)
            Circle().fill(Color.white.opacity(0.05)).frame(width: 80, height: 80).offset(x: 100, y: -20)
            Circle().fill(Color.white.opacity(0.08)).frame(width: 60, height: 60).offset(x: 150, y: 80)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.1))
                .frame(width: 200, height: 40)
                .blur(radius: 10)
                .offset(x: -80, y: 120)
        }
    }
    
    // MARK: - 프로필 아바타 (기존과 동일)
    private var profileAvatar: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(colors: [Color.white.opacity(0.6), Color.white.opacity(0.2)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing),
                    lineWidth: 3
                )
                .frame(width: 130, height: 130)
                .scaleEffect(animateProfile ? 1 : 0.8)
                .opacity(animateProfile ? 1 : 0.3)
            
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#B8A9FF"), Color(hex: "#9A83F7")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 110, height: 110)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                HStack(spacing: 16) {
                    ForEach(0..<2) { _ in
                        Ellipse()
                            .fill(.white)
                            .frame(width: 16, height: 26)
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                }
                .scaleEffect(animateProfile ? 1 : 0.8)
            }
            .scaleEffect(animateProfile ? 1 : 0.8)
            .rotationEffect(.degrees(animateProfile ? 0 : -10))
        }
        .padding(.bottom, 20)
    }
    
    // MARK: - 메인 컨텐츠 (기존과 동일)
    private var mainContent: some View {
        VStack(spacing: 24) {
            profileInfoCard.padding(.top, -50).zIndex(1)
            keywordsSection
            settingsSection
            actionButtons.padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - 프로필 정보 카드 (기존과 동일)
    private var profileInfoCard: some View {
        VStack(spacing: 16) {
            Text("홍길동")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
            VStack(spacing: 8) {
                profileInfoRow(icon: "studentdesk", title: "학번", value: "20230001")
                profileInfoRow(icon: "graduationcap.fill", title: "전공", value: "컴퓨터공학")
            }
        }
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.08), radius: 15, x: 0, y: 8))
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1))
    }
    
    private func profileInfoRow(icon: String, title: String, value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(hex: "#A28CF5"))
                .frame(width: 20)
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, 4)
    }
    
    // MARK: - 키워드 섹션 (기존과 동일)
    private var keywordsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "tag.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: "#A28CF5"))
                Text("자주 사용한 키워드")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                Spacer()
            }
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 8), count: 2), spacing: 8) {
                ForEach(Array(frequentlyUsedKeywords.enumerated()), id: \.offset) { index, keyword in
                    keywordTag(keyword: keyword, index: index)
                }
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4))
    }
    
    private func keywordTag(keyword: String, index: Int) -> some View {
        Text(keyword)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color(hex: "#A28CF5"))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "#A28CF5").opacity(0.1))
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color(hex: "#A28CF5").opacity(0.2), lineWidth: 1)))
            .scaleEffect(showKeywords ? 1 : 0.8)
            .opacity(showKeywords ? 1 : 0)
            .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(Double(index) * 0.1), value: showKeywords)
    }
    
    // MARK: - 설정 섹션 (기존과 동일)
    private var settingsSection: some View {
        VStack(spacing: 0) {
            modernToggleRow(title: "알람 설정", subtitle: "중요한 알림을 받아보세요", icon: "bell.fill", isOn: $alarmOn)
            Divider().padding(.leading, 60)
            modernToggleRow(title: "광고 수신", subtitle: "맞춤형 광고 정보", icon: "megaphone.fill", isOn: $adOn)
            Divider().padding(.leading, 60)
            modernToggleRow(title: "메시지 알람", subtitle: "새로운 메시지 알림", icon: "message.fill", isOn: $messageOn)
        }
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4))
    }
    
    private func modernToggleRow(title: String, subtitle: String, icon: String, isOn: Binding<Bool>) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle().fill(Color(hex: "#A28CF5").opacity(0.1)).frame(width: 44, height: 44)
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color(hex: "#A28CF5"))
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.system(size: 16, weight: .semibold)).foregroundColor(.primary)
                Text(subtitle).font(.system(size: 13)).foregroundColor(.secondary)
            }
            Spacer()
            modernToggle(isOn: isOn)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
    private func modernToggle(isOn: Binding<Bool>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(isOn.wrappedValue ? Color(hex: "#A28CF5") : Color.gray.opacity(0.3))
                .frame(width: 50, height: 30)
                .animation(.easeInOut(duration: 0.2), value: isOn.wrappedValue)
            Circle()
                .fill(.white)
                .frame(width: 26, height: 26)
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
                .offset(x: isOn.wrappedValue ? 10 : -10)
                .animation(.easeInOut(duration: 0.2), value: isOn.wrappedValue)
        }
        .onTapGesture { isOn.wrappedValue.toggle() }
    }
    
    // MARK: - 액션 버튼들 (기존과 동일)
    private var actionButtons: some View {
        VStack(spacing: 16) {
            Rectangle()
                .fill(LinearGradient(
                    colors: [.clear, Color(hex: "#A28CF5").opacity(0.3), .clear],
                    startPoint: .leading,
                    endPoint: .trailing))
                .frame(height: 1)
                .padding(.vertical, 8)
            
            // 로그아웃 버튼 → 별점 다이얼로그
            Button(action: {
                showRatingDialog = true
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("로그아웃")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#A28CF5"), Color(hex: "#8B73F5")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color(hex: "#A28CF5").opacity(0.4), radius: 8, x: 0, y: 4)
            }
            
            // 회원탈퇴 버튼
            Button(action: {}) {
                HStack(spacing: 8) {
                    Image(systemName: "person.badge.minus")
                    Text("회원탈퇴")
                }
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                )
            }
            
            // 안내 문구
            VStack(spacing: 4) {
                Text("회원정보를 완전히 삭제하고 싶으신가요?")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                Text("고객센터로 문의해주세요")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(hex: "#A28CF5"))
            }
            .padding(.top, 8)
        }
        .padding(.horizontal, 20)
    }
}
