//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Aiarsien on 21.03.2025.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie? // Many to one
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Aiarsien"),
        Friend(name: "Lydia"),
        Friend(name: "Wylan"),
        Friend(name: "Dave"),
        Friend(name: "Maria"),
    ]
}
