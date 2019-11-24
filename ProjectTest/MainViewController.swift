//
//  MainViewController.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 23/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//



/**
*--This UIViewController class is representing the Add User UI compenents and
*doing actions on them
*--This class uses mainly swift native UI tool Kit and JJFloatingActionButton third parity library
*--The class has bunch UI components and methds
*
*#Start of MainViewController
*/


import UIKit
import  JJFloatingActionButton
class MainViewController: UIViewController {
    
    /**
       *
       * #Member data  and ui components
       *
      */
    @IBOutlet weak var mIndicator: UIActivityIndicatorView!
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var refreshControl = UIRefreshControl()
    private let requestApi:RequestApi=RequestApi()
    private var requestClient:RequestClient!
    private var btn = UIButton(type: .custom)
    private var users:[User]=[User]()
    
    /**
        *
        * #Default viewDidLoad() method overrided from super class
        *
       */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mIndicator.hidesWhenStopped=true
        mIndicator.startAnimating()
        requestClient=RequestClient.sharedInstance
        self.title=Utils.MAIN_TITLE
        usersTableView.delegate=self
        usersTableView.dataSource=self
        searchBar.delegate=self
        setNavItems()
        setRefreshController()
        floatingButton()
        update()
    }
    /**
      *
      * #Default viewWillAppear() method overrided from super class
      *
     */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    /**
    *
    *
    *#Start of floatingButton()
    *  -This method  uses third  parity library feature to show the floating point button
    *  - the method does not have any params and returns nothing (void)
    **/
    
    func floatingButton(){
       let actionButton = JJFloatingActionButton()
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        actionButton.buttonColor = .systemBlue
    }
    /**
    *
    *#END of floatingButton() method
    *
    */
    
    
    
    /**
      *
      *
      *#Start of buttonTapped()
      *  -This method  used to hanlde the action of the FAB and lead user to AddUserViewController
      *  - the method does not have any params and returns nothing (void)
      **/
    @objc func buttonTapped(){
        let storyboard = UIStoryboard(name: Utils.MAIN_STORY_BOARD, bundle: nil)
        let abcViewController = storyboard.instantiateViewController(withIdentifier: Utils.ADD_USER_VIEW_CONTROLLER)
            as! AddUserViewController
        abcViewController.title=Utils.ADD_USERS_TITLE
        navigationController?.pushViewController(abcViewController, animated: true)
    }
    /**
     *
     *#END of floatingButton() method
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
        let right=UIBarButtonItem.init(title: "", style: .done, target: self, action: #selector(self.action(sender:)))
        right.image=UIImage(systemName: Utils.PERSON_CROP_CIRCLE)
        self.navigationItem.rightBarButtonItem = right
        
        let left=UIBarButtonItem.init(title: Utils.MENU_TITLE, style: .done, target: self, action: #selector(self.action(sender:)))
        self.navigationItem.leftBarButtonItem = left
        
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
    *  -This method  used to hanlde the action nav items but so far nothing will be done
    *  - the method does not have any params and returns nothing (void)
    **/
    
    @objc func action(sender:Any){
        
    }
    /**
     *
     *#END of action() method
     *
     */
    
    
    
    
    /**
   *
   *
   *#Start of setRefreshController()
   *  -This method  tend to set features and adding target for refresh controller
   *  - the method does not have any params and returns nothing (void)
   **/
    func setRefreshController() {
        refreshControl.attributedTitle = NSAttributedString(string:"Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        usersTableView.addSubview(refreshControl)
    }
    
    /**
    *
    *#END of action() method
    *
    */
    
    
    
    
    /**
      *
      *
      *#Start of refresh()
      *  -This method update all current users
      *  - the method does not have any params and returns nothing (void)
      **/
    
    @objc func refresh(){
        update()
    }
    /**
    *
    *#END of action() method
    *
    */
    
    
    
    
    /**
     *
     *
     *#Start of update()
     *  -This method send request to get users from the server and
     *  store them into array trigger the users tableview to show all users
     *  - the method does not have any params and returns nothing (void)
     **/
   func update() {
    requestApi.getUsersRequest(url: Utils.API_USERS_URL) { (json, error) in
        self.mIndicator.stopAnimating()
        self.refreshControl.endRefreshing()
        
        if let errors = error{
              self.showToast(message: errors.localizedDescription)
          }else{
            if !self.users.isEmpty || !self.requestClient.mUsers.isEmpty {
                self.users.removeAll()
                self.requestClient.mUsers.removeAll()
            }
              let array=json!
              for  i in 0..<array.count{
                  let user=User(fromDictionary: array[i])
                self.requestClient.mUsers.append(user)
                  //print("Users:", self.users)
              }
            self.requestClient.sortUsers(users: self.requestClient.mUsers)
            self.users=self.requestClient.getUsers()
          }
        self.usersTableView.reloadData()
        }
    
    }
    /**
    *
    *#END of action() method
    *
    */
    

    
    
}

/**
*
*#END of MainViewController
*
*/



/**
 *
 *Extension for MainViewControllerfor additional features
 * - like implementing tableview and searchbar delegate and datasource function
 *
 *#Start of MainViewController
*/



extension MainViewController:UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate{
    /**
    *
    *
    *#Start of numberOfRowsInSection table view method
    *  -This method set the size of the table view rows
    *  - the method two params and returns  numberOfRowsInSection (Int)
    **/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    /**
    *
    *#END of numberOfRowsInSection
    *
    */
    
    
    
       
    /**
    *
    *
    *#Start of cellForRowAt table view method
    *  -This method return the cell itself after customization
    *  - the method two params and returns  cellForRowAt (UITableViewCell type)
    **/
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell=tableView.dequeueReusableCell(withIdentifier: Utils.USER_CELL_ID, for: indexPath) as! MainUserTableViewCell
        let user=self.users[indexPath.row]
        cell.setUser(user: user)
        return cell
   }
    
    /**
   *
   *#END of cellForRowAt
   *
   */

    
    
    /**
       *
       *
       *#Start of heightForRowAt table view method
       *  -This method returns row hieght
       *  - the method two params and returns  heightForRowAt (CGFloat type)
       **/
          
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    /**
     *
     *#END of heightForRowAt table view method
     *
     */
    
    
    
    
    /**
      *
      *
      *#Start of didSelectRowAt table view method
      *  -This method used to handle slected row action
      *  - the method two params and returns  nothing
      **/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: Utils.MAIN_STORY_BOARD, bundle: nil)
        let abcViewController = storyboard.instantiateViewController(withIdentifier: Utils.EDIT_USERS_VIEW_CONTROLLER) as! EditUserViewController
        abcViewController.title=Utils.EDIT_USERS_TITLE
        abcViewController.index=indexPath.row
        abcViewController.users=self.users
        navigationController?.pushViewController(abcViewController, animated: true)
    }
    /**
    *
    *#END of didSelectRowAt table view method
    *
    */
    
    
    
    
    /**
     *
     *
     *#Start of forRowAt l table view method
     *  -This method set seperatior between the table view rows
     *  - the method three params and returns  nothing
     **/
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let additionalSeparatorThickness = CGFloat(0.5)
        let additionalSeparator = UIView(frame: CGRect(x: 5,
                                                       y: cell.frame.size.height - additionalSeparatorThickness,
                                                       width: cell.frame.size.width-10,
                                                       height: additionalSeparatorThickness))
        additionalSeparator.backgroundColor = UIColor.gray
        cell.addSubview(additionalSeparator)
    }
    /**
   *
   *#END of forRowAt l table view method
   *
   */
    
    
    
    
    
    /**
        *
        *
        *#Start of textDidChange searchBar method
        *  -this method for checking the entered text on searchbar
        *  - the method two params and returns  nothing
        **/
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.users=requestClient.getUsers().filter({ (user) -> Bool in
            if searchBar.text!.isEmpty{
                usersTableView.reloadData()
                return true
            }
            guard searchBar.text != nil else{return false}
            return user.first_name.contains(String(searchBar.text!)) || user.last_name.contains(String(searchBar.text!))
        })
        
        self.usersTableView.reloadData()
    }
    /**
      *
      *#END of textDidChange searchText search bar
      *
      */
    
}


/**
*
*#END of MainViewController
*
*/



