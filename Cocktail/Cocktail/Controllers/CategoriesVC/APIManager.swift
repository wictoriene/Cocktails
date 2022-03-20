//
//  APIManager.swift
//  Cocktail
//
//  Created by wictoriene on 2.03.22.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase


class ApiManager {

    static let shared = ApiManager()

    private func configureFB() -> Firestore {
            var db: Firestore!
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
            db = Firestore.firestore()
            return db
    }

    func getrealmTime(completion: @escaping(DataSnapshot?) -> Void) {
            var ref: DatabaseReference!
            ref = Database.database().reference()

            ref.getData(completion:  { error, realmInfo in
                guard error == nil else { completion(nil); return}
                completion(realmInfo)
//                print(realmInfo)

              })

        }


}


