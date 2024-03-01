//
//  UserCellView.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import SwiftUI

struct UserCellView: View {
    
    var user: [User]
    var isShowingGender: Bool
    var isShowingLocation: Bool
    var isShowingEmail: Bool
    var isShowingLogin: Bool
    var isShowingRegistered: Bool
    var isShowingDob: Bool
    var isShowingPhone: Bool
    var isShowingCell: Bool
    var isShowingId: Bool
    var isShowingNat: Bool
    
    var body: some View {
        
        ForEach(user, id: \.id) { user in
            VStack {
                HStack {
                    AsyncImage(url: URL(string: user.picture.thumbnail ?? "image")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 100, maxHeight: 100)
                                .clipShape(Circle())
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack {
                        Text("\(user.name.first ?? "") \(user.name.last ?? "")")
                            .font(.largeTitle)
                        
                        HStack {
                            if isShowingGender {
                                Text(user.gender ?? "Don't know")
                            }
                            
                            if isShowingDob {
                                Text("age: \(user.dob.age ?? 0)")
                            }
                            
                            if isShowingNat {
                                Text(user.nat ?? "Unknown")
                            }
                        }
                    }
                }
                
                VStack {
                    if isShowingLocation {
                        Text("\(user.location.street?.number ?? 0) \(user.location.street?.name ?? "N/A"), \(user.location.city ?? "N/A"), \(user.location.postcode ?? "N/A")")
                    }
                    
                    if isShowingPhone {
                        Text(user.phone ?? "N/A")
                    }
                    
                    if isShowingCell {
                        Text(user.cell ?? "N/A")
                    }
                    
                    if isShowingEmail {
                        Text(user.email ?? "N/A")
                    }
                    
                    if isShowingLogin {
                        Text("Login:")
                        VStack {
                            Text("Username: \(user.login.username ?? "N/A")")
                            Text("Password: \(user.login.password ?? "N/A")")
                        }
                    }
                    
                    if isShowingRegistered {
                        Text("Registered:")
                        VStack {
                            Text("Date: \(user.registered.date ?? "N/A")")
                            Text("Age: \(user.registered.age ?? 00)")
                        }
                    }
                    
                    if isShowingId {
                        Text("ID:")
                        VStack {
                            Text("Name: \(user.id.name ?? "N/A")")
                            Text("Value: \(user.id.value ?? "N/A")")
                        }
                    }
                }
            }
            .padding()
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
            .shadow(radius: 5)
        }
    }
}

//#Preview {
//    UserCellView(user: User(gender: "male", name: Username(title: "Mr.", first: "John", last: "Smith"), location: Location(), email: "example@gmail.com", login: Login(uuid: UUID(), username: "THE GUY", password: "YUP", salt: "Salt", md5: "YEs", sha1: "WHY", sha256: "IS"), dob: DOB(date: "1963-05-21T10:53:22.442Z", age: 35), registered: Registered(date: "3/56/890", age: 45), phone: "8090496", cell: "YUP", id: ID(name: "YES", value: "YUP"), picture: Picture(large: "", medium: "", thumbnail: "https://randomuser.me/api/portraits/thumb/men/29.jpg"), nat: "FI"), isShowingGender: true, isShowingLocation: true, isShowingEmail: true, isShowingLogin: true, isShowingRegistered: true, isShowingDob: true, isShowingPhone: true, isShowingCell: true, isShowingId: true, isShowingNat: true)
//}
