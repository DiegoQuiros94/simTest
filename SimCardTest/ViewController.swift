//
//  ViewController.swift
//  SimCardTest
//
//  Created by Diego Quiros on 06/05/2020.
//  Copyright © 2020 Diego Quiros. All rights reserved.
//

import UIKit
import CoreTelephony

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let telephonyNetworkInfo = CTTelephonyNetworkInfo()
        telephonyNetworkInfo.serviceSubscriberCellularProvidersDidUpdateNotifier = { [weak telephonyNetworkInfo] carrierIdentifier in
            let carrier: CTCarrier? = telephonyNetworkInfo?.serviceSubscriberCellularProviders?[carrierIdentifier]

            DispatchQueue.main.async {
                self.label.text = "sim changed! \(carrier?.carrierName ?? "")"
            }
        }
    }

}

