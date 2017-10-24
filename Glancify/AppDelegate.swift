//
//  AppDelegate.swift
//  Spotify Status
//
//  Created by Thomas Carey on 10/13/17.
//  Copyright © 2017 bls. All rights reserved.
//

// TODO:
// * Preference pane
//   * Hide dock icon
//   * Autoupdate
//   * Shows app icon when displayed
//   * Start at login
// * Integrate LetsMove ✅
// * App icon

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var statusMenu: NSMenu!

  let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
  let spotify = Spotify()

  func applicationWillFinishLaunching(_ notification: Notification) {
    if Configuration.isRelease {
      PFMoveToApplicationsFolderIfNecessary()
    }

    registerDefaults()
    observePreferenceChanges()
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    statusItem.menu = statusMenu
    updateIcon()
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateIcon), userInfo: nil, repeats: true)
  }

  @objc func updateIcon() {
    let image: NSImage?
    switch spotify.playerState {
    case .paused, .stopped:
      image = NSImage(named: .play)
    case .playing:
      image = NSImage(named: .pause)
    }

    statusItem.image = image
  }

  private func registerDefaults() {
    let defaults: [String: Any] = [
      UserDefaults.hideDockIcon: true,
      UserDefaults.autoCheckForUpdates: true
    ]
    
    UserDefaults.standard.register(defaults: defaults)
  }

  private func updateDockVisibility(toHidden hidden: Bool) {
    if hidden {
      NSApp.setActivationPolicy(.accessory)
    } else {
      NSApp.setActivationPolicy(.regular)
    }
  }

  // MARK: - KVO -

  private func observePreferenceChanges() {
    UserDefaults.standard.addObserver(self, forKeyPath: UserDefaults.hideDockIcon, options: .new, context: nil)
    UserDefaults.standard.addObserver(self, forKeyPath: UserDefaults.autoCheckForUpdates, options: .new, context: nil)
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if let keyPath = keyPath {
      switch keyPath {
      case UserDefaults.autoCheckForUpdates:
        print("")
      case UserDefaults.hideDockIcon:
        updateDockVisibility(toHidden: UserDefaults.standard.bool(forKey: keyPath))
      default:
        NSLog("Observed unexpected keyPath change: \(keyPath)")
      }
    }
  }
}

// MARK: - NSMenuDelegate -

extension AppDelegate: NSMenuDelegate {

}

