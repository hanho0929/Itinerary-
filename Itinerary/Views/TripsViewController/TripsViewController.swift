//
//  TripsViewController.swift
//  Itinerary
//
//  Created by hanho on 3/4/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        TripFunctions.readTrips(completion: { [weak self] in
            self?.tableView.reloadData()
        })
    }

}

extension TripsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = Data.tripModels[indexPath.item].title
        
        return cell!
    }
    
    
}
