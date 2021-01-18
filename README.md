# SocialSignInHelper
Helper file for Google and Facebook login iOS Swift.

Steps for google sign in

 - Add Pods  
   pod 'GoogleSignIn'
   Then import
   import GoogleSignIn

 - Get your clientID from  GoogleInfo.plist or developer console
	1) now add client id in app delegate did launch methods
             GIDSignIn.sharedInstance().clientID = ‘GOOGLE_CLIENT_ID’
	2)  then add client id in URL Scheme for call back url(reverse order)
              E.g 
              424186683852-daqf2lnctr9rf5fnr13d49en7hsi29d0.apps.googleusercontent.com

             Then add it like 
		> com.googleusercontent.apps.424186683852-daqf2lnctr9rf5fnr13d49en7hsi29d0


 - that’s it we are done with configuration
       - now add two file GoogleSignInHelper.swift & SocialSignInModel.swift

 - lets use it 

	//login
	```GoogleSignInHelper.shared.googleSignIn(with: self) { (model) in
            
    		print(model)
  	   }```

  //logout
	``` GoogleSignInHelper.shared.googleLogout() ```
  
  -----------------------------------------------------------------------------------------------
  
  Steps for Facebook sign in

 - Add Pods  
   pod 'FBSDKLoginKit'
   Then import
   import FBSDKLoginKit

 - Get your fbId from developer console
	- add fbID in URLScheme
        - add below code in info.plist
		<key>FacebookAppID</key>
		<string>fbid</string>
		<key>FacebookDisplayName</key>
		<string>AppName</string>
		<key>LSApplicationQueriesSchemes</key>
		<array>
			<string>fbapi</string>
			<string>fbauth2</string>
		</array>

 - that’s it we are done with configuration
       - now add two file FacebookSignInHelper.swift & SocialSignInModel.swift

 - lets use it 

	//login
	FacebookSignInHelper.shared.facebookSignIn(with: self) { (model) in
       
     print(model)
  }

  //logout
	FacebookSignInHelper.shared.facebookLogout()
	
# Author

Samir Shaikh samir.shaikh0620@gmail.com
