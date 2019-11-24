//
//  MainUserTableViewCell.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//


/**
 *
 * This class intend to connect customized table cell  UI components
 * - has 5 member data and three methods
 * #START of MainUserTableViewCell class
 *
 */

import UIKit
import Alamofire

class MainUserTableViewCell: UITableViewCell {
    
    /**
     *
     * #UI components of UITablViewCell
     *
    */
      @IBOutlet weak var userImageView: UIImageView!
      @IBOutlet weak var userNameLabel: UILabel!
      @IBOutlet weak var userEmailLabel: UILabel!
      @IBOutlet weak var lastUpdate: UILabel!
      @IBOutlet weak var userId: UILabel!
    
    
       /**
       *
       * #STRAT  of setUser() method
       *  -This method is for setting  the current users value for  UITableViewCell components
       *  - has one paramter array
       *        - user (User type) - it is current user details
       * - return type void (nothing)
       **/
    
    func setUser(user:User){
        userNameLabel.text=user.first_name+" "+user.last_name
        userEmailLabel.text=user.email
        userId.text="ID: " + String(user.id)
        setUserImage(imgUrlString: user.avatar_url)
        setUpdatedDate(dateInUTC:user.updated_at)
      }
    
    
       /**
        *
        *#END of setUser() mehtod
        *
        */
    
    
    /**
    *
    * #STRAT  of setUserImage() method
    *  -This method is for setting  the current user image loading from the server for each user (Table cell)
    * - here the third-parity library method used to fetch the image
    *  - has one paramter array
    *        - imgUrlString (String type) - it is url for the user's image
    * - return type void (nothing)
    **/

    func setUserImage(imgUrlString:String){
        self.userImageView.image=UIImage(systemName: "person.circle.fill")
        userImageView.layer.borderWidth=2.0
        userImageView.layer.cornerRadius=userImageView.frame.size.width/2
        userImageView.layer.borderColor=UIColor.gray.cgColor
        userImageView.contentMode = .scaleToFill
        
        AF.request(imgUrlString).responseData { response in
            guard let data = response.data, response.error == nil else { return }
            print(response.result)
            if let image=UIImage(data: data){
                self.userImageView.image=image
            }
                         
        }
    }

    /****
     *
     *
     *#END of setUserImage() method
     *
     */
    
    
    
    /**
       *
       * #STRAT  of setUpdatedDate() method
       *  -This method is for  customizing current user created date  and   setting  it into cell
       *  - has one paramter array
       *        - dateInUTC (String type) - it is date in host dateformate (UTC)
       * - return type void (nothing)
       **/
    
    func setUpdatedDate(dateInUTC:String) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = Utils.HOST_TIME_FORMAT


        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = Utils.CUSTOMIZED_TIME_FORMAT


        if let date = dateFormatterGet.date(from: dateInUTC) {
            lastUpdate.text="Upd.: "+dateFormatterPrint.string(from: date)
        } else {
           print("There was an error decoding the string")
        }
    }
    /**
    *
    *
    *#END of setUpdatedDate() method
    *
    */
}



/***
 *
 *#END of MainUserTableViewCell class
 *
 *
 **/
