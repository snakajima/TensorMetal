//
//  Tensor.swift
//  TensorMetal
//
//  Created by satoshi on 9/20/16.
//  Copyright © 2016 Satoshi Nakajima. All rights reserved.
//

import Foundation
import Metal

public struct Tensor {
    static let device = MTLCreateSystemDefaultDevice()!
    public typealias Element = CFloat
    public let shape: Shape
    public let elements:MTLBuffer

    public init(shape: Shape, data:NSData ) {
        let volume = shape.volume
        let length = volume * sizeof(Element)
        assert(data.length >= length)
        self.shape = shape
        self.elements = Tensor.device.newBufferWithBytes(data.bytes, length: length, options: [.StorageModeShared])
    }
}

extension Tensor { // Additional Initializers
    public init(shape: Shape, element: Element = 0.0) {
        let volume = shape.volume
        let length = volume * sizeof(Element)
        self.shape = shape
        self.elements = Tensor.device.newBufferWithLength(length, options: [.StorageModeShared])
        let contents = UnsafeMutablePointer<Float>(self.elements.contents())
        for i in 0..<volume {
            contents[i] = element
        }
    }
}

/*
extension Tensor {
    public func reshape(shape: Shape) -> Tensor {
        return Tensor(shape: shape, elements: elements)
    }
}
*/
