//
//  StartAtLoginService.swift
//  Glancify
//
//  Created by Thomas Carey on 2/3/18.
//  Copyright © 2018 bls. All rights reserved.
//

import Cocoa
import ServiceManagement

class StartAtLoginService {
    static func updateStartAtLogin(to enabled: Bool) {
        let bundleID = "com.bls.Glancify-Helper" as CFString
        if !SMLoginItemSetEnabled(bundleID, enabled) {
            NSLog("The login was not successful")
        }
    }
}
