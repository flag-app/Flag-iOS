//
//  RealmService.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/08/22.
//

import Foundation

import RealmSwift

final class RealmService {
    
    private let realm: Realm
    
    init() {
        do {
            realm = try Realm()
            print("Realm Location: ", realm.configuration.fileURL ?? "cannot find location.")
        } catch {
            fatalError("Failed to initialize local Realm: \(error)")
        }
    }
    
    func setAccessToken(accessToken: String) {
        do {
            if let object = realm.objects(AccessTokenDTO.self).first {
                try realm.write {
                    object.accessToken = accessToken
                }
            } else {
                let firstAccessToken = AccessTokenDTO(input: accessToken)
                try realm.write {
                    realm.add(firstAccessToken)
                }
            }
        }
        catch {
            print("Failed to set access token: \(error)")
        }
    }
    
    func getAccessToken() -> String {
        guard let object = realm.objects(AccessTokenDTO.self).first else {
            return ""
        }
        guard let accessToken = object.accessToken else {
            return ""
        }
        return accessToken
    }
    
    func setAutoSignIn(isSignedIn: Bool) {
        do {
            if let object = realm.objects(AutoSignInDTO.self).first {
                try realm.write {
                    object.isSignedIn = isSignedIn
                }
            } else {
                let firstAutoSignIn = AutoSignInDTO(input: true)
                try realm.write {
                    realm.add(firstAutoSignIn)
                }
            }
        }
        catch {
            print("Failed to set auto sign-in status: \(error)")
        }
    }
    
    func checkIsUserSignedIn() -> Bool {
        guard let object = realm.objects(AutoSignInDTO.self).first else {
            return false
        }
        guard let isSignedIn = object.isSignedIn else {
            return false
        }
        return isSignedIn
    }
    
    // MARK: - delete all Data
        
    func deleteAllRealmData() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            // Handle the error gracefully
            print("Failed to delete all Realm data: \(error)")
        }
    }
}
