//
//  WorkoutTest.swift
//  Workout Extractor
//
//  Created by Caius Durling on 15/10/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import XCTest
@testable import HealthKit

class WorkoutTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWrapsWorkout() {
        let workout = Workout(workout: hkworkoutFor(activityType: HKWorkoutActivityType.cycling))
        XCTAssertNotNil(workout)
    }

    func testDescriptionCycle() {
        let workout = Workout(workout: hkworkoutFor(activityType: HKWorkoutActivityType.cycling))

        XCTAssertEqual(workout.description(), "Cycle - 3.2 km")
    }

    func testDescriptionRunning() {
        let workout = Workout(workout: hkworkoutFor(activityType: HKWorkoutActivityType.running))
        
        XCTAssertEqual(workout.description(), "Run - 3.2 km")
    }

    func testDescriptionSwimming() {
        let workout = Workout(workout: hkworkoutFor(activityType: HKWorkoutActivityType.swimming))
        
        XCTAssertEqual(workout.description(), "Swim - 3.2 km")
    }

    func testDescriptionWalking() {
        let workout = Workout(workout: hkworkoutFor(activityType: HKWorkoutActivityType.walking))
        
        XCTAssertEqual(workout.description(), "Walk - 3.2 km")
    }

    private func hkworkoutFor(activityType: HKWorkoutActivityType) -> HKWorkout {
        let start = Date(timeIntervalSinceNow: 0)
        let end = Date(timeIntervalSinceNow: 1800)
        let duration: TimeInterval = 1800
        let energyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: 425.0)
        let distance = HKQuantity(unit: HKUnit.meterUnit(with: HKMetricPrefix.kilo), doubleValue: 3.2)

        return HKWorkout(activityType: activityType, start: start, end: end, duration: duration, totalEnergyBurned: energyBurned, totalDistance: distance, metadata: nil)
    }
}
