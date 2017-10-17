//
//  AuthorityChecking.swift
//  Wardrobe
//
//  Created by Matthealicorn on 2017-03-28.
//  Copyright © 2017 Time Capsule. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices

class Authorization {
    static func checkPhotos(andThen f: (() -> ())? = nil) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            f?()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    DispatchQueue.main.async {
                        f?()
                    }
                }
            })
        case .denied:
            break
        case .restricted:
            break
        }
    }
    
    static func checkMicrophoneCapture(andThen f: (() -> ())? = nil) {
        let mediaType = AVMediaTypeAudio
        let status = AVCaptureDevice.authorizationStatus(forMediaType: mediaType)
        
        switch status {
        case .authorized:
            f?()
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: mediaType, completionHandler: { (granted) in
                DispatchQueue.main.async {
                    f?()
                }
            })
        case .denied:
            let alert = UIAlertController(title: "Need Authorization", message: "Would you like this app to use microphone?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .cancel) { (action) in
                
            })
            alert.addAction(UIAlertAction(title: "Yes", style: .default) { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)!
                UIApplication.shared.open(url)
            })
            
            UIApplication.shared.delegate!.window!!.rootViewController!.present(alert, animated: true)
        case .restricted:
            break
        }
    }
    
    static func checkCameraCapture(andThen f: (() -> ())? = nil) {
        let mediaType = AVMediaTypeVideo
        let status = AVCaptureDevice.authorizationStatus(forMediaType: mediaType)
        
        switch status {
        case .authorized:
            f?()
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: mediaType, completionHandler: { (granted) in
                DispatchQueue.main.async {
                    f?()
                }
            })
        case .denied:
            let alert = UIAlertController(title: "Need Authorization", message: "Would you like this app to use camera?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .cancel) { (action) in
                
            })
            alert.addAction(UIAlertAction(title: "Yes", style: .default) { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)!
                UIApplication.shared.open(url)
            })
            
            UIApplication.shared.delegate!.window!!.rootViewController!.present(alert, animated: true)
        case .restricted:
            break
        }
    }
    
    static func checkMediaLibrary(andThen f: (() -> ())? = nil) {
        
    }

}
