//
//  CategoryNode.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation


struct Category: Codable {
  var id: Int
  var name: String
  var children: [Category]
  var events: [Event]
}
