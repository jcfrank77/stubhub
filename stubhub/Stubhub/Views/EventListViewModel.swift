//
//  EventViewModel.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation


class EventViewModel: ObservableObject {
  @Injected(\.eventService) fileprivate var eventService: EventProvider
  
  @Published var cityFilter: String = ""
  @Published var priceFilter: Int? = nil
  @Published var events: [Event] = []
  
  init() {
    // TODO move this to a one time trigger
    self.eventService.loadEvents()
    self.events = Array(self.eventService.applyFilters(filters: []))
  }
  
  func applyFilters() {
    var filters: [EventFilter] = []
    if(!self.cityFilter.isEmpty) { filters.append(createCityFilter(city: self.cityFilter)) }
    if((self.priceFilter ?? 0) > 0) { filters.append(createPriceFilter(price: self.priceFilter!)) }
    
    self.events = Array(self.eventService.applyFilters(filters: filters))
  }
}
