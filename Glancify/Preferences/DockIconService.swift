//
//  DockIconService.swift
//  Glancify
//
//  Created by Thomas Carey on 10/24/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa

struct DockIconService {
  static func updateDockVisibility(toHidden hidden: Bool) {
    if hidden {
      NSApp.setActivationPolicy(.accessory)
    } else {
      NSApp.setActivationPolicy(.regular)
    }
  }
}
