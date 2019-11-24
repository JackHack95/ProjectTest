//
//  Utils.swift
//  ProjectTest
//
//  Created by Ikromjon Mamatov on 11/23/19.
//  Copyright © 2019 Ikromjon Mamatov. All rights reserved.
//

/**
*
* This Utils class  is holding all the static constant data that are used globally in the app.
* #Utils of User class
*
*/


import Foundation
class Utils {
    static let FONT_NAME="Montserrat-Light"
    static let MAIN_TITLE = "Main"
    static let MENU_TITLE = "Main"
    static let EDIT_USERS_TITLE = "Edit users"
    static let ADD_USERS_TITLE = "Add user"
    static let ADD_USERS = "Add"
    static let SAVE_USERS = "Save"
    static let USER_CELL_ID = "userCell"
    static let API_URL="https://frogogo-test.herokuapp.com"
    static let API_USERS_URL=API_URL+"/users.json"
    static let API_EDIT_USER_URL=API_URL+"/users/"
    static let HOST_TIME_FORMAT="yyyy-MM-dd HH:mm:ss 'UTC'"
    static let CUSTOMIZED_TIME_FORMAT="MMM dd,yyyy"
    
    static let FIRST_NAME_BTN_TAG=0
    static let LAST_NAME_BTN_TAG=1
    static let EMAIL_BTN_TAG=2
    static let AVATAR_URL_BTN_TAG=3
    
    //story board ids
    static let MAIN_VIEW_CONTROLLER="MainViewController"
    static let MAIN_STORY_BOARD="Main"
    static let EDIT_USERS_VIEW_CONTROLLER="EditUserViewController"
    static let ADD_USER_VIEW_CONTROLLER="AddUserViewController"
    
    //system icons name
    static let PENCIL_CIRCLE="pencil.circle"
    static let CHEVRON_UP_CIRCLE="chevron.up.circle"
    static let PERSON_CROP_CIRCLE="person.crop.circle"
    
}


/**
* #END of Utils class
*
*/
