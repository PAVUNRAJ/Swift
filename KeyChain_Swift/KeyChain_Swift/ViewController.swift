//
//  ViewController.swift
//  KeyChain_Swift
//
//  Created by Tech on 28/07/21.
//

import UIKit
import KeychainSwift
class ViewController: UIViewController {
    @IBOutlet weak var userNameFxd: UITextField!
    
    @IBOutlet weak var passwordFxd: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    var keyChain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideNavigationBar()
        setupUI()
       let userName = keyChain.get("userName")
       userNameFxd.text = userName
       let password = keyChain.get("password")
       passwordFxd.text = password
    }
    @IBAction func submitBtn(_ sender: UIButton) {
        keyChain.set(userNameFxd.text ?? "",forKey:"userName")
        keyChain.set(passwordFxd.text ?? "",forKey:"password")
        let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessVC") as! SuccessVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI(){
        userNameFxd.layer.cornerRadius = 10
        passwordFxd.layer.cornerRadius = 10
        userNameFxd.placeholder = "Enter user name"
        passwordFxd.placeholder = "Enter password"
        userNameFxd.clipsToBounds = true
        passwordFxd.clipsToBounds = true
        submitBtn.clipsToBounds = true
        submitBtn.layer.cornerRadius = 10
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.tintColor = .black
    }

}
extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
