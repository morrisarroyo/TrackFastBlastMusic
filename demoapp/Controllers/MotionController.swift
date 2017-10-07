//
//  MotionController.swift
//  demoapp
//
//  Created by Jason Sekhon on 2017-09-29.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit
import CoreMotion

class MotionController: UIViewController {
    @IBOutlet weak var activityState: UITextView!
    @IBOutlet weak var activityStateImage: UIImageView!
    @IBOutlet weak var confidence: UITextView!
    @IBOutlet weak var musicBtn: UIButton!
    
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityState.adjustsFontForContentSizeCategory = true
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
                            self.activityState.text = "Stationary"
                            self.activityStateImage.image = UIImage(named: "Sitting")
                            self.confidence.text = (String)(data.confidence.rawValue)
                        }
                        else if data.walking == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.red
                            })
                            self.activityState.text = "Walking"
                            self.activityStateImage.image = UIImage(named: "Walking")
                            self.confidence.text = (String)(data.confidence.rawValue)
                        }
                        else if data.running == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.green
                            })
                            self.activityState.text = "Running"
                            self.activityStateImage.image = UIImage(named: "Running")
                            self.confidence.text = (String)(data.confidence.rawValue)
                        }
                        else if data.automotive == true
                        {
                            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                                self.view.backgroundColor = UIColor.yellow
                            })
                            self.activityState.text = "Automotive"
                            self.activityStateImage.image = UIImage(named: "Automotive")
                            self.confidence.text = (String)(data.confidence.rawValue)
                        }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

