// Created by UnsafePointers on 11/6/21.
// License: Apache 2.0

import Foundation

public protocol TextSource {
    func fetch (index: Int, count: Int?) -> [String]
}

extension TextSource {
    public func fetch (index: Int = 0, count: Int? = nil) -> [String] {
        self.fetch(index: index, count: count)
    }
}

