//
//  Package.swift
//  
//
//  Created by Yildirim, Alper on 18.06.2023.
//

import Foundation
import RevenueCat

struct Package {
    let revenueCatPackage: RevenueCat.Package
    let identifier: String
    let packageType: PackageType
    let offeringIdentifier: String

    init(identifier: String, packageType: PackageType, offeringIdentifier: String, revenueCatPackage: RevenueCat.Package) {
        self.revenueCatPackage = revenueCatPackage
        self.identifier = identifier
        self.packageType = packageType
        self.offeringIdentifier = offeringIdentifier
    }

    init(revenueCatPackage: RevenueCat.Package) {
        self.revenueCatPackage = revenueCatPackage
        self.identifier = revenueCatPackage.identifier
        self.packageType = revenueCatPackage.packageType
        self.offeringIdentifier = revenueCatPackage.offeringIdentifier
    }
}
