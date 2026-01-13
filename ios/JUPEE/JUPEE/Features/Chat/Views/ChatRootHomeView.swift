//
//  ChatRootHomeView.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import SwiftUI

struct ChatRootHomeView: View {
    @State private var messageText: String = ""
    @State private var showingAddMenu = false

    var body: some View {
        NavigationStack {
            ZStack {
                CreamGradientBackground()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer()

                    VStack(spacing: 12) {
                        ChatComposerBar(
                            text: $messageText,
                            onTapAdd: { showingAddMenu = true },
                            onSend: {
                                // Later: create a new thread or send message into current chat
                                messageText = ""
                            }
                        )

                        ChatBottomDock(
                            leftLabel: "My Assignments",
                            leftSystemImage: "tray.full",
                            rightLabel: "Tools",
                            rightSystemImage: "wand.and.stars",
                            onTapLeft: { /* handled by NavigationLink wrapper below */ },
                            onTapRight: {
                               
                            }
                        )
                    }
                    .padding(.horizontal, 18)
                    .padding(.bottom, 16)
                }
            }
            .navigationBarHidden(true)
            .confirmationDialog("Add", isPresented: $showingAddMenu, titleVisibility: .visible) {
                Button("Take Photo (Camera)") {
                    // Later: camera
                }
                Button("Choose Photo") {
                    // Later: photo library
                }
                Button("Attach File") {
                
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Add something to your message")
            }
            .overlay(alignment: .bottomLeading) {
                // update this to the actual list view
                NavigationLink(destination: ChatHomeView()) {
                    EmptyView()
                }
                .opacity(0)
                .frame(width: 0, height: 0)
            }
        }
    }
}


private struct CreamGradientBackground: View {
    var body: some View {
        LinearGradient(
            stops: [
                .init(color: Color(red: 0.98, green: 0.97, blue: 0.95), location: 0.0),
                .init(color: Color(red: 0.95, green: 0.93, blue: 0.88), location: 0.55),
                .init(color: Color(red: 0.88, green: 0.84, blue: 0.78), location: 1.0)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

#Preview {
    ChatRootHomeView()
}
