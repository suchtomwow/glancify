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
//   * Autoupdate check pref ✅
//   * Start at login
// * Integrate LetsMove ✅
// * App icon ✅
// * Crashlytics ✅

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var statusMenu: NSMenu!

  private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
  private let spotify = SpotifyService()

  func applicationWillFinishLaunching(_ notification: Notification) {
    FabricService.start()
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
    ]
    
    UserDefaults.standard.register(defaults: defaults)
  }
}
