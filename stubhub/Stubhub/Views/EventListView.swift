//
//  ContentView.swift
//  Shared
//
//  Created by Joel Frank on 30/08/2022.
//

import SwiftUI

struct EventListView: View {
  
  @StateObject var viewModel: EventViewModel = EventViewModel()
  
  
  var body: some View {
    VStack {
      Text("City Filter")
        .leftJustify()
      TextField("Filter by city...", text: $viewModel.cityFilter)
      TextField("Filter by price...", value: $viewModel.priceFilter, format: .number)
        .onChange(of: viewModel.priceFilter) { newValue in
          if (newValue ?? 0) < 0 {
            viewModel.priceFilter = 0
          }
        }
        .keyboardType(.numberPad)
      Button {
        self.viewModel.applyFilters()
      } label: {
        Text("Apply")
          .padding(8)
      }
      .padding(.top, 20)
      ScrollView {
        ForEach(self.viewModel.events, id: \.self) { event in
          EventView(event: event)
        }
      }
      .padding(.top, 20)
      Spacer()
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EventListView()
  }
}

