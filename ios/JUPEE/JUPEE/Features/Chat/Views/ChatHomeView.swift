//
//  ChatHomeView.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import SwiftUI

struct ChatHomeView: View {
    @StateObject private var vm = ChatHomeViewModel()

    @State private var showingNewChatAlert = false
    @State private var newChatTitle = ""

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button {
                        vm.createThread(
                            title: "New assignment (Camera)",
                            preview: "Placeholder — camera ingestion next."
                        )
                    } label: {
                        Label("New assignment (Camera)", systemImage: "camera")
                    }

                    Button {
                        vm.createThread(
                            title: "Upload assignment (Photos)",
                            preview: "Placeholder — photo ingestion next."
                        )
                    } label: {
                        Label("Upload assignment (Photos)", systemImage: "photo.on.rectangle")
                    }

                    Button {
                        newChatTitle = ""
                        showingNewChatAlert = true
                    } label: {
                        Label("Ask anything", systemImage: "sparkles")
                    }
                }

                Section("Recent") {
                    if vm.filteredThreads.isEmpty {
                        ContentUnavailableView("No chats found", systemImage: "message")
                    } else {
                        ForEach(vm.filteredThreads) { thread in
                            NavigationLink(value: thread) {
                                ThreadRow(thread: thread)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Jupee")
            .searchable(text: $vm.searchText, prompt: "Search chats")
            .navigationDestination(for: ChatThread.self) { thread in
                // Placeholder: next step is real ChatThreadView (structured response + subchats)
                VStack(alignment: .leading, spacing: 12) {
                    Text(thread.title).font(.title3).bold()
                    Text(thread.preview).foregroundStyle(.secondary)
                    Spacer()
                }
                .padding()
                .navigationTitle("Chat")
                .navigationBarTitleDisplayMode(.inline)
            }
            .alert("New Chat", isPresented: $showingNewChatAlert) {
                TextField("Title (optional)", text: $newChatTitle)

                Button("Create") {
                    let trimmed = newChatTitle.trimmingCharacters(in: .whitespacesAndNewlines)
                    vm.createThread(
                        title: trimmed.isEmpty ? "New chat" : trimmed,
                        preview: "Draft started. Next: structured response + sub-chats."
                    )
                }

                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Start a chat. Later we’ll add prompt + attachment here.")
            }
        }
    }
}

struct ThreadRow: View {
    let thread: ChatThread

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text(thread.title)
                    .font(.headline)

                Spacer()

                if thread.subchatCount > 0 {
                    HStack(spacing: 4) {
                        Image(systemName: "square.stack.3d.up")
                        Text("\(thread.subchatCount)")
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
            }

            Text(thread.preview)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)

            Text(thread.updatedAt, style: .relative)
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ChatHomeView()
}
