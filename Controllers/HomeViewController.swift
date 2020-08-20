//
//  homeViewContoller.swift
//  LoginWithFirebase
//
//  Created by 白数叡司 on 2020/08/16.
//  Copyright © 2020 AEG. All rights reserved.
//
import Foundation
import UIKit
import  FirebaseAuth

class HomeViewController: UIViewController {
    
    var user: User? {
        didSet {
            print("user?.name: ", user?.name)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func tappedLogoutButton(_ sender: Any) {
        handleLogout()
    }
    
    private func handleLogout() {
        do {
            try Auth.auth().signOut()
            presentToSignUpViewController()
        } catch (let err ) {
            print("ログアウトに失敗しました: \(err)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 10
        
        if let user = user {
        nameLabel.text = user.name + "さんようこそ"
        emailLabel.text = user.email
        let dateString = dateFormattarForCreatedAt(date: user.createdAt.dateValue())
        dateLabel.text = "作成日: " + dateString
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        confirmLoggedInUser()
    }
    
    private func  confirmLoggedInUser() {
        if Auth.auth().currentUser?.uid == nil || user == nil {
            presentToSignUpViewController()
        }
    }
    
    private func presentToSignUpViewController() {
        let storyBoard = UIStoryboard(name: "SignUp", bundle: nil)
        let ViewController = storyBoard.instantiateViewController(identifier:
            "ViewController") as! ViewController
        let navController = UINavigationController(rootViewController: ViewController)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    //日本時間に変更
    private func dateFormattarForCreatedAt(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: date)
    }
    
}
