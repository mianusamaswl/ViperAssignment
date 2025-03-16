//
//  Post.swift
//  ViperAssignment
//
//  Created by Mian Usama on 16/03/2025.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id: UUID
    let user: User
    let text: String
    let image: UIImage?
}
