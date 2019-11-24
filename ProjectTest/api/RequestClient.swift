//
//  RequestClient.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//


import Foundation
import  UIKit

/**
 *
 * This class intend to save temporarily and sort  the users loaded from the server
 * - has two member data and three methods
 * #START of RequestClient class
 *
 */


class RequestClient {
    
    /**
     *
     * #member data for holding the users and avoiding loading everytime from the server
     *
    */
    public var mUsers:[User]
    static let sharedInstance = RequestClient()
    
    
    /**
        *
     * # initializer for intilializing the member data #mUsers
        *
       */
    init() {
        mUsers=[User]()
    }
    
    
    /**
        *
        * #STRAT  of getUsers() method
        *  -This method is for getting current available users
        ** - return sarray of users
        *
        *
        **/
    func getUsers()->[User]{
        return mUsers
    }
    /**
       *
       * #END  of getUsers() method
       *
       **/
    
    
    
    /**
    *
    * #STRAT  of sortUsers() method
    *  -This method is for sorting  the current users by their creating date
    *  - has one paramter array
    *        - [user] (User type) - it is current users to be sorted
    * - return type void (nothing)
    **/
    func sortUsers(users:[User]){
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = Utils.HOST_TIME_FORMAT

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = Utils.HOST_TIME_FORMAT
        self.mUsers.removeAll()
        self.mUsers = users.sorted(by: { dateFormatterGet.date(from:$0.created_at)!.compare(dateFormatterGet.date(from:$1.created_at)!) == .orderedDescending })
        

    }
    
    
    /**
     *
     *#END of sortUsers() mehtod
     *
     */
    
}


/**
    *
    *#END of RequestClient class
    *
*/
