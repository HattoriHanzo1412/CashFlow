//
//  ContentView.swift
//  Projektwoche1
//
//  Created by Jana Jansen on 24.01.25.
//

import SwiftUI
struct ContentView: View {
    @State private var users: [User] = []
    @State private var showingAddUser = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            Text(user.name)
                        }
                    }
                    .onDelete(perform: deleteUser)
                }
                .navigationTitle("Benutzer")
                .navigationBarItems(trailing: Button(action: {
                    showingAddUser = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddUser) {
                    AddUserView(users: $users)
                }
            }
        }
    }
    
    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

