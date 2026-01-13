//
//  ContentView.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = true

    var body: some View {
        if isLoggedIn {
            ChatHomeView()
        } else {
            LoginView {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    ContentView()
}


