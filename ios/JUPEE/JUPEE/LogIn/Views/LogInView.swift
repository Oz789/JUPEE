//
//  LogInView.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/12/26.
//

import SwiftUI

struct LoginView: View {
    let onLogin: () -> Void

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("JUPEE")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)

                Button {
                    // Temporary: accept anything so we can test Home flow
                    onLogin()
                } label: {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationTitle("Log In")
        }
    }
}

#Preview {
    LoginView(onLogin: {})
}
