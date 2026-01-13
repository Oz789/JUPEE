//
//  ChatBottomDock.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import SwiftUI

struct ChatBottomDock: View {
    let leftLabel: String
    let leftSystemImage: String
    let rightLabel: String
    let rightSystemImage: String

    let onTapLeft: () -> Void
    let onTapRight: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            DockButton(
                label: leftLabel,
                systemImage: leftSystemImage,
                action: onTapLeft
            )

            DockButton(
                label: rightLabel,
                systemImage: rightSystemImage,
                action: onTapRight
            )
        }
    }
}

private struct DockButton: View {
    let label: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                Text(label)
                    .font(.system(size: 15, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}
