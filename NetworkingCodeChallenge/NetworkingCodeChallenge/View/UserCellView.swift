//
//  UserCellView.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import SwiftUI

struct UserCellView: View {
    
    var user: User
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
    
    let dateFromater = ISO8601DateFormatter()
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.picture.thumbnail)) { phase in
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
                    Text("\(user.name.first) \(user.name.last)")
                        .font(.largeTitle)
                    
                    HStack {
                        if isShowingGender {
                            Text(user.gender)
                        }
                        
                        if isShowingDob {
                            Text("age: \(user.dob.age)")
                        }
                        
                        if isShowingNat {
                            Text(user.nat)
                        }
                    }
                }
            }
            
            VStack {
                if isShowingLocation {
                    Text("\(user.location.street.number) \(user.location.street.name), \(user.location.city) \(user.location.state), \(user.location.postcode)")
                }
                
                if isShowingPhone {
                    Text(user.phone)
                }
                
                if isShowingCell {
                    Text(user.cell)
                }
                
                if isShowingEmail {
                    Text(user.email)
                }
                
                if isShowingLogin {
                    Text("Login:")
                    VStack {
                        Text("Username: \(user.login.username)")
                        Text("Password: \(user.login.password)")
                    }
                }
                
                if isShowingRegistered {
                    Text("Registered:")
                    VStack {
                        Text("Date: \(user.registered.date)")
                        Text("Age: \(user.registered.age)")
                    }
                }
                
                if isShowingId {
                    Text("ID:")
                    VStack {
                        Text("Name: \(user.id.name)")
                        Text("Value: \(user.id.value)")
                    }
                }
            }
        }
    }
}

//#Preview {
//    UserCellView(user: User(gender: "male", name: Username(title: "Mr.", first: "John", last: "Smith"), location: Location(), email: "example@gmail.com", login: Login(uuid: UUID(), username: "THE GUY", password: "YUP", salt: "Salt", md5: "YEs", sha1: "WHY", sha256: "IS"), dob: DOB(date: "1963-05-21T10:53:22.442Z", age: 35), registered: Registered(date: "3/56/890", age: 45), phone: "8090496", cell: "YUP", id: ID(name: "YES", value: "YUP"), picture: Picture(large: "", medium: "", thumbnail: "https://randomuser.me/api/portraits/thumb/men/29.jpg"), nat: "FI"), isShowingGender: true, isShowingLocation: true, isShowingEmail: true, isShowingLogin: true, isShowingRegistered: true, isShowingDob: true, isShowingPhone: true, isShowingCell: true, isShowingId: true, isShowingNat: true)
//}
