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
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet var helpView: UIVisualEffectView!
    var tripIndextToEdit: Int?
    var seenHelper = "seenHelper"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion: { [unowned self] in
            self.tableView.reloadData()
            
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenHelper) == false {
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.frame
                }
                
            }
        })

       
        
        view.backgroundColor = UIColor(named: "Background")
        addButton.createFloatActionButton()
        addButton.backgroundColor = Theme.tintColor
        
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndextToEdit = self.tripIndextToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndextToEdit = nil
        }
    }
    @IBAction func closeHelpView(_ sender: AppUIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(false, forKey: self.seenHelper)
        }
        
    }
}

extension TripsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell

        cell.setUp(tripModel: Data.tripModels[indexPath.item])
        cell.titleLabel.numberOfLines = 1
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let title = Data.tripModels[indexPath.row].title
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this row : \(title)", preferredStyle: .alert)
                
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                    actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform delete
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true, completion: nil)
    
        }
            delete.image = #imageLiteral(resourceName: "delete")
    
    
            return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            self.tripIndextToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        
        edit.image = #imageLiteral(resourceName: "edit")
        edit.backgroundColor = UIColor(named: "EditColor")
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    
}

extension TripsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
