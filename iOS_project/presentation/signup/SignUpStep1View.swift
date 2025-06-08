import Foundation
import SwiftUI

struct SignUpStep1View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showNextStep = false

    private var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        !confirmPassword.isEmpty &&
        password == confirmPassword &&
        email.contains("@")
    }

    var body: some View {
        ZStack {
            // Background Gradient
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

            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .dark)
                                )
                        }

                        Spacer()

                        Text("1 / 3")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 10)

                    // Progress Bar
                    HStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white)
                            .frame(height: 4)
                            .frame(maxWidth: .infinity)

                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.3))
                            .frame(height: 4)
                            .frame(maxWidth: .infinity)

                        RoundedRectangle(cornerRadius: 2)
                            .fill(.white.opacity(0.3))
                            .frame(height: 4)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 20)

                    // Title Section
                    VStack(spacing: 8) {
                        Text("계정 정보를 입력해주세요")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)

                        Text("안전한 비밀번호를 설정해주세요")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.top, 50)
                    .padding(.horizontal, 24)

                    Spacer().frame(height: 50)

                    // Glassmorphism Card
                    VStack(spacing: 24) {
                        // Email Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("이메일")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)

                            TextField("이메일을 입력해주세요", text: $email)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .dark)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(.white.opacity(0.2), lineWidth: 1)
                                        )
                                )
                        }

                        // Password Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("비밀번호")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)

                            SecureField("비밀번호를 입력해주세요", text: $password)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .dark)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(.white.opacity(0.2), lineWidth: 1)
                                        )
                                )
                        }

                        // Confirm Password Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("비밀번호 확인")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)

                            SecureField("비밀번호를 다시 입력해주세요", text: $confirmPassword)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .dark)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(
                                                    confirmPassword.isEmpty ? .white.opacity(0.2) :
                                                    (password == confirmPassword ? .white.opacity(0.4) : .red),
                                                    lineWidth: 1
                                                )
                                        )
                                )

                            if !confirmPassword.isEmpty && password != confirmPassword {
                                Text("비밀번호가 일치하지 않습니다")
                                    .font(.system(size: 14))
                                    .foregroundColor(.red.opacity(0.8))
                            }
                        }
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.regularMaterial)
                            .environment(\.colorScheme, .dark)
                    )
                    .padding(.horizontal, 24)

                    Spacer().frame(height: 60)

                    // Next Button
                    Button {
                        showNextStep = true
                    } label: {
                        Text("다음")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(isFormValid ? .regularMaterial : .ultraThinMaterial)
                                    .opacity(isFormValid ? 0.8 : 0.3)
                                    .environment(\.colorScheme, .dark)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.white.opacity(0.2), lineWidth: 1)
                                    )
                            )
                    }
                    .disabled(!isFormValid)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showNextStep) {
            SignUpStep2View()
        }
    }
}

#Preview{
    SignUpStep1View()
}

