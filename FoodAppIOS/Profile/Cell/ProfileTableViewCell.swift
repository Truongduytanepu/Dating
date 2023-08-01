//
//  ProfileTableViewCell.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 25/07/2023.
//

import UIKit
import ActionSheetPicker_3_0
import WARangeSlider

protocol ProfileTableViewCellDelegate: AnyObject {
    func editBtnTapped()
}

class ProfileTableViewCell: UITableViewCell, UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var rangeSlider: RangeSlider!
    @IBOutlet weak var showGender: UIButton!
    @IBOutlet weak var viewImagePet: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewAgeShowMe: UIView!
    @IBOutlet weak var viewShowMe: UIView!
    @IBOutlet weak var viewAgePet: UIView!
    @IBOutlet weak var viewTypePet: UIView!
    @IBOutlet weak var viewGenderPet: UIView!
    @IBOutlet weak var viewNamePet: UIView!
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var viewImageOwn: UIView!
    @IBOutlet weak var imageOwn: UIImageView!
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var resultSlider: UILabel!
    @IBOutlet weak var agePet: UILabel!
    @IBOutlet weak var typePet: UILabel!
    @IBOutlet weak var genderPet: UILabel!
    @IBOutlet weak var namePet: UILabel!
    @IBOutlet weak var imagePet: UIImageView!
    @IBOutlet weak var ageOwn: UILabel!
    @IBOutlet weak var locationOwn: UILabel!
    @IBOutlet weak var genderOwn: UILabel!
    @IBOutlet weak var nameOwn: UILabel!
    @IBOutlet weak var editBtn1: UIButton!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var nameAndAgeOwn: UILabel!
    var genderPickerView: UIPickerView!
    var gender: [String]!
    var currentUser: UserProfile?
    var delegate: ProfileTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        
        
        rangeSlider.minimumValue = 0
        rangeSlider.maximumValue = 100
        
        rangeSlider.lowerValue = 20
            rangeSlider.upperValue = 80

        rangeSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged) // continuous changes
        
    }
    @objc func sliderValueChanged(_ slider: RangeSlider) {
        let lowerValue = slider.lowerValue
        let upperValue = slider.upperValue
        resultSlider.text = "\(Int(lowerValue)) - \(Int(upperValue))"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpUI(){
        imageOwn.layer.cornerRadius = imageOwn.frame.height / 2
        viewImageOwn.layer.cornerRadius = viewImageOwn.frame.height / 2
        imagePet.layer.cornerRadius = 40
        viewImagePet.layer.cornerRadius = 30
        viewAge.setUpView()
        viewName.setUpView()
        viewGender.setUpView()
        viewLocation.setUpView()
        viewNamePet.setUpView()
        viewGenderPet.setUpView()
        viewTypePet.setUpView()
        viewAgePet.setUpView()
        viewShowMe.setUpView()
        viewAgeShowMe.setUpView()
        logOut.setUpView()
        gender = ["Male", "Female", "Other"]
    }
    
    func showGenderPicker() {
        // Sử dụng ActionSheetStringPicker để hiển thị UIPickerView trong action sheet
        ActionSheetStringPicker.show(withTitle: "Select Gender", rows: gender, initialSelection: 0, doneBlock: { [weak self] picker, selectedIndex, selectedValue in
            guard let selectedGender = selectedValue as? String else { return }
            self?.currentUser?.gender = selectedGender
            self?.showGender.setTitle(selectedGender, for: .normal)
        }, cancel: nil, origin: self)
    }
    
    @IBAction func editBtnHandle(_ sender: Any) {
        delegate?.editBtnTapped()
    }
    @IBAction func selectGenderBtn(_ sender: Any) {
        showGenderPicker()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
}

extension UIView {
    func setUpView() {
        self.layer.borderColor = UIColor(red: 0.766, green: 0.766, blue: 0.766, alpha: 1).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5
    }
}
