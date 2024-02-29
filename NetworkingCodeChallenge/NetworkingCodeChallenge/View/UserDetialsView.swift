//
//  UserDetialsView.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import SwiftUI

struct UserDetialsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var userViewModel = UserViewModel()
    
    @Binding var gender: Gender
    @Binding var amount: Int
    @Binding var isShowingGender: Bool
    @Binding var isShowingLocation: Bool
    @Binding var isShowingEmail: Bool
    @Binding var isShowingLogin: Bool
    @Binding var isShowingRegistered: Bool
    @Binding var isShowingDob: Bool
    @Binding var isShowingPhone: Bool
    @Binding var isShowingCell: Bool
    @Binding var isShowingId: Bool
    @Binding var isShowingNat: Bool
    
    var body: some View {
        
        List {
            Picker("Gender:", selection: $gender) {
                ForEach(Gender.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        .tag(value)
                }
            }
            
            HStack {
                Stepper("Amount", value: $amount, in: 0...20)
                Text("\(amount)")
            }
            
            Toggle("Show Gender:", isOn: $isShowingGender)
            Toggle("Show Location:", isOn: $isShowingLocation)
            Toggle("Show Email:", isOn: $isShowingEmail)
            Toggle("Show Login:", isOn: $isShowingLogin)
            Toggle("Show Registered:", isOn: $isShowingRegistered)
            Toggle("Show Date of Birth:", isOn: $isShowingDob)
            Toggle("Show Phone Number:", isOn: $isShowingPhone)
            Toggle("Show Cell Number:", isOn: $isShowingCell)
            Toggle("Show Id:", isOn: $isShowingId)
            Toggle("Show Nationality:", isOn: $isShowingNat)
        }
        
        
        Button {
           dismiss()
            userViewModel.fetchUsers(gender: gender.rawValue, amount: amount)
        } label: {
            Text("Get Users")
        }
        
        Spacer()
    }
}

#Preview {
    UserDetialsView(gender: .constant(Gender(rawValue: "male") ?? Gender.female), amount: .constant(5), isShowingGender: .constant(false), isShowingLocation: .constant(false), isShowingEmail: .constant(false), isShowingLogin: .constant(false), isShowingRegistered: .constant(false), isShowingDob: .constant(false), isShowingPhone: .constant(false), isShowingCell: .constant(false), isShowingId: .constant(false), isShowingNat: .constant(false))
}
