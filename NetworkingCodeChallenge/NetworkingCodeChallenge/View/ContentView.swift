//
//  ContentView.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import SwiftUI

enum Gender: String, Equatable, CaseIterable {
    case male = "male"
    case female = "female"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct ContentView: View {
    @StateObject var userViewModel = UserViewModel()
    @State private var gender = Gender.male
    @State private var amount = 3
    @State private var isShowingGender = true
    @State private var isShowingLocation = true
    @State private var isShowingEmail = true
    @State private var isShowingLogin = true
    @State private var isShowingRegistered = true
    @State private var isShowingDob = true
    @State private var isShowingPhone = true
    @State private var isShowingCell = true
    @State private var isShowingId = true
    @State private var isShowingNat = true
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    UserCellView(user: userViewModel.users, isShowingGender: isShowingGender, isShowingLocation: isShowingLocation, isShowingEmail: isShowingEmail, isShowingLogin: isShowingLogin, isShowingRegistered: isShowingRegistered, isShowingDob: isShowingDob, isShowingPhone: isShowingPhone, isShowingCell: isShowingCell, isShowingId: isShowingId, isShowingNat: isShowingNat)
                }
                
                NavigationLink {
                    UserDetialsView(gender: $gender, amount: $amount, isShowingGender: $isShowingGender, isShowingLocation: $isShowingLocation, isShowingEmail: $isShowingEmail, isShowingLogin: $isShowingLogin, isShowingRegistered: $isShowingRegistered, isShowingDob: $isShowingDob, isShowingPhone: $isShowingPhone, isShowingCell: $isShowingCell, isShowingId: $isShowingId, isShowingNat: $isShowingNat)
                } label: {
                    Text("Grab Users!")
                }
            }
            .onAppear(perform: {
                userViewModel.fetchUsers(gender: gender.rawValue, amount: amount)
            })
        }
    }
}

#Preview {
    ContentView()
}
