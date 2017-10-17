//
//  Spotify.swift
//  Spotify Status
//
//  Created by Thomas Carey on 10/13/17.
//  Copyright © 2017 bls. All rights reserved.
//

import Cocoa

struct Spotify {
  enum Status: String {
    case playing = "kPSP"
    case paused = "kPSp"
    case stopped = "kPSS"
  }

  private let appleScript = NSAppleScript(source:
    """
    if application \"Spotify\" is running then
      tell application \"Spotify\"
        get player state
      end tell
    else
      return "\(Status.stopped.rawValue)"
    end if
    """)

  var playerState: Status {
    var errorDictionary: NSDictionary? = nil
    let response = appleScript?.executeAndReturnError(&errorDictionary).stringValue
    let status = Status(rawValue: response!)!
    return status
  }
}

