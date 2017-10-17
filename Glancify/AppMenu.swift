//
//  AppMenu.swift
//  Glancify
//
//  Created by Thomas Carey on 10/16/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa

class AppMenu: NSMenu {
  init() {
    super.init(title: "")

    let preferencesMenuItem = NSMenuItem(title: "Preferences...", action: #selector(showPreferences), keyEquivalent: ",")
    let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")

    preferencesMenuItem.target = self
    quitMenuItem.target = self

    addItem(preferencesMenuItem)
    addItem(NSMenuItem.separator())
    addItem(quitMenuItem)
  }

  required init(coder decoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func showPreferences() {
  }

  @objc private func quit() {
  }

  override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
    return true
  }
}
