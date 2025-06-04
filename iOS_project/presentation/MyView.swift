import SwiftUI

struct MyView: View {
    @State private var alarmOn = true
    @State private var adOn = true
    @State private var messageOn = true
    @State private var isLoggedOut = false // 로그아웃 상태 관리

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: - 1) 상단 보라색 배경 영역
                ZStack(alignment: .top) {
                    // 1-1) 보라색 배경 (고정 높이)
                    Color(hex: "#A28CF5")
                        .frame(height: 220) // 상단 전체 영역 높이
                        .ignoresSafeArea(edges: .top)

                    VStack(spacing: 16) {
                        // 1-2) "My Buggi" 타이틀
                        HStack {
                            Text("My Buggi")
                                .font(.custom("Marker Felt", size: 26))
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 50)

                        // 1-3) 원형 프로필
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#9A83F7"))
                                .frame(width: 100, height: 100)

                            HStack(spacing: 10) {
                                Circle().fill(Color.white).frame(width: 14, height: 24)
                                Circle().fill(Color.white).frame(width: 14, height: 24)
                            }
                        }
                        .padding(.top, 8)

                    }
                }

                // MARK: - 2) 하단 흰색 영역 (토글 + 버튼 등)
                ScrollView {
                    ZStack {
                        // 1-4) 오른쪽 사각형 박스들
                        VStack(spacing: 16) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 200, height: 140)
                                .zIndex(1) // 회색 박스를 앞으로
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 200, height: 80)
                                .zIndex(1) // 회색 박스를 앞으로
                        }
                        .padding(.top, 14)
                    }

                    // 2-1) 토글 목록
                    ToggleRow(title: "알람 설정", isOn: $alarmOn)
                    Divider().padding(.leading) // 토글 사이의 구분선
                    ToggleRow(title: "광고 수신", isOn: $adOn)
                    Divider().padding(.leading)
                    ToggleRow(title: "메세지 알람", isOn: $messageOn)

                    // 2-2) 토글 영역과 버튼 영역 사이에 은은한 보라색 구분선
                    Rectangle()
                        .fill(Color(hex: "#A28CF5").opacity(0.5))
                        .frame(height: 1)
                        .padding(.vertical, 16)

                    // 2-3) 하단 버튼 및 안내 문구
                    VStack(spacing: 12) {
                        Button(action: {
                            // 로그아웃 액션
                            isLoggedOut = true // 로그아웃 상태 변경
                        }) {
                            Text("로그아웃")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 140, height: 44)
                                .background(Color(hex: "#A28CF5"))
                                .cornerRadius(22)
                        }

                        Button(action: {
                            // 회원탈퇴 액션
                        }) {
                            Text("회원탈퇴")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.gray)
                                .frame(width: 140, height: 44)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(22)
                        }

                        Text("회원정보를 완전히 삭제하고 싶으신가요?")
                            .font(.footnote)
                            .foregroundColor(Color.gray.opacity(0.7))
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .padding(.bottom, 40)
                }
            }
            .background(Color.white) // 전체 뷰의 기본 배경은 흰색
            .ignoresSafeArea(edges: .top) // 상단 보라색이 노치 영역까지 확장되도록
            .background(
                // 로그아웃 상태일 때 SignInView로 돌아가도록 NavigationLink 사용
                NavigationLink(destination: SignInView(onLogin: {}), isActive: $isLoggedOut) {
                    EmptyView()
                }
            )
        }
    }
}

#Preview {
    MyView()
}

