//
//  AddActivitiesViewController.swift
//  Itinerary
//
//  Created by hanho on 3/23/19.
//  Copyright © 2019 hanho. All rights reserved.
//

import UIKit

class AddActivityViewController: UITableViewController {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayPickerView: UIPickerView!
    
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    var doneSaving:((Int,ActivityModel) -> ())?
    var tripIndex: Int! // Need for saving
    var tripModel: TripModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
    }
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        activityTypeButtons.forEach({ $0.tintColor = Theme.accnet })
        sender.tintColor = Theme.tintColor
    }
    
    
    @IBAction func save(_ sender: AppUIButton) {
        guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }
        let activittType: ActivityType = getSelectedActivityType()
        
        let dayIndex = dayPickerView.selectedRow(inComponent: 0)
        let activityModel = ActivityModel(title: newTitle, subTitle: subtitleTextField.text ?? "" , activityType: activittType)
        ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, using: activityModel)
        
        if let doneSaving = doneSaving {
            doneSaving(dayIndex,activityModel)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func getSelectedActivityType() -> ActivityType {
        for (index, button) in activityTypeButtons.enumerated() {
            if button.tintColor == Theme.tintColor {
                return ActivityType(rawValue: index) ?? .trip
            }
        }
        
        return .trip
    }
    
    @IBAction func cancel(_ sender: AppUIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tripModel.dayModels[row].title.mediumDate()
    }
    
    
}
