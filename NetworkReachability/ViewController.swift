//
//  ViewController.swift
//  NetworkReachability
//
//  Created by PPS SARATH M2 on 2/9/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNetworkObserver()
    }
    
    private func addNetworkObserver() {
        switch NetworkCheck.sharedInstance().currentStatus {
        case .satisfied:
            print("\(#function) | Connection satisfied")
        case .unsatisfied:
            print("\(#function) | Connection unsatisfied")
            DispatchQueue.main.async { [weak self] in
                self?.presentModally()
            }
        case .requiresConnection:
            print("\(#function) | Connection requiresConnection")
        @unknown default:
            fatalError()
        }
    }
    
    private func presentModally() {
        let networkVC = self.storyboard?.instantiateViewController(withIdentifier: "ConnectionLostViewController") as! ConnectionLostViewController
        let navigationController = UINavigationController(rootViewController: networkVC)
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.sheetPresentationController?.detents = [.medium()]
        self.present(navigationController, animated: true)
    }


}

