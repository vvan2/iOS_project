import SwiftUI

struct InfoCardView: View {
    var title: String
    var subtitle: String
    var url: String

    var body: some View {
        Button(action: {
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray.opacity(0.8))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}

