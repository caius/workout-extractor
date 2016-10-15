//
//  Workout.swift
//  Workout Extractor
//
//  Created by Caius Durling on 11/09/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import HealthKit

class Workout {
    var workout: HKWorkout
    
    init(workout: HKWorkout) {
        self.workout = workout
    }
    
    func description() -> String {
        switch workout.workoutActivityType {
        case HKWorkoutActivityType.cycling:
            //      let length = HKUnit.lengthFormatterUnit(from: workout.totalDistance!)
            return "Cycle - \(workout.totalDistance!.description)"
        default:
            return "Unknown workout type"
        }
    }
}
