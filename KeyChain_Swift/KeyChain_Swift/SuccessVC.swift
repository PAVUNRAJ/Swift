//
//  SuccessVC.swift
//  KeychainSwift
//
//  Created by Tech on 28/07/21.
//

import UIKit
import KeychainSwift
class SuccessVC: UIViewController {
    @IBOutlet weak var successLbl: UILabel!
    @IBOutlet weak var RemoveLbl: UILabel!
    var keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeAction(_:)))
        RemoveLbl.addGestureRecognizer(tap)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupUI(){
        successLbl.text = "Success!!"
        successLbl.textAlignment =  .center
        successLbl.textColor = .green
        RemoveLbl.text = "Remove the User Details?"
        RemoveLbl.textColor = .red
        RemoveLbl.textAlignment = .center
        RemoveLbl.isUserInteractionEnabled = true
       
    }

    
    @objc func removeAction(_ sender: UITapGestureRecognizer? = nil){
          alert(" Do you want remove the details?", view: self)
    }
    
    
    func alert(_ message: String, view:UIViewController) {
       
            let attributedString = NSAttributedString(string:"Alert", attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor : UIColor.black
                ])
            let alert = UIAlertController(title:attributedString.string, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction (title:"OK", style: .default, handler:{ action in
                
                switch action.style{
                
                case .default:
                    self.keychain.clear()
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                default:
                    break
                }
            
        })
           
     
            alert.addAction(okAction)
        
            view.present(alert, animated: true) {
            }
        
    }

}
