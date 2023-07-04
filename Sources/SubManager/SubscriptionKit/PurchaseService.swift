//
//  File.swift
//
//
//  Created by Yildirim, Alper on 18.06.2023.
//

import Combine
import RevenueCat
import SwiftUI

public class PurchaseService: ObservableObject {
    @AppStorage("hasActiveSubscription", store: .standard)
    public var hasActiveSubscription = false

    @Published var packages: [Package] = []
    @Published var hasFetchedPackages = false

    public init(revenueCatAPIKey: String) {
        Purchases.logLevel = .debug

        let configuration = Configuration.Builder(withAPIKey: revenueCatAPIKey)
            .with(userDefaults: .standard)
            .build()

        Purchases.configure(with: configuration)

        bindHasActiveSubscriptionToCustomerInfoStream()
        fetchActiveSubscriptionState()

        fetchPackages()
    }

    func purchase(package: Package) async throws -> PurchaseResultData {
        try await Purchases.shared.purchase(package: package.revenueCatPackage)
    }

    public func restorePurchases() async {
        do {
            let customerInfo = try await Purchases.shared.restorePurchases()

            fetchedUpToDateCustomerInfo(customerInfo)
        } catch {
            print(error)
        }
    }

    public func set(firebaseAppInstanceId: String?) {
        Purchases.shared.attribution.setFirebaseAppInstanceID(firebaseAppInstanceId)
    }

    private func fetchActiveSubscriptionState() {
        Task {
            do {
                _ = try await Purchases.shared.syncPurchases()

                let customerInfo = try await Purchases.shared.customerInfo()

                fetchedUpToDateCustomerInfo(customerInfo)
            } catch {
                print(error)
            }
        }
    }

    private func bindHasActiveSubscriptionToCustomerInfoStream() {
        Task {
            for await customerInfo in Purchases.shared.customerInfoStream {
                fetchedUpToDateCustomerInfo(customerInfo)
            }
        }
    }

    private func fetchedUpToDateCustomerInfo(_ customerInfo: CustomerInfo) {
        DispatchQueue.main.async {
            self.hasActiveSubscription = !customerInfo.activeSubscriptions.isEmpty
        }
    }

    private func fetchPackages() {
        Task {
            do {
                let offerings = try await Purchases.shared.offerings()

                guard
                    let revenueCatPackages = offerings.current?.availablePackages
                else {
                    print("There is no default offering selected")

                    return
                }

                DispatchQueue.main.async {
                    self.packages = revenueCatPackages.compactMap(Package.init(revenueCatPackage:))
                    self.hasFetchedPackages = true
                }
            } catch {
                print(error)
            }
        }
    }
}
