//
//  Config.swift
//  Glancify
//
//  Created by Thomas Carey on 10/16/17.
//  Copyright © 2017 bls. All rights reserved.
//

struct Configuration {
  static let isRelease = !Configuration.isDebug

  static let isDebug: Bool = {
    var isDebug = false
    #if DEBUG
      isDebug = true
    #endif
    return isDebug
  }()
}
