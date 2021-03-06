//
//  GoogleSignInHelper.swift
//
//  Created by samir on 01/10/19.
//  Copyright © 2019 samir. All rights reserved.
//

import UIKit

class GoogleSignInHelper: NSObject{
    
    //MARK: Variables
    static let shared = GoogleSignInHelper()
    private var completion : ((SocialSignInModel?) -> ())?
    private var model : SocialSignInModel?
    private var presentationController : UIViewController?
    
    func googleSignIn(with view: UIViewController,completion : @escaping (SocialSignInModel?) -> ()){
        
        self.presentationController = view
        self.completion = completion
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func googleLogout(){
        
        GIDSignIn.sharedInstance()?.signOut()
    }
    
    
}

extension GoogleSignInHelper : GIDSignInDelegate, GIDSignInUIDelegate{
    
    // Present a view that prompts the user  to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        
        self.presentationController?.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        
        self.presentationController?.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            
            print("\(error.localizedDescription)")
            self.completion?(nil)
        }
        
        if let user = user{
            let model = SocialSignInModel()
            model.id = user.userID
            model.name = user.profile.name
            model.firstName = user.profile.givenName
            model.email = user.profile.email
            
            self.completion?(model)
        }
        self.presentationController?.dismiss(animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
