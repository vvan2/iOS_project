import SwiftUI

struct RootView: View {
    @State private var showSplash = true
    @State private var isLoggedIn = false
    @State private var isSigningUp = false
    
    var body: some View {
        Group {
            if showSplash {
                // ─── 1) Splash 화면 ───────────────────────────────────────
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            }
            else if !isLoggedIn {
                // ─── 2) SignInView를 NavigationStack으로 감싸기 ───────────
                NavigationStack {
                    SignInView {
                        // 로그인 성공 시 MainTab으로 이동
                        withAnimation {
                            isLoggedIn = true
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
            else {
                // ─── 3) 로그인 완료 후 MainTabView(홈 포함 탭 화면) ──────────
                MainTabView(onLogout: {
                    // 로그아웃 처리
                    withAnimation {
                        isLoggedIn = false
                    }
                })
            }
        }
    }
}
