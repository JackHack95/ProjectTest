//
//  EditUserViewController.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//


/**
 *--This UIViewController class is representing the Edit User UI compenents and
 *doing actions on them
 *--This class uses mainly swift native UI tool Kit
 *--The class has bunch UI components and methds
 *
 *#Start of EditUserViewController
 */


import UIKit
class EditUserViewController: UIViewController {

    /**
    *
    * #Member data  and ui components
    *
   */
    @IBOutlet weak var url: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var urlBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var lastNameBtn: UIButton!
    @IBOutlet weak var firstNameBtn: UIButton!
    
    @IBOutlet weak var firstNameTx: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var urlTf: UITextField!
    
    @IBOutlet weak var mIndicator: UIActivityIndicatorView!
    
    var index:Int!
    var users:[User]=[User]()
    
    
    /**
     *
     * #Default viewDidLoad() method overrided from super class
     *
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mIndicator.hidesWhenStopped=true
        setNavItems()
        setButtons()
        setTextFields()
    }
    
    /**
        *
        * #Default viewWillAppear() method overrided from super class
        *
       */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if users.isEmpty {
            return
        }
        
        let user=users[index]
        firstName.text=user.first_name
        lastName.text=user.last_name
        email.text=user.email
        url.text=user.avatar_url
    }
    
    
    
    /**
     *
     *
     *#Start of setTextFields()
     *  -This method  used to set UITextField some features
     *  - the method does not have any params and returns nothing (void)
     **/
    
    func setTextFields() {
        firstNameTx.layer.borderWidth=1.0
        firstNameTx.layer.borderColor = UIColor.gray.cgColor
        firstNameTx.layer.cornerRadius=10.0
        
        lastNameTf.layer.borderWidth=1.0
        lastNameTf.layer.borderColor = UIColor.gray.cgColor
        lastNameTf.layer.cornerRadius=10.0
        
        emailTf.layer.borderWidth=1.0
        emailTf.layer.borderColor = UIColor.gray.cgColor
        emailTf.layer.cornerRadius=10.0
        
        urlTf.layer.borderWidth=1.0
        urlTf.layer.borderColor = UIColor.gray.cgColor
        urlTf.layer.cornerRadius=10.0
    }
    /**
     *
     *#END of setTextFields() method
     *
     */
    
    
    /**
    *
    *
    *#Start of setButtons()
    *  -This method  used to set UIButtons some features
    *  - the method does not have any params and returns nothing (void)
    **/
    func setButtons() {
        firstNameBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for:.normal)
        lastNameBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for:.normal)
        emailBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for:.normal)
        urlBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for:.normal)
    }
    
    /**
     *
     *#END of setButtons() method
     *
     */
    
    
    /**
    *
    *
    *#Start of BtnActions()
    *  -This method  used to handle  UIButtons' actions
    *  - the method has one param UIButton type
    * - and returns nothing (void)
    **/
    
    @IBAction func BtnActions(_ sender: UIButton) {
        switch sender.tag {
        case Utils.FIRST_NAME_BTN_TAG:
            if sender.isSelected {
                firstNameTx.isHidden=true
                firstNameBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for: .normal)
                firstName.text=firstNameTx.text
                firstName.isHidden=false
                firstNameBtn.isSelected=false
            }else{
                firstNameTx.isHidden=false
                firstNameTx.text=firstName.text
                firstNameBtn.setImage(UIImage(systemName: Utils.CHEVRON_UP_CIRCLE), for: .selected)
                firstName.isHidden=true
                firstNameBtn.isSelected=true
            }
            break
        case Utils.LAST_NAME_BTN_TAG:
            if sender.isSelected {
                lastNameTf.isHidden=true
                lastNameBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for: .normal)
                lastName.text=lastNameTf.text
                lastName.isHidden=false
                lastNameBtn.isSelected=false
            }else{
                lastNameTf.isHidden=false
                lastNameTf.text=lastName.text
                lastNameBtn.setImage(UIImage(systemName: Utils.CHEVRON_UP_CIRCLE), for: .selected)
                lastName.isHidden=true
                lastNameBtn.isSelected=true
            }
            break
        case Utils.EMAIL_BTN_TAG:
            if sender.isSelected {
                emailTf.isHidden=true
                emailBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for: .normal)
                email.text=emailTf.text
                email.isHidden=false
                emailBtn.isSelected=false
            }else{
                emailTf.isHidden=false
                emailTf.text=email.text
                emailBtn.setImage(UIImage(systemName: Utils.CHEVRON_UP_CIRCLE), for: .selected)
                email.isHidden=true
                emailBtn.isSelected=true
            }
             break
        case Utils.AVATAR_URL_BTN_TAG:
            if sender.isSelected {
                urlTf.isHidden=true
                urlBtn.setImage(UIImage(systemName: Utils.PENCIL_CIRCLE), for: .normal)
                url.text=urlTf.text
                url.isHidden=false
                urlBtn.isSelected=false
            }else{
                urlTf.isHidden=false
                urlTf.text=url.text
                urlBtn.setImage(UIImage(systemName: Utils.CHEVRON_UP_CIRCLE), for: .selected)
                url.isHidden=true
                urlBtn.isSelected=true
            }
            break
        default:
            break
        }
    }
    
    /**
    *
    *#END of BtnActions() method
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
        let right=UIBarButtonItem.init(title: Utils.SAVE_USERS, style: .done, target: self, action: #selector(self.action(sender:)))
          self.navigationItem.rightBarButtonItem = right
      }
      
    /**
      *
      *#END of setNavItems() method
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
            user.id=users[index].id
            user.first_name=firstName.text!
            user.last_name=lastName.text!
            user.email=email.text!
            user.avatar_url=url.text!
            RequestApi().editCurrentUser(user: user) { (responce, error) in
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
   *#END  of EditUserViewController 
   *
   */
