//
//  PlaylistController.swift
//  TrackFastBlastMusic
//
//  Created by Jason Sekhon on 2017-10-06.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit
import CoreData

class PlaylistController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    private var playlist = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.dataSource = self
        playlistTableView.delegate   = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return playlist.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "PlaylistAddSongTableViewCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = playlistTableView.dequeueReusableCell(withIdentifier: "PlaylistSongTableViewCell", for: indexPath) as? PlaylistSongTableViewCell else {
            fatalError("PlaylistController, the dequeued cell is not an instance of PlaylistSongTableViewCell")
        }
        
        return cell
    }
    
    
}
