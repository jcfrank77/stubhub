//
//  EventNode.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation


struct Event: Codable, Hashable {
  var id: Int
  var name: String
  var venueName: String
  var city: String
  var price: Int
  var distanceFromVenue: Double
  var date: Date
}
