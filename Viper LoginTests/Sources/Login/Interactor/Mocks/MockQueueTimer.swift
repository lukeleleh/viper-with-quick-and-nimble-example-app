//
//  MockQueueTimer.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

@testable import Viper_Login

final class MockQueueTimer: QueueTimer {

    func schedule(timeInterval: TimeInterval, completionBlock: @escaping CompletionBlock) {
        completionBlock()
    }

    func invalidate() {
        
    }
    
}
