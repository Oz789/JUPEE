//
//  ChatComposerBar.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import SwiftUI

struct ChatComposerBar: View {
    @Binding var text: String
    let onTapAdd: () -> Void
    let onSend: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            Button(action: onTapAdd) {
                Image(systemName: "plus")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 36, height: 36)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }

            HStack(spacing: 10) {
                TextField("Ask Jupee…", text: $text, axis: .vertical)
                    .lineLimit(1...4)
                    .textInputAutocapitalization(.sentences)

                Button(action: onSend) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 14, weight: .bold))
                        .frame(width: 34, height: 34)
                        .background(text.trimmedEmpty ? Color.secondary.opacity(0.15) : Color.black.opacity(0.9))
                        .foregroundColor(text.trimmedEmpty ? .secondary : .white)

                        .clipShape(Circle())
                }
                .disabled(text.trimmedEmpty)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        }
    }
}

private extension String {
    var trimmedEmpty: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
