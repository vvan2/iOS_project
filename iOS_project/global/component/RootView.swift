import SwiftUI

struct RootView: View {
    @State private var showSplash = true
    @State private var showSignIn = false
    @State private var isLoggedIn = false

    var body: some View {
        Group {
            if showSplash {
                // ─── 1) Splash 화면 ───────────────────────────────────────
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showSplash = false
                                showSignIn = true
                            }
                        }
                    }
            }
            else if showSignIn && !isLoggedIn {
                // ─── 2) SignInView를 NavigationStack으로 감싸기 ───────────
                NavigationStack {
                    SignInView {
                        // 로그인 성공 시 MainTab으로 이동
                        withAnimation {
                            isLoggedIn = true
                        }
                    }
                    .navigationBarHidden(true)  // 선택 사항: 상단 네비게이션 바를 숨기고 싶으면
                }
            }
            else {
                // ─── 3) 로그인 완료 후 MainTabView(홈 포함 탭 화면) ──────────
                MainTabView()
            }
        }
    }
}
