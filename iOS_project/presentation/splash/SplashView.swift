import SwiftUI

struct SplashView: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0
    @State private var isAnimating = false
    
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
                        .scaleEffect(scale) // 원형 테두리 크기 변화
                        .opacity(opacity) // 투명도 변화

                    VStack(spacing: 8) {
                        Text("Buggi\nMate")
                            .multilineTextAlignment(.center)
                            .font(.custom("Marker Felt", size: 48)) // 비슷한 손글씨 느낌 폰트
                            .foregroundColor(.white)
                            .opacity(opacity) // 텍스트의 투명도 변화

                        Text("스마트 일정 관리 앱")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                            .opacity(opacity) // 서브 텍스트의 투명도 변화
                    }
                }
            }
            .onAppear {
                // 애니메이션 시작
                withAnimation(.easeIn(duration: 1)) {
                    scale = 1
                    opacity = 1
                }

                // 애니메이션을 반복하거나, 다른 뷰로 이동하는 애니메이션을 추가할 수 있습니다.
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    // 3초 후에 다른 화면으로 이동하는 로직을 추가할 수 있습니다.
                    // 예: home 화면으로 이동
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
