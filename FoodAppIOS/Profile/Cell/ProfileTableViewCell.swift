//
//  ProfileTableViewCell.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 25/07/2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

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
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resultSlider: UILabel!
    @IBOutlet weak var shoGender: UIButton!
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
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
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
    }
}

extension UIView {
    func setUpView() {
        self.layer.borderColor = UIColor(red: 0.766, green: 0.766, blue: 0.766, alpha: 1).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5
    }
}
