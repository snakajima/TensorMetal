//
//  Shape.swift
//  TensorMetal
//
//  Created by satoshi on 9/20/16.
//  Copyright © 2016 Satoshi Nakajima. All rights reserved.
//

import UIKit

public typealias Dimension = Int

public struct Shape {
    public let dimensions:[Dimension]

    public var volume: Int {
        return dimensions.reduce(1) { $0 * $1 }
    }
}

extension Shape: ArrayLiteralConvertible {
    public init(arrayLiteral elements: Dimension...) {
        self.init(dimensions: elements)
    }
}

extension Shape: Equatable {}
public func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.dimensions == rhs.dimensions
}

extension Shape: CustomStringConvertible {
    public var description: String {
        return dimensions.description
    }
}
