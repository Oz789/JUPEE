//
//  AppState.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//

import SwiftUI

@MainActor
final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func logIn() {
        isLoggedIn = true
    }
    
    func logOut() {
        isLoggedIn = false
    }
}
