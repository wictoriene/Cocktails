//
//  StorageManager.swift
//  Cocktail
//
//  Created by wictoriene on 12.06.22.
//

import SwiftUI
import Firebase

public class StorageManager: ObservableObject {
    let storage = Storage.storage()

    func upload(image: UIImage) {
        let storageRef = storage.reference().child("coctails/")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
    }
}
