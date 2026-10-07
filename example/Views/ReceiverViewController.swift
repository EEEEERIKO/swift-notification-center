import UIKit

final class ReceiverViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Receiver is listening")

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleNotification),
            name: .customNotification,
            object: nil
        )
    }

    @objc func handleNotification(_ notification: Notification) {
        print("Notification received")
        messageLabel.text = "Notification received!"

    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
