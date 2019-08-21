//
//  QueueTimer.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 03/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Foundation

/// A type that exposes timer operations.
protocol QueueTimer {

    typealias TimeInterval = Foundation.TimeInterval

    /// A block that represents the `QueueTimer` schedule completion.
    typealias CompletionBlock = () -> Void

    /// Submits a completion block for asynchronous execution after
    /// a specified time.
    ///
    /// - Parameters:
    ///   - timeInterval: The time after which the completion block should be executed.
    ///   - completionBlock: A block called once the timeInterval finishes.
    func schedule(timeInterval: TimeInterval, completionBlock: @escaping CompletionBlock)

    /// Stops and releases the timer.
    func invalidate()
}
