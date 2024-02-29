//
//  UserViewModel.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    func fetchUserData(gender: String, amount: Int) async {
        var urlComponent  = URLComponents(string: "https://randomuser.me/api/")!
        let genderQueryItem = URLQueryItem(name: "gender", value: gender)
        let amountQueryItem = URLQueryItem(name: "results", value: String(amount))
        let inforQueryItem = URLQueryItem(name: "exc", value: "info")
        urlComponent.queryItems = [genderQueryItem, amountQueryItem, inforQueryItem]
        
        print(urlComponent)
        
        guard let downloadedUsers: Results = await WebService().downloadData(fromURL: urlComponent.url!) else { return }
        users = downloadedUsers.results
    }
    
    func fetchUsers(gender: String, amount: Int) {
        Task {
            await fetchUserData(gender: gender, amount: amount)
        }
    }
}
