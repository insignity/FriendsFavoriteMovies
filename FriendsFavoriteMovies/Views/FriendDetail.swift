//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Aiarsien on 24.03.2025.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    
    //MARK: Navigation dismiss
    @Environment(\.dismiss) private var dismiss
    
    //MARK: Swift Data
    @Environment(\.modelContext) private var context
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    @Bindable var friend: Friend
    let isNew: Bool
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("Nothing")
                    .tag(nil as Movie?)
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack{
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
