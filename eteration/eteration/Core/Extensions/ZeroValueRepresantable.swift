//
//  ZeroValueRepresantable.swift
//  eteration
//
//  Created by Emir Keleş on 3.08.2024.
//

import UIKit

public protocol ZeroValueRepresentable {
  static var zeroValue: Self { get }
}

public protocol DigitZeroValueRepresentable {
  static var digitZeroValue: Self { get }
}

// MARK: - Int
extension Int: ZeroValueRepresentable {
  public static var zeroValue: Int { return 0 }
}
// MARK: - Double
extension Double: ZeroValueRepresentable {
  public static var zeroValue: Double { return 0.0 }
}
// MARK: - CGFloat
extension CGFloat: ZeroValueRepresentable {
  public static var zeroValue: CGFloat { return 0.0 }
}
// MARK: - UIEdgeInsets
extension UIEdgeInsets: ZeroValueRepresentable {
  public static var zeroValue: UIEdgeInsets { return .zero }
}
// MARK: - String
extension String: ZeroValueRepresentable {
  public static var zeroValue: String { return "0" }
  public static var zeroValueWithFractionalDigits: String { return "0,00" }
}

extension String: DigitZeroValueRepresentable {
  public static var digitZeroValue: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal

    if let formattedNumber = numberFormatter.string(from: NSNumber(value: 0.0)) {
      return formattedNumber
    } else {
      return "0,0"
    }
  }
}

extension Decimal: ZeroValueRepresentable {
  public static var zeroValue: Decimal { return 0.0 }
}
