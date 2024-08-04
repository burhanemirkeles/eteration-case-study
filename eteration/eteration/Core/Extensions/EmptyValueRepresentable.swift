//
//  EmptyValueRepresentable.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import Foundation

public protocol EmptyValueRepresentable {
  static var emptyValue: Self { get }
}

extension String: EmptyValueRepresentable {
  public static var emptyValue: String { return "" }
}

extension Array: EmptyValueRepresentable {
  public static var emptyValue: [Element] { return [] }
}

// MARK: Boolean Optionals
public extension Swift.Optional where Wrapped == Bool {
  var orTrue: Bool {
    guard let self = self else { return true }
    return self
  }

  var orFalse: Bool {
    guard let self = self else { return false }
    return self
  }

  func isEqualTo(_ bool: Bool?) -> Bool {
    guard let self = self, let boolValue = bool else { return false }
    return self == boolValue
  }
}

// MARK: Integer Optional
public extension Swift.Optional where Wrapped == Int {
  func or(_ defaultValue: Int) -> Int {
    guard let self = self else { return defaultValue }
    return self
  }

  var orZero: Int {
    guard let self else { return 0}
    return self
  }
}

// MARK: Nil Check
public extension Swift.Optional {
  var notNil: Bool { return self != nil }
  var isNil: Bool { return self == nil }
}

// MARK: String
public extension Swift.Optional where Wrapped == String {
  var isNilOrEmpty: Bool {
    guard let self = self else { return true }
    return self.isEmpty
  }
}

public extension Swift.Optional where Wrapped == String {
  func or(_ defaultValue: String) -> String {
    guard let self = self, !self.isEmpty else { return defaultValue }
    return self
  }

  func isEqualTo(_ string: String?) -> Bool {
    guard let self = self, let string = string else { return false }
    return self == string
  }

  var orEmpty: Wrapped {
    switch self {
    case .some(let value):
      return value
    case .none:
      return Wrapped.emptyValue
    }
  }
}


