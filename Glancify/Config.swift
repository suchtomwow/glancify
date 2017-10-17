//
//  Config.swift
//  Glancify
//
//  Created by Thomas Carey on 10/16/17.
//  Copyright © 2017 bls. All rights reserved.
//

struct Configuration {
  static var isRelease: Bool {
    var isRelease = false
    #if Release
      isRelease = true
    #endif
    return isRelease
  }
}
