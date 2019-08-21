//
//  MainQueueTimerTests.swift
//  Viper LoginTests
//
//  Created by HRISTIC Luka on 19/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Quick
import Nimble

@testable import Viper_Login

class MainQueueTimerTests: QuickSpec {

    override func spec() {
        var dispatchQueue: MockDispatchQueue!
        var sut: MainQueueTimer!

        beforeEach {
            dispatchQueue = MockDispatchQueue()
            sut = MainQueueTimer(dispatchQueue: dispatchQueue)
        }

        describe("scheduling") {
            it("should execute the completion block after the time lapses") {
                // Given
                let timeInterval: TimeInterval = 1
                let completionBlock = { }

                // When
                sut.schedule(timeInterval: timeInterval, completionBlock: completionBlock)
                let result = dispatchQueue.dispatchWorkItem

                // Then
                expect(result).toNot(beNil())
            }
        }

        describe("invalidating") {
            it("should cancel the scheduled operation") {
                // Given the preconditions
                // When
                sut.invalidate()
                let result = dispatchQueue.dispatchWorkItem

                // Then
                expect(result).to(beNil())
            }

            context("a timer scheduled and running") {
                it("should cancel the operation") {
                    /// Given
                    let timeInterval: TimeInterval = 1
                    let completionBlock = { }

                    // When
                    sut.schedule(timeInterval: timeInterval, completionBlock: completionBlock)
                    sut.invalidate()
                    let result = dispatchQueue.dispatchWorkItem

                    // Then
                    expect(result?.isCancelled).to(beTrue())
                }
            }
        }

    }

}
