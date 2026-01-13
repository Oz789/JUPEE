//
//  ChatThread.swift
//  JUPEE
//
//  Created by Osvaldo Mosso on 1/13/26.
//


import Foundation

struct ChatThread: Identifiable, Hashable {
    let id: UUID
    var title: String
    var preview: String
    var updatedAt: Date
    var subchatCount: Int
}
