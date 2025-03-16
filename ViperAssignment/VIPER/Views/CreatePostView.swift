//
//  CreatePostView.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var presenter: PostPresenter
    var selectedUser: User
    
    @State private var postText: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    private var deviceWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    private var deviceHeight: CGFloat {
        deviceWidth * (4 / 3)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16){
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading){
                        Text(selectedUser.name)
                            .font(.headline)
                        Text(selectedUser.username)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading){
                    TextEditor(text: $postText)
                        .frame(minHeight: 40)
                        .foregroundColor(.primary)
                        .background(Color.clear)
                    if postText.isEmpty {
                        Text("What's on your mind?")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                            .padding(.top, -40)
                    }
                }
                .padding(.horizontal)
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: deviceWidth, height: deviceHeight)
                        .cornerRadius(10)
                        .clipped()
                        .padding(.horizontal)
                }
                
                Button(action: {
                    isImagePickerPresented = true
                }){
                    HStack {
                        Image(systemName: "photo.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        Text("Upload Image")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                Button(action: {
                    presenter.createPost(text: postText, image: selectedImage)
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Post")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .navigationTitle("Create Post")
        .sheet(isPresented: $isImagePickerPresented){
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}
