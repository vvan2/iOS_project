import SwiftUI

struct InfoCharacterView: View {
    var body: some View {
        ZStack {
            // 캐릭터 반원 (오른쪽 하단에 정확히 붙음)
            GeometryReader { geo in
                ZStack {
                    // 반원
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .rotation(.degrees(180))
                        .fill(Color(hex: "#9A83F7"))
                        .frame(width: 220, height: 220)
                        .position(x: geo.size.width, y: geo.size.height)

                    // 눈 + 느낌표
                    VStack(alignment: .leading, spacing: 6) {
                        // 느낌표
                        Text("!  !")
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.8))
                            .offset(x: -12)

                        // 눈
                        HStack(spacing: 12) {
                            Circle()
                                .fill(.white)
                                .frame(width: 16, height: 24)
                            Circle()
                                .fill(.white)
                                .frame(width: 16, height: 24)
                        }
                    }
                    .offset(x: geo.size.width - 90, y: geo.size.height - 120)
                }
            }
            .ignoresSafeArea()
        }
    }
}
