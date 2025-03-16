//
//  PostPresenter.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import Foundation
import Combine
import SwiftUI

protocol PostPresenterProtocol: ObservableObject {
    var posts: [Post] { get }
    var users: [User] { get }
    var selectedUser: User { get set }
    
    func loadPosts()
    func createPost(text: String, image: UIImage?)
}

class PostPresenter: PostPresenterProtocol {
    var users: [User]
    @Published var posts: [Post] = []
    @Published var selectedUser: User
    private let interactor: PostInteractorProtocol
    
    init(interactor: PostInteractorProtocol){
        self.interactor = interactor
        self.users = [
            User(id: UUID(), name: "Alice Johnson", username: "@alice", profileImage: "person.circle"),
            User(id: UUID(), name: "Bob Smith", username: "@bob", profileImage: "person.circle.fill"),
            User(id: UUID(), name: "Charlie Brown", username: "@charlie", profileImage: "person.circle")
        ]
        self.selectedUser = users.first!
    }
    
    func loadPosts(){
        self.posts = interactor.fetchPosts()
    }
    
    func createPost(text: String, image: UIImage?){
        interactor.addPost(text: text, image: image, for: selectedUser)
        loadPosts()
    }
}
