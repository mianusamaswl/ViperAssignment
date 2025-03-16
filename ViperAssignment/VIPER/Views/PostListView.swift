//
//  PostListView.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import SwiftUI

struct PostListView: View {
    @StateObject var presenter: PostPresenter
    private let router = PostRouter()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Feed")
                        .font(.title)
                        .bold()
                    Spacer()
                    Picker("Select User", selection: $presenter.selectedUser){
                        ForEach(presenter.users, id: \.id){ user in
                            Text(user.name)
                                .tag(user)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width: 150)
                    Spacer()
                    NavigationLink(destination: router.navigateToCreatePost(presenter: presenter, selectedUser: presenter.selectedUser)){
                        Image(systemName: "plus.app.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity)
                ScrollView {
                    LazyVStack {
                        ForEach(presenter.posts){ post in
                            PostRowView(post: post)
                                .padding(.vertical, 4)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}
