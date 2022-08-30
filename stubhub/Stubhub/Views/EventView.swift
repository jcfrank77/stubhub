//
//  EventView.swift
//  stubhub (iOS)
//
//  Created by Joel Frank on 30/08/2022.
//

import SwiftUI

struct EventView: View {
  
  var event: Event
  
  
  var body: some View {
    HStack {
      VStack {
        Text(self.event.name)
        Text(self.event.city)
      }
      .leftJustify()
      Text("$ \(self.event.price)")
    }
    
  }
}

struct EventView_Previews: PreviewProvider {
  static var previews: some View {
    EventView(event: Event(id: 42, name: "Vogon Poetry", venueName: "Red Rocks", city: "Chicago", price: 143, distanceFromVenue: 44, date: Date()))
  }
}

