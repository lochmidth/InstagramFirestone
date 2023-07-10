//
//  ImageUploader.swift
//  InstagramFirestone
//
//  Created by Alphan Ogün on 6.07.2023.
//

import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {

        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image, \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
