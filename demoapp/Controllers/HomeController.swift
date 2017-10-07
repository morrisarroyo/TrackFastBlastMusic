//
//  HomeController.swift
//  TrackFastBlastMusic
//
//  Created by Jason Sekhon on 2017-10-06.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    // This array keeps track of all obstacle views
    var obstacleViews : [UIView] = []
    @IBOutlet weak var CurrentlyPlayingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        testTouches(touches: touches as NSSet)
    }
    
    func testTouches(touches: NSSet!) {
        // Get the first touch and its location in this view controller's view coordinate system
        let touch = touches.allObjects[0] as! UITouch
        let touchLocation = touch.location(in: self.view)
        print("test")
        for CurrentlyPlayingView in obstacleViews {
            print("test1")
            // Convert the location of the obstacle view to this view controller's view coordinate system
            let obstacleViewFrame = self.view.convert(CurrentlyPlayingView.frame, from: CurrentlyPlayingView.superview)
            // Check if the touch is inside the obstacle view
            if obstacleViewFrame.contains(touchLocation) {
                performSegue(withIdentifier: "showPlayer", sender: nil)
            }
        }
    }

}
