//
//  MainQueueTimer.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Foundation

/// A type that exposes timer operations
/// using the main thread.
final class MainQueueTimer: QueueTimer {

    private let dispatchQueue: DispatchQueueProtocol

    init(dispatchQueue: DispatchQueueProtocol) {
        self.dispatchQueue = dispatchQueue
    }

    private var dispatchWorkItem: DispatchWorkItem?

    func schedule(timeInterval: TimeInterval, completionBlock: @escaping CompletionBlock) {
        let dispatchWorkItem = DispatchWorkItem(block: completionBlock)
        self.dispatchWorkItem = dispatchWorkItem
        dispatchQueue.asyncAfter(deadline: .now() + timeInterval, execute: dispatchWorkItem)
    }

    func invalidate() {
        dispatchWorkItem?.cancel()
        dispatchWorkItem = nil
    }
}
