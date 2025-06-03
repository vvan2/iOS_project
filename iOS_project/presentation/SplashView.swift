import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // 배경 그라디언트: 위쪽이 짙은 보라색, 아래가 연보라색
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#7A5FFF"),
                    Color(hex: "#BCA5FF")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                ZStack {
                    // 원형 테두리
                    Circle()
                        .stroke(Color.white.opacity(0.8), lineWidth: 2)
                        .frame(width: 260, height: 260)

                    VStack(spacing: 8) {
                        Text("Buggi\nMate")
                            .multilineTextAlignment(.center)
                            .font(.custom("Marker Felt", size: 48)) // 비슷한 손글씨 느낌 폰트
                            .foregroundColor(.white)

                        Text("스마트 일정 관리 앱")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
            }
        }
    }
}
#Preview {
    SplashView()
}
