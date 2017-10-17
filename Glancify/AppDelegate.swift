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
// * Integrate LetsMove ✅
// * App icon

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
  let spotify = Spotify()

  func applicationWillFinishLaunching(_ notification: Notification) {
    if Configuration.isRelease {
      PFMoveToApplicationsFolderIfNecessary()
    }
  }

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    let menu = AppMenu()
    statusItem.menu = menu
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
}

