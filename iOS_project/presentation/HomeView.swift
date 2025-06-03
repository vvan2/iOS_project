import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // 상단 배경
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#7A5FFF"), Color(hex: "#BCA5FF")]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 260)

                    // 흰색 콘텐츠
                    VStack(spacing: 24) {
                        // 검색 & 헤더
                        VStack(spacing: 12) {
                            HStack {
                                Text("Buggi\nMate")
                                    .font(.custom("Marker Felt", size: 18))
                                    .foregroundColor(.white)
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                                    .padding(.trailing)
                            }
                            .padding(.top, 40)

                            Text("여러 활동과 일정을 한 눈에 봐요!")
                                .font(.system(size: 14))
                                .foregroundColor(.white)

                            HStack {
                                TextField("궁금한 것을 검색해보세요", text: .constant(""))
                                    .padding(.horizontal)
                                    .frame(height: 36)
                                Image(systemName: "magnifyingglass")
                                    .padding(.trailing)
                            }
                            .background(Color.white)
                            .cornerRadius(18)
                            .padding(.horizontal)
                        }
                        .padding(.top, -240)

                        // 콘텐츠 시작
                        VStack(spacing: 24) {
                            // 원형 버튼 리스트
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(0..<10) { _ in
                                        Circle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(width: 50, height: 50)
                                    }
                                }
                                .padding(.horizontal)
                            }

                            // 큰 카드
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 100)
                                .padding(.horizontal)

                            // 오늘의 비교과
                            sectionHeader(title: "오늘의 비교과")
                            horizontalCardList()

                            // 인기 강의
                            sectionHeader(title: "인기 강의")
                            horizontalCardList(cardColor: Color.pink.opacity(0.2))

                            // 추천 활동
                            sectionHeader(title: "추천 활동")
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(0..<5) { i in
                                        VStack(spacing: 8) {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.blue)
                                            Text("활동 \(i+1)")
                                                .font(.caption)
                                        }
                                        .frame(width: 80, height: 80)
                                        .background(Color.yellow.opacity(0.2))
                                        .cornerRadius(12)
                                    }
                                }
                                .padding(.horizontal)
                            }

                            // 유저 맞춤 알림
                            sectionHeader(title: "맞춤 알림")
                            VStack(spacing: 12) {
                                ForEach(1..<4) { i in
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.15))
                                        .frame(height: 60)
                                        .overlay(
                                            HStack {
                                                Text("알림 내용 \(i)")
                                                    .padding(.leading)
                                                Spacer()
                                            }
                                        )
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.bottom, 40)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    // Section Header
    private func sectionHeader(title: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text("더보기 >")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }

    // 카드 목록 (공용)
    private func horizontalCardList(cardColor: Color = Color.gray.opacity(0.2)) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<6) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(cardColor)
                        .frame(width: 100, height: 100)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HomeView()
}
