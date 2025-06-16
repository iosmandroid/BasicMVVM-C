//
//  Bindable.swift
//  BasicMVVM-C
//
//  Created by otto on 16.06.2025.
//

import Foundation


final class Bindable<T> {
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
}
