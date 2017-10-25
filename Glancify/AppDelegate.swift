//
//  AppDelegate.swift
//  Spotify Status
//
//  Created by Thomas Carey on 10/13/17.
//  Copyright © 2017 bls. All rights reserved.
//

// TODO:
// * Preference pane
//   * Hide dock icon ✅
//   * Autoupdate check pref
//   * Check for updates periodically if pref turned on
//   * Start at login
// * Integrate LetsMove ✅
// * App icon
// * Crashlytics

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
}