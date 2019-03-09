//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by hanho on 3/9/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tripTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var doneSaving:(() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sabe(_ sender: UIButton) {
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
}
