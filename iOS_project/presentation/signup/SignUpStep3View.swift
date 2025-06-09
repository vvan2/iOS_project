//
//  SignUpStep3View.swift
//  iOS_project
//
//  Created by sonjuwan on 6/8/25.
//

import Foundation
import SwiftUI

struct SignUpStep3View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedMajor: String = ""
    @State private var interests: Set<String> = []
    @State private var agreeToTerms = false
    @State private var showSuccessAlert = false
    @State private var isSignUpComplete = false

    @Binding var navigationPath: NavigationPath

    let majors = ["컴퓨터공학과", "전자공학과", "기계공학과", "경영학과", "디자인학과"]
    let interestOptions = ["개발", "디자인", "마케팅", "데이터분석", "창업", "연구"]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: "#9C88FF"),
                    Color(hex: "#A28CF5"),
                    Color(hex: "#B8A9FF"),
                    Color(hex: "#D9D2FB")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ForEach(0..<8, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: CGFloat.random(in: 10...20)))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 2...4))
                            .repeatForever(autoreverses: true),
                        value: index
                    )
            }

            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }

                        Spacer()

                        Text("3 / 3")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)

                    AnimatedProgressBar(progress: 1.0)
                        .padding(.top, 20)

                    VStack(spacing: 8) {
                        Text("🎯 마지막 단계")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)

                        Text("추가 정보를 알려주세요")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 40)

                    Spacer().frame(height: 40)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("전공 선택")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(majors, id: \.self) { major in
                                    Button {
                                        selectedMajor = major
                                    } label: {
                                        Text(major)
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(selectedMajor == major ? .white : .white.opacity(0.7))
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(selectedMajor == major ? Color.white.opacity(0.3) : Color.white.opacity(0.1))
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                                    )
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                    }

                    Spacer().frame(height: 30)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("관심 분야 (복수 선택 가능)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                            ForEach(interestOptions, id: \.self) { interest in
                                Button {
                                    if interests.contains(interest) {
                                        interests.remove(interest)
                                    } else {
                                        interests.insert(interest)
                                    }
                                } label: {
                                    HStack {
                                        Image(systemName: interests.contains(interest) ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(.white)
                                        Text(interest)
                                            .font(.system(size: 16, weight: .medium))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(interests.contains(interest) ? Color.white.opacity(0.3) : Color.white.opacity(0.1))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                            )
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }

                    Spacer().frame(height: 30)

                    HStack(spacing: 12) {
                        Button {
                            agreeToTerms.toggle()
                        } label: {
                            Image(systemName: agreeToTerms ? "checkmark.square.fill" : "square")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }

                        Text("이용약관 및 개인정보처리방침에 동의합니다")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))

                        Spacer()
                    }
                    .padding(.horizontal, 24)

                    Spacer().frame(height: 40)

                    GlassButton(title: "🎉 회원가입 완료") {
                        completeSignUp()
                    }
                    .disabled(!agreeToTerms)
                    .opacity(agreeToTerms ? 1.0 : 0.6)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert("🎉 회원가입 완료!", isPresented: $showSuccessAlert) {
            Button("확인") {
                // SignInView로 돌아가기 위해 루트로 pop
                navigationPath.removeLast(navigationPath.count)
            }
        } message: {
            Text("환영합니다! 이제 로그인하여 Buggi Mate를 시작해보세요.")
        }
        .onChange(of: isSignUpComplete) { _, newValue in
            if newValue {
                showSuccessAlert = true
            }
        }
    }

    private func completeSignUp() {
        print("회원가입 완료 - 전공: \(selectedMajor), 관심분야: \(interests)")
        isSignUpComplete = true
    }
}

#Preview {
    @State var path = NavigationPath()
    return SignUpStep3View(navigationPath: $path)
}

