//
//  WorkoutExporter.swift
//  Workout Extractor
//
//  Created by Caius Durling on 05/11/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import Foundation
import HealthKit

class WorkoutExporter {

    let workout: HKWorkout
    let store: HKHealthStore

    init(store: HKHealthStore, workout: HKWorkout) {
        self.store = store
        self.workout = workout
    }

    func export() {
        print("Exporting workout \(workout)")

        print("Workout events: \(workout.workoutEvents)")


        let filter = HKQuery.predicateForObjects(from: workout)
        let sorting = [NSSortDescriptor(key: "startDate", ascending: true)]
        let workoutQuery = HKSampleQuery(sampleType: HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!, predicate: filter, limit: 1024, sortDescriptors: sorting) { (query, samples, error) in

            print("\(samples)")
            print("Got \(samples!.count) samples")

            for s in samples! {
                print("\(s)")
            }

        }

        store.execute(workoutQuery)
    }

}
