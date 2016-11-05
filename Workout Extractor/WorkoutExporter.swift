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
    }

}
