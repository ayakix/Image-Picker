//
//  ViewController.swift
//  Image-Picker
//
//  Created by r_ayaki on 2017/03/23.
//  Copyright © 2017年 ayakix. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    @IBOutlet fileprivate weak var openImagePickerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch (status) {
        case PHAuthorizationStatus.notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) -> Void in
                if status == PHAuthorizationStatus.authorized {
                    self.openImagePickerButton.isEnabled = true
                }
            }
        case PHAuthorizationStatus.authorized:
            openImagePickerButton.isEnabled = true
        case PHAuthorizationStatus.restricted, PHAuthorizationStatus.denied:
            break
        }
    }
}

