//
//  UserViewController.swift
//  FoodAppIOS
//
//  Created by Trương Duy Tân on 12/07/2023.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import Kingfisher

class User {
    var userId: String
    var name: String
    var age: Int
    var location: String
    var pet: Pet?
    var image: String?
    
    init(userId: String, name: String, age: Int, location: String, pet: Pet? = nil, image: String? = nil) {
        self.userId = userId
        self.name = name
        self.age = age
        self.location = location
        self.pet = pet
        self.image = image
    }
}

class Pet {
    var image: String?
    
    init(image: String? = nil) {
        self.image = image
    }
}

class UserViewController: UIViewController {
    
    var users: [User] = []
    var databaseRef: DatabaseReference!
    var storageRef = Storage.storage().reference()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Thiết lập dataSource và delegate cho UICollectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Cấu hình UICollectionView, ví dụ: đăng ký cell tùy chỉnh
        collectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserCollectionViewCell")
        
        // Khởi tạo database reference và storage reference
        databaseRef = Database.database().reference()
        storageRef = Storage.storage().reference()
        
        // Lấy dữ liệu người dùng từ Firebase
        fetchUserData()
        self.collectionView.reloadData()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
    func fetchUserData() {
        databaseRef.child("user").observe(.value) { snapshot in
            self.users.removeAll()
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let userDict = snapshot.value as? [String: Any] {
                    
                    let userId = snapshot.key
                    let name = userDict["name"] as? String ?? ""
                    let age = userDict["age"] as? Int ?? 0
                    let location = userDict["location"] as? String ?? ""
                    let image = userDict["image"] as? String ?? ""
                    
                    var pet: Pet?
                    if let petDict = userDict["pet"] as? [String: Any],
                       let petImage = petDict["img"] as? String {
                        
                        pet = Pet(image: petImage)
                    }
                    
                    let user = User(userId: userId, name: name, age: age, location: location, pet: pet, image: image)
                    self.users.append(user)
                }
            }
            
            self.collectionView.reloadData()
        }
    }
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        
        let user = users[indexPath.item]
        
        // Cập nhật giao diện cell với thông tin người dùng
        cell.nameOwnLbl.text = user.name
        cell.locationOwnLbl.text = user.location
        
        // Tải ảnh từ Firebase Storage cho người dùng(image)
        if let imageURLString = user.image, let imageURL = URL(string: imageURLString) {
            cell.imageOwn.kf.setImage(with: imageURL)
            }
        
        // Kiểm tra xem người dùng có thú cưng hay không
        if let pet = user.pet, let petImageURLString = pet.image, let petImageURL = URL(string: petImageURLString) {
            cell.imagePet.kf.setImage(with: petImageURL)
            }
        return cell
    }
}

// Thêm extension UICollectionViewDelegate nếu cần xử lý các tương tác và sự kiện trong UICollectionView
extension UserViewController: UICollectionViewDelegate {
    
}

extension UserViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
                return CGSize(width: screenSize.width, height: 700)
    }
    
}
