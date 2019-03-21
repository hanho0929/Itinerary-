//
//  ActivitiesViewController.swift
//  Itinerary
//
//  Created by hanho on 3/13/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var addButton: AppUIButton!
    
    var tripId: UUID!
    var tripTitle = ""
    var tripModel: TripModel?
    var sectionHederHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = tripTitle
        addButton.createFloatActionButton()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return }
            self.tripModel = model
            
            
            guard let model = model else { return }
            
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
        
        
        sectionHederHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAction(_ sender: AppUIButton) {
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handelAddDay)
        
        let activityAction = UIAlertAction(title: "Activity", style: .default) { (action) in
            print("Add new activity")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.height)
        
        present(alert, animated: true)
        
        
    }
    
    
    func handelAddDay(action: UIAlertAction) {
        print("Add new Day")
//        let storyboard = UIStoryboard(name: String(describing: AddDayViewController.self), bundle: nil)
//        let vc = storyboard.instantiateInitialViewController() as! AddDayViewController
        let vc = AddDayViewController.getInstance()
        present(vc, animated: true)
        
    }

}



extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHederHeight
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        cell.setup(model: dayModel!)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        
        cell.setUp(model: model!)
        
        return cell
    }
    
    
}
