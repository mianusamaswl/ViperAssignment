//
//  PostRouter.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import Foundation

protocol PostRouterProtocol {
    func navigateToCreatePost(presenter: PostPresenter, selectedUser: User) -> CreatePostView
}

class PostRouter: PostRouterProtocol {
    func navigateToCreatePost(presenter: PostPresenter, selectedUser: User) -> CreatePostView {
        return CreatePostView(presenter: presenter, selectedUser: selectedUser)
    }
}
