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
    @State private var isAttendancePressed = false
    @State private var showAttendanceSheet = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                   
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

                              
                                Text("여러 활동과 일정을 한 눈에 봐요! ✨")
                                    .font(.system(size: 17, weight: .medium, design: .rounded))
                                    .foregroundColor(.white.opacity(0.95))

                             
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

                     
                        VStack(spacing: 40) {
                      
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 28) {
                                    ForEach(topIcons, id: \.id) { item in
                                        VStack(spacing: 12) {
                                            ZStack {
                                             
                                                Circle()
                                                    .fill(item.backgroundColor.opacity(0.3))
                                                    .frame(width: 66, height: 66)
                                                    .blur(radius: 4)
                                                    .offset(y: 4)
                                                
                                       
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

                            // 오늘의 비교과
                            enhancedSectionView(title: "오늘의 비교과", items: todayCards)

                            // 인기 강의
                            enhancedSectionView(title: "인기 강의", items: popularLectures)

                            // 추천 활동
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
                        .padding(.bottom, 120) // 플로팅 버튼 공간 확보
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
            
            // 플로팅 출석 버튼
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            isAttendancePressed.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            showAttendanceSheet = true
                        }
                    }) {
                        ZStack {
                            // 외부 글로우 효과
                            Circle()
                                .fill(
                                    RadialGradient(
                                        colors: [
                                            Color(hex: "#8B5CF6").opacity(0.4),
                                            Color(hex: "#A855F7").opacity(0.2),
                                            Color.clear
                                        ],
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 40
                                    )
                                )
                                .frame(width: 80, height: 80)
                                .blur(radius: 8)
                            
                            // 메인 버튼 배경
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "#8B5CF6"),
                                            Color(hex: "#A855F7"),
                                            Color(hex: "#C084FC")
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 68, height: 68)
                                .shadow(color: Color(hex: "#8B5CF6").opacity(0.5), radius: 15, x: 0, y: 8)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            LinearGradient(
                                                colors: [
                                                    Color.white.opacity(0.6),
                                                    Color.white.opacity(0.1)
                                                ],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 2
                                        )
                                )
                            
                            // 내부 아이콘과 텍스트
                            VStack(spacing: 2) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                                
                                Text("출석")
                                    .font(.system(size: 10, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1)
                            }
                        }
                        .scaleEffect(isAttendancePressed ? 0.9 : 1.0)
                        .animation(.spring(response: 0.2, dampingFraction: 0.8), value: isAttendancePressed)
                    }
                    .padding(.trailing, 24)
                    .padding(.bottom, 34)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .sheet(isPresented: $showAttendanceSheet) {
            AttendanceSheetView()
                .onDisappear {
                    isAttendancePressed = false
                }
        }
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
