//
//  Activity.swift
//  demoapp
//
//  Created by Jason Sekhon on 2017-11-08.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class Activity {
    var type: String
    var playlist: MPMediaPlaylist
    
    init?(type: String, playlist: MPMediaPlaylist){
        if (type.isEmpty){
            return nil
        }
        self.type = type
        self.playlist = playlist
    }
}
