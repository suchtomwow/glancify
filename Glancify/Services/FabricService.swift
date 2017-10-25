//
//  Fabric.swift
//  Glancify
//
//  Created by Thomas Carey on 10/24/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa
import Crashlytics
import Fabric

struct FabricService {
  static func start() {
    // https://docs.fabric.io/apple/crashlytics/os-x.html
    UserDefaults.standard.register(defaults: ["NSApplicationCrashOnExceptions": true])

    // http://thomascarey.party/hide-private-api-keys-oss
    do {
      if let url = Bundle.main.url(forResource: "fabric.apikey", withExtension: nil) {
        let key = try String(contentsOf: url, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)
        Crashlytics.start(withAPIKey: key)
      }
    } catch {
      NSLog("Could not retrieve Crashlytics API key. Check that fabric.apikey exists, contains your Crashlytics API key, and is a member of the target")
    }
  }
}
