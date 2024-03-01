//
//  User.swift
//  NetworkingCodeChallenge
//
//  Created by Ethan Archibald on 2/29/24.
//

import Foundation

struct Results: Codable {
    var results: [User]
}

struct User: Codable {
    var gender: String?
    var name: Name
    var location: Location
    var email: String?
    var login: Login
    var dob: DateAge
    var registered: Register
    var phone: String?
    var cell: String?
    var id: ID
    var picture: Picture
    var nat: String?
}

struct Name: Codable {
    var title: String?
    var first: String?
    var last: String?
}

struct Location: Codable {
    var street: Street?
    var city: String?
    var country: String?
    var postcode: String?
    var coordinates: Coordinate?
    var timezone: TimeyZone?
    
  enum CodingKeys: CodingKey {
      case street
      case city
      case country
      case postcode
      case coordinates
      case timezone
  }
    
  init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.street = try container.decodeIfPresent(Street.self, forKey: .street)
      self.city = try container.decodeIfPresent(String.self, forKey: .city)
      self.country = try container.decodeIfPresent(String.self, forKey: .country)
      self.coordinates = try container.decodeIfPresent(Coordinate.self, forKey: .coordinates)
      self.timezone = try container.decodeIfPresent(TimeyZone.self, forKey: .timezone)
      let postcodeString = try? container.decodeIfPresent(String.self, forKey: .postcode)
      let postcodeInt = try? container.decodeIfPresent(Int.self, forKey: .postcode)
      if postcodeString != nil {
          self.postcode = postcodeString
      } else {
          self.postcode = String(describing: postcodeInt)
      }
  }
}

struct Street: Codable {
    var number: Int?
    var name: String?
}

struct Coordinate: Codable {
    var latitude: String?
    var longitude: String?
}

struct TimeyZone: Codable {
    var offset: String?
    var description: String?
}

struct Login: Codable {
    var uuid: String
    var username: String?
    var password: String?
}

struct DateAge: Codable {
    var date: String?
    var age: Int?
}

struct Register: Codable {
    var date: String?
    var age: Int?
}
struct ID: Codable, Hashable {
    var name: String?
    var value: String?
}

struct Picture: Codable {
    var large: String?
    var medium: String?
    var thumbnail: String?
}
