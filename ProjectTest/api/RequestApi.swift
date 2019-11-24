//
//  RequestApi.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//

/**
 *
 * This class intend to send requests for server to GET, EDIT, CREATE users
 *  -has two typealies memer data and foru methods 
 *  Here the Alamofire thir-party library is used to send request
 *
 *
 */

import Foundation
import Alamofire
class RequestApi {
    
    /**
     *
     * These are typealies  used for responce complition status
     *
     **/
    typealias WebServiceResponce = ([[String:Any]]?,Error?)->Void
    typealias WebServiceResponceForPost = ([String:Any]?,Error?)->Void
    
    
    /**
     *
     * #STRAT  of getUsers() method
     *  -This method is for getting users from the given host address
     *  - has two paramters
     *        - url (String type) - it is the host address to get users
     *        -WebServiceResponce - typealias is to show the responce compilition
     * - return type void (nothing)
     *
     **/
    
     public func getUsersRequest(url:String, completion:@escaping WebServiceResponce){
        AF.request(url).validate().responseJSON { responce in
            print("Result",responce.result)
            
            if let error=responce.error{
                completion(nil,error)
            }else{
                completion((responce.value as! [[String:Any]]),nil)
            }
            
            
            
        }
        
    }
    
    /**
    *
    * #END  of getUsers() method
    *
    **/
    
    /**
    *
    * #STRAT  of editCurrentUser() method
    *  -This method is for updating the current users in  the given host address
    *  - has two paramters
    *        - user (User type) - it is current user details to be changed
    *        -WebServiceResponceForPost - typealias is to show the responce compilition
    * - return type void (nothing)
    **/
    
       public func editCurrentUser(user:User, completion:@escaping WebServiceResponceForPost){
           let param = setUserJson(user:user)
        AF.request(Utils.API_EDIT_USER_URL+String(user.id)+".json", method: .patch, parameters: param, encoding:JSONEncoding.default, headers: [:], interceptor: nil).responseJSON { (responce) in
               print("REQUEST_PATCH",responce.request as Any) // original url request
               if let error=responce.error{
                  completion(nil,error)
              }else{
                  completion((responce.value as! [String:Any]),nil)
              }
              
           }
           
           
           
           
       }
    
    /**
    *
    * #END  of editCurrentUser() method
    *
    **/
    
    
    /**
    *
    * #STRAT  of addNewUser() method
    *  -This method is for create user from  user details and added to the the given host address
    *  - has two paramters
    *        - user (User type) - it is current user details to be added to server
    *        -WebServiceResponceForPost - typealias is to show the responce compilition
    * - return type void (nothing)
    **/
    public func addNewUser(user:User, completion:@escaping WebServiceResponceForPost){
        let param = setUserJson(user:user)
        AF.request(Utils.API_USERS_URL, method: .post, parameters: param, encoding:JSONEncoding.default, headers: [:], interceptor: nil).responseJSON { (responce) in
            print("REQUEST_POST",responce.request as Any) // original url request
            if let error=responce.error{
               completion(nil,error)
           }else{
               completion((responce.value as! [String:Any]),nil)
           }
           
        }
        
        
        
        
    }
    /**
     *
     * #END  of addNewUser() method
     *
     **/
    
    
    
    
    
      /**
      *
      * #STRAT  of setUserJson() method
      *  -This method is used to set user  param as json format
      *  - has one paramter
      *        - user (User type) - it is current user details to be added or updated to server
      * - return type is [String:Any] dictionary
      */
    
    
    
    private func setUserJson(user:User)->[String:Any]{
        let userJson=[
            "user":[
                "first_name":user.first_name,
                "last_name":user.last_name,
                "email":user.email,
                "avatar_url":user.avatar_url
                ]
        ] as [String:Any]
        return userJson
    }
    
    /**
       *
       * #END  of setUserJson() method
       *
       **/
    
        
}

/**
*
* #END  of RequestApi class
*
**/
