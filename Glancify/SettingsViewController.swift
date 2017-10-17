//
//  ViewController.swift
//  Glancify
//
//  Created by Thomas Carey on 10/16/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.layer?.backgroundColor = NSColor.red.cgColor
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
}

