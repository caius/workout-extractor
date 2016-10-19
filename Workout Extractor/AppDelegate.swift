//
//  AppDelegate.swift
//  Workout Extractor
//
//  Created by Caius Durling on 15/10/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var healthstore: HKHealthStore?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        setupHealthkit {
            // Override point for customization after application launch.
            let splitViewController = self.window!.rootViewController as! UISplitViewController // tailor:disable
            let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController // tailor:disable
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            splitViewController.delegate = self
        }

        return true
    }

    func setupHealthkit(callback: @escaping () -> Void) {
        guard self.healthstore == nil else {
            return
        }

        let store = HKHealthStore()
        let writeableTypes: Set<HKSampleType>? = []
        let readableTypes: Set<HKSampleType>? = [HKWorkoutType.workoutType()]

        store.requestAuthorization(toShare: writeableTypes, read: readableTypes) { (result, error) in
            if error != nil {
                fatalError("Error requesting healthkit auth: \(error?.localizedDescription)")
            }

            self.healthstore = store
            callback()
        }
    }

    // MARK: - Split view

func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}
