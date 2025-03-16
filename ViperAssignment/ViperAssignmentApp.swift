//
//  ViperAssignmentApp.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import SwiftUI

@main
struct ViperAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            let presenter = PostPresenter(interactor: PostInteractor())
            PostListView(presenter: presenter)
        }
    }
}
