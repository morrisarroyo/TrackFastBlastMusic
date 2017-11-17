//
//  ActivityViewController.swift
//  demoapp
//
//  Created by Morris Arroyo on 2017-11-16.
//  Copyright © 2017 Jason Sekhon. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activityTableView: UITableView!
    private var activities = [Activity]()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTableView.dataSource = self
        activityTableView.delegate   = self
        for act in ActivityType.all {
            activities.append(Activity(name: act.description, type: act.rawValue))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ActivityType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCellId  = "ActivityLeftTableViewCell"
        let rightCellId = "ActivityRightTableViewCell"
        let activity = activities[indexPath.row]
        if (indexPath.row % 2  == 0) {
            guard let cell = activityTableView.dequeueReusableCell(withIdentifier: leftCellId) as? ActivityLeftTableViewCell else {
                fatalError("ActivityViewController, the dequeued cell is not an instance of ActivityLeftTableViewCell")
            }
            cell.activityImage.image = UIImage(named: activity.name)
            cell.activityName.text = activity.name
            cell.editImage.image = #imageLiteral(resourceName: "icons8-Edit Filled")
            return cell
        } else {
            guard let cell = activityTableView.dequeueReusableCell(withIdentifier: rightCellId) as? ActivityRightTableViewCell else {
                fatalError("ActivityViewController, the dequeued cell is not an instance of ActivityRightTableViewCell")
            }
            cell.activityImage.image = UIImage(named: activity.name)
            cell.activityName.text = activity.name
            cell.editImage.image = #imageLiteral(resourceName: "icons8-Edit")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "ShowPlaylistSongsSegue", sender: cell)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
