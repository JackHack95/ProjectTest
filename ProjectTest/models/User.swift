//
//  User.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//

/**
*
* This class  is model class for server responce in json format
* - has 8 member data (from the server responce in json format) and two initializers
* #START of User class
*
*/



import Foundation

class User{
    
    
    /**
     *
     * #Member data of User
     *
    */
    var id:Int;
    var first_name:String
    var last_name:String
    var email:String
    var avatar_url:String
    var created_at:String
    var updated_at:String
    var url:String
    
    
    /**
     *
     * #FIRST initiaalizer
     *
    */
    
    init(fromDictionary currentUser: [String:Any]) {
        self.id=currentUser["id"] as! Int
        self.first_name=currentUser["first_name"] as! String
        self.last_name=currentUser["last_name"] as! String
        self.email=currentUser["email"] as! String
        self.avatar_url=currentUser["avatar_url"] as? String ?? ""
        self.created_at=currentUser["created_at"] as! String
        self.updated_at=currentUser["updated_at"] as! String
        self.url=currentUser["url"] as! String
    
   }
    
    
   /*
     *
     *#SECOND initializer
     *
     */
    
    
    init() {
        self.id = -1
        self.first_name=""
        self.last_name=""
        self.email=""
        self.avatar_url=""
        self.created_at=""
        self.updated_at=""
        self.url=""
    }
}

/*
    *
    *#END of User class
    *
    */
   
