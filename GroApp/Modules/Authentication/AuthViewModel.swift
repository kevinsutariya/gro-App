//
//  AuthViewModel.swift
//  GroApp
//
//  Created by Faisal Saleem on 03/10/2022.
//

import Foundation
import AuthenticationServices
import CryptoKit
import JGProgressHUD

protocol AuthDelegate {
    func didUserLogin(_ error: String?)
}

class AuthViewModel: NSObject {
    
    private var currentNonce: String?
    private var currentView: UIView?
    var delegate: AuthDelegate?
    
//    private func userAppleIdLogin(credential: OAuthCredential) {
//        self.serivce.userAppleIdLogin(credential: credential) { [weak self] error in
//            guard let self = self else {return}
//            if let error = error {
//                self.delegate?.didUserLogin(error.localizedDescription)
//            } else {
//                self.delegate?.didUserLogin(nil)
//            }
//        }
//    }
    
    func signInWithApple(with view: UIView?) {
        if let view = view {
            let hud = JGProgressHUD(style: .light)
            hud.dismiss(animated: true)
            self.currentView = view
            let nonce = randomNonceString()
            currentNonce = nonce
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            request.nonce = sha256(nonce)
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }
    
}

extension AuthViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    enum AppleFirebaseAuth: String {
        case apple = "apple.com"
        case error = "Error"
        case name  = "name"
        case email = "email"
        case users = "users"
        case randomString = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._"
    }
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("\(AppleFirebaseAuth.randomString.rawValue)")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.currentView!.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = self.currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else { return }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                self.delegate?.didUserLogin("\(AppleFirebaseAuth.error.rawValue)\n\(appleIDToken.debugDescription)")
                return
            }
            print(idTokenString)
            #warning("pass message")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.delegate?.didUserLogin(error.localizedDescription)
    }
}
