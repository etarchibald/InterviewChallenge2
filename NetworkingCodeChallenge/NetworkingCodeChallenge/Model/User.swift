//
//  User.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import Foundation

struct Results: Codable {
    var users: [User]
    var info: Info
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
        case info = "info"
    }
}

struct User: Codable, Hashable {
    var gender: String
    var name: Username
    var location: Location
    var email: String
    var login: Login
    var dob: DOB
    var registered: Registered
    var phone: String
    var cell: String
    var id: ID
    var picture: Picture
    var nat: String
    
    enum CodingKeys: CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case id
        case picture
        case nat
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id.value > rhs.id.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(nat)
    }
}

struct Username: Codable {
    var title: String
    var first: String
    var last: String
    
    enum CodingKeys: CodingKey {
        case title
        case first
        case last
    }
}

struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var postcode: String
    var coordinates: Coordinates
    var timezone: Timezone
    
    enum CodingKeys: CodingKey {
        case street
        case city
        case state
        case postcode
        case coordinates
        case timezone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(Street.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        self.timezone = try container.decode(Timezone.self, forKey: .timezone)
        let postCodeInt = try? container.decode(Int.self, forKey: .postcode)
        let postCodeString = try? container.decode(String.self, forKey: .postcode)
        if let postCodeInt {
            self.postcode = String(describing: postCodeInt)
        } else {
            self.postcode = postCodeString ?? ""
        }
    }
}

struct Street: Codable {
    var number: Int
    var name: String
    
    enum CodingKeys: CodingKey {
        case number
        case name
    }
}

struct Coordinates: Codable {
    var latitude: String
    var longitude: String
    
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
}

struct Timezone: Codable {
    var offset: String
    var description: String
    
    enum CodingKeys: CodingKey {
        case offset
        case description
    }
}

struct Login: Codable {
    var uuid: UUID
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
    
    enum CodingKeys: CodingKey {
        case uuid
        case username
        case password
        case salt
        case md5
        case sha1
        case sha256
    }
}

struct DOB: Codable {
    var date: String
    var age: Int
    
    enum CodingKeys: CodingKey {
        case date
        case age
    }
}

struct Registered: Codable {
    var date: String
    var age: Int
    
    enum CodingKeys: CodingKey {
        case date
        case age
    }
}

struct ID: Codable {
    var name: String
    var value: String
    
    enum CodingKeys: CodingKey {
        case name
        case value
    }
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    
    enum CodingKeys: CodingKey {
        case large
        case medium
        case thumbnail
    }
}

struct Info: Codable {
    var seed: String
    var results: Int
    var page: Int
    var version: String
    
    enum CodingKeys: CodingKey {
        case seed
        case results
        case page
        case version
    }
}
