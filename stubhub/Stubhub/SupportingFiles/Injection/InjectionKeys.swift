//
//  InjectionKeys.swift
//

import Foundation
import CloudKit
import UIKit


// Adapted from: https://www.avanderlee.com/swift/dependency-injection/
public protocol InjectionKey {
  /// The associated type representing the type of the dependency injection key's value.
  associatedtype Value
  
  /// The default value for the dependency injection key.
  static var currentValue: Self.Value { get set }
}




private struct EventServiceKey: InjectionKey {
  static var currentValue: EventProvider = EventService()
}




extension InjectedValues {
  var eventService: EventProvider {
    get { Self[EventServiceKey.self] }
    set { Self[EventServiceKey.self] = newValue }
  }
}
