//
//  Filter.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation



typealias EventFilter = (Event) -> Bool


func createCityFilter(city: String) -> (Event) -> Bool {
  func filter(event: Event) -> Bool {
    return event.city.lowercased().contains(city.lowercased())
  }
  return filter
}

func createPriceFilter(price: Int) -> (Event) -> Bool {
  func filter(event: Event) -> Bool {
    return event.price <= price
  }
  return filter
}
 
