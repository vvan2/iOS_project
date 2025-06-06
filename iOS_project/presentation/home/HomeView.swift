
import SwiftUI

struct HomeView: View {
    // MARK: - Data Configuration
    let topIcons: [IconItem] = [
        IconItem(iconName: "calendar", title: "캘린더", backgroundColor: Color.blue.opacity(0.2)),
        IconItem(iconName: "book.fill", title: "수업", backgroundColor: Color.green.opacity(0.2)),
        IconItem(iconName: "person.3.fill", title: "동아리", backgroundColor: Color.orange.opacity(0.2)),
        IconItem(iconName: "trophy.fill", title: "대회", backgroundColor: Color.yellow.opacity(0.2)),
        IconItem(iconName: "graduationcap.fill", title: "졸업", backgroundColor: Color.purple.opacity(0.2))
    ]
    
    let todayCards: [CardItem] = [
        CardItem(iconName: "mic.fill", title: "발표 대회", subtitle: "오후 2시", backgroundColor: Color.blue.opacity(0.15)),
        CardItem(iconName: "paintbrush.fill", title: "디자인 워크숍", subtitle: "오후 4시", backgroundColor: Color.green.opacity(0.15)),
        CardItem(iconName: "laptopcomputer", title: "코딩 세미나", subtitle: "오후 6시", backgroundColor: Color.orange.opacity(0.15))
    ]
    
    let popularLectures: [CardItem] = [
        CardItem(iconName: "brain.head.profile", title: "AI 기초", subtitle: "4.8⭐", backgroundColor: Color.pink.opacity(0.15)),
        CardItem(iconName: "chart.line.uptrend.xyaxis", title: "데이터 분석", subtitle: "4.7⭐", backgroundColor: Color.purple.opacity(0.15)),
        CardItem(iconName: "iphone", title: "앱 개발", subtitle: "4.9⭐", backgroundColor: Color.cyan.opacity(0.15))
    ]
    
    let recommendations: [IconItem] = [
        IconItem(iconName: "camera.fill", title: "사진부", backgroundColor: Color.yellow.opacity(0.3)),
        IconItem(iconName: "music.note", title: "밴드", backgroundColor: Color.red.opacity(0.3)),
        IconItem(iconName: "theatermasks.fill", title: "연극", backgroundColor: Color.indigo.opacity(0.3)),
        IconItem(iconName: "gamecontroller.fill", title: "게임", backgroundColor: Color.green.opacity(0.3))
    ]
    
    let notifications: [NotificationItem] = [
        NotificationItem(title: "새로운 공지사항", description: "2024 겨울방학 프로그램 안내", isImportant: true),
        NotificationItem(title: "과제 마감일 알림", description: "데이터베이스 과제 - 12월 15일까지", isImportant: false),
        NotificationItem(title: "동아리 모집", description: "프로그래밍 동아리 신입 모집 중", isImportant: false)
    ]
    
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // 상단 그라데이션 배경 (더 부드럽고 세련된 그라데이션)
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hex: "#667eea"),
                            Color(hex: "#9080ed"),
                            Color(hex: "#BCA5FF")
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 320)
                    .overlay(
                        // 미묘한 패턴 오버레이
                        GeometryReader { geometry in
                            ForEach(0..<20, id: \.self) { _ in
                                Circle()
                                    .fill(Color.white.opacity(0.05))
                                    .frame(width: Double.random(in: 10...30), height: Double.random(in: 10...30))
                                    .position(
                                        x: Double.random(in: 0...geometry.size.width),
                                        y: Double.random(in: 0...geometry.size.height)
                                    )
                            }
                        }
                    )
                    .overlay(
                        VStack(spacing: 20) {
                            // 헤더 (더 우아한 타이포그래피)
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Buggi")
                                        .font(.custom("SF Pro Display", size: 28))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("Mate")
                                        .font(.custom("SF Pro Display", size: 28))
                                        .fontWeight(.light)
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                Spacer()
                                Button(action: {}) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white.opacity(0.2))
                                            .frame(width: 44, height: 44)
                                            .blur(radius: 0.5)
                                        
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 60)

                            // 부제목 (더 매력적인 메시지)
                            Text("여러 활동과 일정을 한 눈에 봐요! ✨")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(.white.opacity(0.95))

                            // 검색바 (더 세련된 디자인)
                            HStack(spacing: 16) {
                                ZStack {
                                    // 글래스모피즘 효과
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color.white.opacity(0.25))
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                        )
                                        .blur(radius: 0.5)
                                    
                                    HStack(spacing: 12) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.white.opacity(0.8))
                                            .font(.system(size: 16, weight: .medium))
                                            .padding(.leading, 20)
                                        
                                        TextField("궁금한 것을 검색해보세요", text: $searchText)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.white)
                                            .textFieldStyle(PlainTextFieldStyle())
                                            .placeholder(when: searchText.isEmpty) {
                                                Text("궁금한 것을 검색해보세요")
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .font(.system(size: 16, weight: .medium))
                                            }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(height: 50)
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 12)
                            
                            Spacer()
                        }
                    )

                    // 메인 콘텐츠 (더 부드러운 전환)
                    VStack(spacing: 40) {
                        // 상단 아이콘 메뉴 (더 입체적이고 매력적인 아이콘)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 28) {
                                ForEach(topIcons, id: \.id) { item in
                                    VStack(spacing: 12) {
                                        ZStack {
                                            // 그림자 효과
                                            Circle()
                                                .fill(item.backgroundColor.opacity(0.3))
                                                .frame(width: 66, height: 66)
                                                .blur(radius: 4)
                                                .offset(y: 4)
                                            
                                            // 메인 원
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        colors: [item.backgroundColor, item.backgroundColor.opacity(0.7)],
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                                .frame(width: 64, height: 64)
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.white.opacity(0.5), lineWidth: 1)
                                                )
                                                .overlay(
                                                    Image(systemName: item.iconName)
                                                        .font(.system(size: 24, weight: .semibold))
                                                        .foregroundColor(.primary)
                                                )
                                        }
                                        
                                        Text(item.title)
                                            .font(.system(size: 13, weight: .semibold, design: .rounded))
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 70)
                        }

                        // 광고 배너 (더 매력적인 그라데이션과 애니메이션)
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "#ff9a9e"),
                                            Color(hex: "#fecfef"),
                                            Color(hex: "#fecfef")
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(height: 140)
                                .shadow(color: Color.pink.opacity(0.3), radius: 15, x: 0, y: 8)
                            
                            // 배경 패턴
                            HStack {
                                Spacer()
                                VStack {
                                    ForEach(0..<3) { _ in
                                        Circle()
                                            .fill(Color.white.opacity(0.1))
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                .padding(.trailing, 20)
                            }
                            
                            VStack(spacing: 8) {
                                Text("🎉 새로운 기능 출시!")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                Text("AI 스터디 플랜을 경험해보세요")
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        .padding(.horizontal, 24)

                        // 오늘의 비교과 (더 세련된 카드 디자인)
                        enhancedSectionView(title: "오늘의 비교과", items: todayCards)

                        // 인기 강의
                        enhancedSectionView(title: "인기 강의", items: popularLectures)

                        // 추천 활동 (더 동적인 레이아웃)
                        VStack(spacing: 20) {
                            enhancedSectionHeader(title: "추천 활동")
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(recommendations, id: \.id) { item in
                                        VStack(spacing: 12) {
                                            ZStack {
                                                // 그림자
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(item.backgroundColor.opacity(0.3))
                                                    .frame(width: 82, height: 82)
                                                    .blur(radius: 6)
                                                    .offset(y: 6)
                                                
                                                // 메인 카드
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(
                                                        LinearGradient(
                                                            colors: [item.backgroundColor, item.backgroundColor.opacity(0.8)],
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        )
                                                    )
                                                    .frame(width: 80, height: 80)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 16)
                                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                    )
                                                    .overlay(
                                                        Image(systemName: item.iconName)
                                                            .font(.system(size: 26, weight: .semibold))
                                                            .foregroundColor(.primary)
                                                    )
                                            }
                                            
                                            Text(item.title)
                                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                                .foregroundColor(.primary)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                        }

                        // 맞춤 알림 (더 현대적인 알림 카드)
                        VStack(spacing: 20) {
                            enhancedSectionHeader(title: "맞춤 알림")
                            
                            VStack(spacing: 16) {
                                ForEach(notifications, id: \.id) { notification in
                                    HStack(spacing: 16) {
                                        // 상태 표시기
                                        ZStack {
                                            Circle()
                                                .fill(notification.isImportant ?
                                                     LinearGradient(colors: [Color.red, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                                     LinearGradient(colors: [Color.blue, Color.cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                                .frame(width: 12, height: 12)
                                                .shadow(color: notification.isImportant ? Color.red.opacity(0.4) : Color.blue.opacity(0.4), radius: 4)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(notification.title)
                                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                                .foregroundColor(.primary)
                                            Text(notification.description)
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.secondary)
                                                .lineLimit(2)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 16)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(Color.white)
                                            .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
                                    )
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }
                    .padding(.top, -50)
                    .padding(.bottom, 50)
                    .background(
                        LinearGradient(
                            colors: [Color.gray.opacity(0.02), Color.white],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    // MARK: - Enhanced Helper Views
    private func enhancedSectionHeader(title: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
            Spacer()
            Button(action: {}) {
                HStack(spacing: 6) {
                    Text("더보기")
                        .font(.system(size: 15, weight: .semibold))
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                }
                .foregroundColor(.secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color.gray.opacity(0.1))
                )
            }
        }
        .padding(.horizontal, 24)
    }

    private func enhancedSectionView(title: String, items: [CardItem]) -> some View {
        VStack(spacing: 20) {
            enhancedSectionHeader(title: title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(items, id: \.id) { item in
                        VStack(spacing: 12) {
                            ZStack {
                                // 그림자
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(item.backgroundColor.opacity(0.3))
                                    .frame(width: 92, height: 92)
                                    .blur(radius: 8)
                                    .offset(y: 8)
                                
                                // 메인 카드
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(
                                        LinearGradient(
                                            colors: [item.backgroundColor, item.backgroundColor.opacity(0.7)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 90, height: 90)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(Color.white.opacity(0.4), lineWidth: 1.5)
                                    )
                                    .overlay(
                                        Image(systemName: item.iconName)
                                            .font(.system(size: 32, weight: .semibold))
                                            .foregroundColor(.primary)
                                    )
                            }
                            
                            VStack(spacing: 4) {
                                Text(item.title)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                
                                if let subtitle = item.subtitle {
                                    Text(subtitle)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(
                                            Capsule()
                                                .fill(Color.gray.opacity(0.1))
                                        )
                                }
                            }
                        }
                        .frame(width: 110)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview{
    HomeView()
}

