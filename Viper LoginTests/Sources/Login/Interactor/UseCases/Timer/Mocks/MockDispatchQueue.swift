//
//  MockDispatchQueue.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Dispatch

@testable import Viper_Login

final class MockDispatchQueue: DispatchQueueProtocol {

    private(set) var dispatchWorkItem: DispatchWorkItem?

    func asyncAfter(deadline: DispatchTime, execute dispatchWorkItem: DispatchWorkItem) {
        self.dispatchWorkItem = dispatchWorkItem
    }
}
