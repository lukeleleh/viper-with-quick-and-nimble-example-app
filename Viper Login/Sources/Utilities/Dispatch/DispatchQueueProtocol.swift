//
//  DispatchQueueProtocol.swift
//  Viper Login
//
//  Created by HRISTIC Luka on 20/08/2019.
//  Copyright © 2019 Hristic Luka. All rights reserved.
//

import Dispatch

protocol DispatchQueueProtocol {
    func asyncAfter(deadline: DispatchTime, execute: DispatchWorkItem)
}
