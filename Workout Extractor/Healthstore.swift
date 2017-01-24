//
//  Healthstore.swift
//  Workout Extractor
//
//  Created by Caius Durling on 05/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import Foundation
import HealthKit

class Healthstore {

    static let healthstore = Healthstore()

    var _store: HKHealthStore?

    init() {
        guard self._store == nil else {
            return
        }

        let store = HKHealthStore()
        let writeableTypes: Set<HKSampleType>? = []
        let readableTypes: Set<HKSampleType>? = [HKWorkoutType.workoutType(), HKSampleType.quantityType(forIdentifier: .distanceWalkingRunning)!, HKSampleType.quantityType(forIdentifier: .heartRate)!]

        print("Healthstore about to request auth")

        store.requestAuthorization(toShare: writeableTypes, read: readableTypes) { (result, error) in
            if error != nil {
                fatalError("Error requesting healthkit auth: \(error?.localizedDescription)")
            }

            self._store = store
            print("Auth accepted")
        }
    }

    func call(block: (HKHealthStore) -> Void) {
        print("Healthstore.call")
        // FIXME: we blow up here if we're requesting permissions - need to handle that asynchronously
        guard self._store != nil else {
            fatalError("Store not initialized yet Healthstore.call called")
        }

        block(self._store!)
    }

}
