//
//  TabViewController.swift
//  Glancify
//
//  Created by Thomas Carey on 10/24/17.
//  Copyright © 2017 bls. All rights reserved.
//

import AppKit

final class TabViewController: NSTabViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    NSApplication.shared.windows.flatMap { $0.contentViewController as? TabViewController }.forEach {
      $0.view.window?.close()
    }
  }

  override func viewWillAppear() {
    super.viewWillAppear()
    NSApp.activate(ignoringOtherApps: true)
    setTitle(withItem: tabView.selectedTabViewItem)
  }

  override func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {
    super.tabView(tabView, didSelect: tabViewItem)
    setTitle(withItem: tabViewItem)
  }

  private func setTitle(withItem item: NSTabViewItem?) {
    let newTitle = item?.viewController?.title
    view.window?.title = newTitle ?? ""
  }
}

