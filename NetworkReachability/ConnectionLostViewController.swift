//
//  ConnectionLostViewController.swift
//  NetworkReachability
//
//  Created by PPS SARATH M2 on 2/9/24.
//

import UIKit

class ConnectionLostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addNetworkObserver()
    }

    private func addNetworkObserver() {
        switch NetworkCheck.sharedInstance().currentStatus {
        case .satisfied:
            print("ConnectionVC | \(#function) | Connection satisfied")
            DispatchQueue.main.async { [weak self] in
                self?.dismiss(animated: true)
            }
        case .unsatisfied:
            print("ConnectionVC| \(#function) | Connection unsatisfied")
        case .requiresConnection:
            print("ConnectionVC | \(#function) | Connection requiresConnection")
        @unknown default:
            fatalError()
        }
    }

}
