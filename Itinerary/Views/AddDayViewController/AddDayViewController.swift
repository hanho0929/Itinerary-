//
//  AddDayViewController.swift
//  Itinerary
//
//  Created by hanho on 3/20/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var doneSaving:(() -> ())?
    var tripIndextToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }

        
//        if let index = tripIndextToEdit {
//            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
//        } else {
//            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
//        }
        
        
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }

}
