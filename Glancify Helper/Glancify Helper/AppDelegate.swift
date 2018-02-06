//
//  AppDelegate.swift
//  Glancify Helper
//
//  Created by Thomas Carey on 2/3/18.
//  Copyright © 2018 thomas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // /Applications/Glancify.app/Contents/Library/LoginItems/../../..
        let path = Bundle.main.bundleURL
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()

        NSLog("Path: \(path)")
        do {
            try NSWorkspace.shared.launchApplication(at: path, configuration: [:])
            NSLog("Launched Glancify")
        } catch {
            NSLog("Failed to launch Glancify. %@", error.localizedDescription)
        }

        NSApp.terminate(nil)
    }
}
