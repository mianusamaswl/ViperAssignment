//
//  PostRowView.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    private var deviceWidth: CGFloat {
        UIScreen.main.bounds.width - 10
    }
    private var deviceHeight: CGFloat {
        deviceWidth * (4 / 3)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading){
                    Text(post.user.name)
                        .font(.headline)
                    Text(post.user.username)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
            if !post.text.isEmpty {
                HStack {
                    Text(post.text)
                        .font(.body)
                        .padding(.horizontal, 10)
                    Spacer()
                }
            }
            if let image = post.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: deviceWidth, height: deviceHeight)
                    .clipped()
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
    }
}
