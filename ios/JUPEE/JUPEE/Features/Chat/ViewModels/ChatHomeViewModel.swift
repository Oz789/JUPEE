//
//  ChatHomeViewModel.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import Foundation

@MainActor
final class ChatHomeViewModel: ObservableObject {
    @Published var threads: [ChatThread] = []
    @Published var searchText: String = ""

    init() {
        seedForDev()
    }

    var filteredThreads: [ChatThread] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return threads }

        return threads.filter {
            $0.title.localizedCaseInsensitiveContains(q) ||
            $0.preview.localizedCaseInsensitiveContains(q)
        }
    }

    func createThread(title: String, preview: String) {
        let newThread = ChatThread(
            id: UUID(),
            title: title,
            preview: preview,
            updatedAt: Date(),
            subchatCount: 0
        )
        threads.insert(newThread, at: 0)
    }

    private func seedForDev() {
        threads = [
            ChatThread(
                id: UUID(),
                title: "Calc HW (Photo) — Chain Rule",
                preview: "I mapped #1–#10. Tap a problem to open a sub-chat.",
                updatedAt: Date(),
                subchatCount: 6
            ),
            ChatThread(
                id: UUID(),
                title: "English — Thesis feedback",
                preview: "Here are 3 stronger thesis options based on your prompt…",
                updatedAt: Date().addingTimeInterval(-3600 * 5),
                subchatCount: 2
            )
        ]
    }
}
