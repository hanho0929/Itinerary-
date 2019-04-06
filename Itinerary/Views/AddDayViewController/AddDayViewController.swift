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
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subtitleTextField: UITextField!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var doneSaving:((DayModel) -> ())?
    var tripIndex: Int!
    var tripModel: TripModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if alreadyExists(datePicker.date) {
            let alert = UIAlertController(title: "Day Already Exists", message: "Pick Another Day", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(okAction)
            present(alert, animated: true)
            return 
        }
        
        let dayModel = DayModel(title: datePicker.date, subtitle: subtitleTextField.text ?? "", data: nil)
        
        DayFunctions.createDay(at: tripIndex, using: dayModel)
        
        
        if let doneSaving = doneSaving {
            doneSaving(dayModel)
        }
        dismiss(animated: true, completion: nil)
    }

    
    func alreadyExists(_ date: Date) -> Bool {
//        if tripModel.dayModels.contains(where: { (dayModel) -> Bool in
//            return dayModel.title == date
//        }) {
//            return true
//        }
        
        if tripModel.dayModels.contains(where: { $0.title.mediumDate() == date.mediumDate() }) {
            return true
        }
        return false
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
}
