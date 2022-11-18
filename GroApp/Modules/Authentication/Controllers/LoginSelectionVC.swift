//
//  LoginSelectionVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 22/09/2022.
//

import UIKit
import GoogleSignIn
import TwitterKit//import FacebookCore
//import FacebookLogin
import SSTwitterLogin
import SCSDKLoginKit
enum LoginThirdParty: Int {
    case facebook   = 0
    case google     = 1
    case instagram  = 2
    case snapchat   = 3
    case twitter    = 4
    case apple      = 5
}

enum SocialLogin {
    static let googleClientId = "78134633182-l2ias9lafaeakd96idqm654odmlafgvm.apps.googleusercontent.com"
    static let fbPermissions = ["email","public_profile"]
}

class LoginSelectionVC: UIViewController {


    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var createAccountView: UIView!
    
    private lazy var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ReferelVC.initFromStoryboard(.Referral) as! ReferelVC
        vc.modalPresentationStyle = .custom
        vc.didTabCreate = { [weak self] status in
            guard let self = self else {return}
            let vc = SuccessVC.initFromStoryboard(.Referral)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.present(vc, animated: true)
        
//        if let token = AccessToken.current,
//                !token.isExpired {
//               print(token)
//            }
        
        self.createAccountView.addTapGesture { [weak self] in
            guard let self = self else {return}
            let vc = SignUpVC.initFromStoryboard(.Authentication)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTabLogin(_ sender: UIButton) {
        let vc = SignInVC.initFromStoryboard(.Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    let failureBlock = { (error: Error?, success: Bool) in
                if let error = error {
                    print(String.init(format: "Failed to fetch user data. Details: %@", error.localizedDescription))
                }
            }
    @IBAction func didTabThirdPartyLogin(_ sender: UIButton) {
        switch LoginThirdParty(rawValue: sender.tag) {
        case .facebook: break
//                let loginManager : LoginManager = LoginManager()
//                loginManager.logOut()
//                loginManager.logIn(permissions: SocialLogin.fbPermissions, from: self) { [weak self] (result, error) in
//                    guard let self else {return}
//                    if let result {
//                        if result.isCancelled {
//                            Util.showAlert(caller: self, title: "Alert!", message: "Facebook login cancelled")
//                        } else {
//                            print(result.token?.tokenString ?? "")
//                            UIPasteboard.general.string = (result.token?.tokenString ?? "")
//
//                        }
//                    }
            
            //    }
                
            case .google:
                let config = GIDConfiguration(clientID: SocialLogin.googleClientId)
                GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
                    if let error = error {
                        Util.showAlert(caller: self, title: "Error", message: error.localizedDescription)
                    } else {
                        guard let authentication = user?.authentication,
                              let idToken = authentication.idToken else { return }
                        print(idToken)
                        UIPasteboard.general.string = idToken
                        
                    }
                }
            case .instagram:
                print("hell0")
            case .snapchat:
                
            SCSDKLoginClient.login(from: self) { (success : Bool, error : Error?) in
                if let error = error {
                    Util.showAlert(caller: self, title: "Error", message: error.localizedDescription)
                    return
                }
                if success {
                    let authentication = SCSDKLoginClient.getAccessToken()
                        UIPasteboard.general.string = authentication
                        print(authentication)
                    }
            }
          
            
            
            case .twitter:
            
            TWTRTwitter.sharedInstance().logIn { (session, error) in
                if (session != nil) {
                 //   self.lastUser = session?.userID
                 //   completion(true, nil)
                } else {
                 //   print("error: \(error?.localizedDescription ?? "")")
                 //   completion(false, error)
                }
            }
                print("hell0")
            case .apple:
                self.viewModel.signInWithApple(with: self.view)
            default:
                print("hello")
        }
    }
   
}



//extension LoginSelectionVC: LoginButtonDelegate {
//    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
//        guard let token = result?.token?.tokenString else {return}
//        print(token)
//    }
//
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
//        print("logout")
//    }
//}
