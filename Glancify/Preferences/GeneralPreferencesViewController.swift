//
//  GeneralPreferencesViewController.swift
//  Glancify
//
//  Created by Thomas Carey on 10/24/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa

class GeneralPreferencesViewController: NSViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupObservers()
  }

  // MARK: - KVO -

  private func setupObservers() {
    UserDefaults.standard.addObserver(self, forKeyPath: UserDefaults.hideDockIcon, options: .new, context: nil)
    UserDefaults.standard.addObserver(self, forKeyPath: UserDefaults.autoCheckForUpdates, options: .new, context: nil)
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if let keyPath = keyPath {
      switch keyPath {
      case UserDefaults.autoCheckForUpdates:
        print("")
      case UserDefaults.hideDockIcon:
        DockIconService.updateDockVisibility(toHidden: UserDefaults.standard.bool(forKey: keyPath))
      default:
        NSLog("Observed unexpected keyPath change: \(keyPath)")
      }
    }
  }
}
