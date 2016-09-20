//
//  Classifier.swift
//  TensorMetal
//
//  Created by satoshi on 9/20/16.
//  Copyright © 2016 Satoshi Nakajima. All rights reserved.
//

import Foundation

public struct Classifier {
    public let W_conv1: Tensor
    public let b_conv1: Tensor
    public let W_conv2: Tensor
    public let b_conv2: Tensor
    public let W_fc1: Tensor
    public let b_fc1: Tensor
    public let W_fc2: Tensor
    public let b_fc2: Tensor

    public init(path: NSURL) {
        W_conv1 = Tensor(shape: [5, 5, 1, 32], data: loadFloatArray(directory: path, file: "W_conv1"))
        b_conv1 = Tensor(shape: [32], data: loadFloatArray(directory: path, file: "b_conv1"))
        W_conv2 = Tensor(shape: [5, 5, 32, 64], data: loadFloatArray(directory: path, file: "W_conv2"))
        b_conv2 = Tensor(shape: [64], data: loadFloatArray(directory: path, file: "b_conv2"))
        W_fc1 = Tensor(shape: [7 * 7 * 64, 1024], data: loadFloatArray(directory: path, file: "W_fc1"))
        b_fc1 = Tensor(shape: [1024], data: loadFloatArray(directory: path, file: "b_fc1"))
        W_fc2 = Tensor(shape: [1024, 10], data: loadFloatArray(directory: path, file: "W_fc2"))
        b_fc2 = Tensor(shape: [10], data: loadFloatArray(directory: path, file: "b_fc2"))
    }
}

private func loadFloatArray(directory directory: NSURL, file: String) -> NSData {
    return NSData(contentsOfURL: directory.URLByAppendingPathComponent(file))!
}

