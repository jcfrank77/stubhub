//
//  EventService.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import Foundation


protocol EventProvider {
  func loadEvents()
  func applyFilters(filters: [EventFilter]) -> Set<Event>
}



class EventService: EventProvider {

  private(set) var root: Category? = nil
  private(set) var events: Set<Event> = Set<Event>()
  
  func loadEvents() {
    do {
      
      guard let eventsPath = Bundle.main.path(forResource: "events", ofType: "json"),
            let eventData: Data = try String(contentsOfFile: eventsPath).data(using: .utf8) else {
        fatalError("Failed to load events file")
      }
      
      // "Jul 24 2022"
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM dd yyyy"
      
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(dateFormatter)
      self.root = try decoder.decode(Category.self, from: eventData)
      self.events = self.extractEvents(current: self.root)
      
    } catch {
      print("failed to laod events: \(error)")
    }
  }
  
  
  
  func applyFilters(filters: [EventFilter]) -> Set<Event> {
    var filtered: Set<Event> = self.events
    
    for eventFilter: EventFilter in filters { filtered = filtered.filter(eventFilter) }
 
    print(filtered)
    return filtered
  }
  
  
  fileprivate func extractEvents(current: Category?) -> Set<Event> {
    guard let current = current else { return [] }
    
    var events: Set<Event> = Set<Event>()

    // do a depth first search, following children down the tree to the leaves
    if(!current.children.isEmpty) {
      for child: Category in current.children {
        let deepEvents: Set<Event> = self.extractEvents(current: child)
        events = events.union(deepEvents)
      }
    }
    
    events = events.union(current.events)
    
    return events
  }
}

