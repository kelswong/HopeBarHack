//
//  SellVC.swift
//  Hope Heroes
//
//  Created by Kelsey Wong on 7/18/15.
//  Copyright (c) 2015 Kelsey Wong. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import AddressBook
import AddressBookUI

class SellVC: UIViewController, MFMailComposeViewControllerDelegate {
    private var referralLink:String = "bit.ly/oi8YZc45"
    
    @IBAction func copyLink(sender: AnyObject) {
        var pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.persistent = true
        pasteboard.string = "bit.ly/oi8YZc45"
    }

    @IBAction func sendEmailAction(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            var mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("Hope Bars: Feeding Children Around the World")
            mail.setMessageBody("I'm emailing you with an amazing new opportunity I found to help combat the issue of child hunger across the globe. EMSquared is sponsoring the production and distribution of Hope bar, which is THE standardized whole-food bar. Each one provides all the nutrients a child needs in one day. And for every one bar that someone purchases, EMSquared sends bars to two children in need. If you're interested in purchasing a bar or learning how you can help more, please check out <a href='http://google.com'>this website.</a> Thanks! <img src='http://i.imgur.com/NtquXKK.png?1' width=85%>", isHTML: true)
            self.presentViewController(mail, animated: true, completion: nil)
        }
        else {
            println("This device cannot send email")
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value {
        case MFMailComposeResultSent.value:
            println("You sent the email.")
        case MFMailComposeResultSaved.value:
            println("You saved a draft of this email.")
        case MFMailComposeResultCancelled.value:
            println("You cancelled sending this email.")
        case MFMailComposeResultFailed.value:
            println("Mail failed: An error occurred when trying to compose this email.")
        default:
            println("An error occurred when trying to compose this email.")
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

extension SellVC: ABPeoplePickerNavigationControllerDelegate {
    
    @IBAction func selectContacts(sender: AnyObject) {
        var ab = ABPeoplePickerNavigationController()
        ab.peoplePickerDelegate = self
        self.presentViewController(ab, animated: true, completion: nil)
    }
}

extension SellVC: MFMessageComposeViewControllerDelegate {
    
    @IBAction func sendTextAction(sender: AnyObject) {
        if MFMessageComposeViewController.canSendText() {
            var text = MFMessageComposeViewController()
            text.messageComposeDelegate = self
            text.body = String("Hi friend I want to share Hope bars with you plz help by buying a whole-food Hope bar and, in turn, giving two to malnourished children.")
            self.presentViewController(text, animated: true, completion: nil)
        }
        else {
            println("This device cannot send texts")
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        self.dismissViewControllerAnimated(true, completion: nil)
        switch result.value {
        case MessageComposeResultCancelled.value:
            println("Message cancelled")
        case MessageComposeResultSent.value:
            println("Message sent")
        default:
            println("Message failed")
        }
    }
    
}