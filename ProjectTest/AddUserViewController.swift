//
//  AddUserViewController.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//

/**
*--This UIViewController class is representing the Add User UI compenents and
*doing actions on them
*--This class uses mainly swift native UI tool Kit
*--The class has bunch UI components and methds
*
*#Start of EditUserViewController
*/


import UIKit

class AddUserViewController: UIViewController {
    /**
       *
       * #UI components
       *
      */
    @IBOutlet weak var mIndicator: UIActivityIndicatorView!
    @IBOutlet weak var avatarUrl: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    /**
     *
     * #Default viewDidLoad() method overrided from super class
     *
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavItems()
        setTextFields()
        mIndicator.hidesWhenStopped=true
    }
    
    
    /**
     *
     *
     *#Start of setTextFields()
     *  -This method  used to set UITextField some features
     *  - the method does not have any params and returns nothing (void)
     **/
    func setTextFields() {
        firstName.layer.borderWidth=1.0
        firstName.layer.borderColor = UIColor.gray.cgColor
        firstName.layer.cornerRadius=10.0
        
        lastName.layer.borderWidth=1.0
        lastName.layer.borderColor = UIColor.gray.cgColor
        lastName.layer.cornerRadius=10.0
        
        email.layer.borderWidth=1.0
        email.layer.borderColor = UIColor.gray.cgColor
        email.layer.cornerRadius=10.0
        
        avatarUrl.layer.borderWidth=1.0
        avatarUrl.layer.borderColor = UIColor.gray.cgColor
        avatarUrl.layer.cornerRadius=10.0
    }
    /**
    *
    *#END of setTextFields() method
    *
    */
    
    
   /**
  *
  *
  *#Start of setNavItems()
  *  -This method  used to set custom navigation bar item
  *  - the method does not have parameter
  * - and returns nothing (void)
  **/
    func setNavItems(){
        let right=UIBarButtonItem.init(title: Utils.ADD_USERS, style: .done, target: self, action: #selector(self.action(sender:)))
        self.navigationItem.rightBarButtonItem = right
    }
    
  /**
    *
    *#END of BtnActions() method
    *
    */
    
    
    /**
       *
       *
       *#Start of action()
       *  -This method  used to handle  navigation items  actions
       *  - the method has one param Any type
       * - and returns nothing (void)
       **/
      
        
    @objc func action(sender:Any){
        mIndicator.startAnimating()
        let user=User()
        user.first_name=firstName.text!
        user.last_name=lastName.text!
        user.email=email.text!
        user.avatar_url=avatarUrl.text!
        RequestApi().addNewUser(user: user) { (responce, error) in
            self.mIndicator.stopAnimating()
            if let errors = error{
                self.showToast(message: errors.localizedDescription)
            }else{
                self.gotoMain()
            }
        }
            
    }
    /**
    *
    *#END of action() method
    *
    */
    
    
    
    /**
    *
    *
    *#Start of gotoMain()
    *  -This method  used to lead user  to main controller
    *  - the method doesnt have parameter
    * - and returns nothing (void)
    **/
    func gotoMain() {
        print("Working")
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: Utils.MAIN_STORY_BOARD, bundle: nil)
        let SVC = mainStoryBoard.instantiateViewController(withIdentifier:Utils.MAIN_VIEW_CONTROLLER) as!MainViewController
        self.navigationController?.pushViewController(SVC, animated: true)
    }
    /**
     *
     *#END of gotoMain() method
     *
     */

}


/**
   *
   *#END  of AddUserViewController
   *
   */


