//
//  ProfileVC.swift
//  Hope Heroes
//
//  Created by Kelsey Wong on 7/18/15.
//  Copyright (c) 2015 Kelsey Wong. All rights reserved.
//

import Foundation
import UIKit

class ProfileVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var sellCount:Int = 345
    @IBOutlet weak var countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    
    let imagePicker = UIImagePickerController()
    @IBAction func editPicture(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.contentMode = .ScaleAspectFit
            profileImage.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expDate: UITextField!
    
    @IBAction func editPayment(sender: AnyObject) {
        if let a = cardNumber.text.toInt() {
            cardNumber.placeholder = cardNumber.text
        }
        else if cardNumber.text != "" { println("Invalid credit card number") }
        if let b = Array(String(expDate.text)) as? [Character] {
            if !(b.count == 7) { expDate.text = "" }
            else if b[2] != "/" { expDate.text = "" }
            else {
                var d = String([b[0],b[1],b[3],b[4],b[5],b[6]])
                if let e = d.toInt() { expDate.placeholder = expDate.text }
            }
        }
        cardNumber.text = ""
        expDate.text = ""
    }
}