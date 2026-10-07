//
//  SenderViewController.swift
//  Task1SwiftNotificationCenter
//
//  Created by Erik Valencia Cardona on 7/10/26.
//
import UIKit

final class SenderViewController: UIViewController {

    @IBAction func sendNotification(_ sender: UIButton) {
        print("Button pressed")
        NotificationCenter.default.post(
            name: .customNotification,
            object: nil
        )
    }
}
