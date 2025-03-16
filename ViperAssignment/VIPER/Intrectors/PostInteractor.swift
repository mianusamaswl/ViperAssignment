//
//  PostInteractor.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import Foundation
import SwiftUI

protocol PostInteractorProtocol {
    func fetchPosts() -> [Post]
    func addPost(text: String, image: UIImage?, for user: User)
}

class PostInteractor: PostInteractorProtocol {
    private var posts: [Post] = []
    
    func fetchPosts() -> [Post]{
        return posts
    }
    
    func addPost(text: String, image: UIImage?, for user: User){
        let newPost = Post(id: UUID(), user: user, text: text, image: image)
        posts.insert(newPost, at: 0)
    }
}
