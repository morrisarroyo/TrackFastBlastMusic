//
//  HomeController.swift
//  TrackFastBlastMusic
//
//  Created by Jason Sekhon on 2017-10-06.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData

class HomeController: UIViewController {
    @IBOutlet weak var CurrentlyPlayingView: UIView!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityText: UILabel!
    
    var managedObjectContext: NSManagedObjectContext!
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if CMMotionActivityManager.isActivityAvailable()
        {
            activityManager.startActivityUpdates(to: OperationQueue.main)
            { (data: CMMotionActivity!) -> Void in
                DispatchQueue.main.async
                    { () -> Void in
                        if data.stationary == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.blue
                            })
                            self.activityText.text = "Stationary"
                            self.activityImage.image = UIImage(named: "Sitting")
                        }
                        else if data.walking == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.red
                            })
                            self.activityText.text = "Walking"
                            self.activityImage.image = UIImage(named: "Walking")
                        }
                        else if data.running == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.green
                            })
                            self.activityText.text = "Running"
                            self.activityImage.image = UIImage(named: "Running")
                        }
                        else if data.cycling == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.magenta
                            })
                            self.activityText.text = "Cycling"
                            self.activityImage.image = UIImage(named: "Cycling")
                        }
                        else if data.automotive == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.yellow
                            })
                            self.activityText.text = "Automotive"
                            self.activityImage.image = UIImage(named: "Automotive")
                        }
                }
            }
        }
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
        print("test1")
        // Convert the location of the obstacle view to this view controller's view coordinate system
        let obstacleViewFrame = self.view.convert(CurrentlyPlayingView.frame, from: CurrentlyPlayingView.superview)
        // Check if the touch is inside the obstacle view
        if obstacleViewFrame.contains(touchLocation) {
            print("test2")
            performSegue(withIdentifier: "showPlayer", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ActivityViewController {
            destinationViewController.managedObjectContext = self.managedObjectContext
        }
    }

}
