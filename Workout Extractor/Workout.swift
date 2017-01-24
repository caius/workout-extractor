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

    func workoutTypeString() -> String {
        switch workout.workoutActivityType {
        case HKWorkoutActivityType.americanFootball:
            return "American Football"
        case HKWorkoutActivityType.archery:
            return "Archery"
        case HKWorkoutActivityType.australianFootball:
            return "Australian football"
        case HKWorkoutActivityType.badminton:
            return "Badminton"
        case HKWorkoutActivityType.baseball:
            return "Baseball"
        case HKWorkoutActivityType.basketball:
            return "Basketball"
        case HKWorkoutActivityType.bowling:
            return "Bowling"
        case HKWorkoutActivityType.boxing:
            return "Boxing"
        case HKWorkoutActivityType.climbing:
            return "Climbing"
        case HKWorkoutActivityType.cricket:
            return "Cricket"
        case HKWorkoutActivityType.crossTraining:
            return "Cross-Training"
        case HKWorkoutActivityType.curling:
            return "Curling"
        case HKWorkoutActivityType.cycling:
            return "Cycling"
        case HKWorkoutActivityType.dance:
            return "Dancing"
        case HKWorkoutActivityType.danceInspiredTraining:
            return "Dance-inspired"
        case HKWorkoutActivityType.elliptical:
            return "Elliptical"
        case HKWorkoutActivityType.equestrianSports:
            return "Equestrian Sports"
        case HKWorkoutActivityType.fencing:
            return "Fencing"
        case HKWorkoutActivityType.fishing:
            return "Fishing"
        case HKWorkoutActivityType.functionalStrengthTraining:
            return "Strength Training"
        case HKWorkoutActivityType.golf:
            return "Golf"
        case HKWorkoutActivityType.gymnastics:
            return "Gymnastics"
        case HKWorkoutActivityType.handball:
            return "Handball"
        case HKWorkoutActivityType.hiking:
            return "Hiking"
        case HKWorkoutActivityType.hockey:
            return "Hockey"
        case HKWorkoutActivityType.hunting:
            return "Hunting"
        case HKWorkoutActivityType.lacrosse:
            return "Lacrosse"
        case HKWorkoutActivityType.martialArts:
            return "Martial Arts"
        case HKWorkoutActivityType.mindAndBody:
            return "Mind and Body"
        case HKWorkoutActivityType.mixedMetabolicCardioTraining:
            return "Mixed Cardio"
        case HKWorkoutActivityType.paddleSports:
            return "Canoeing"
        case HKWorkoutActivityType.play:
            return "Play"
        case HKWorkoutActivityType.preparationAndRecovery:
            return "Warm up/down"
        case HKWorkoutActivityType.racquetball:
            return "Racquetball"
        case HKWorkoutActivityType.rowing:
            return "Rowing"
        case HKWorkoutActivityType.rugby:
            return "Rugby"
        case HKWorkoutActivityType.running:
            return "Running"
        case HKWorkoutActivityType.sailing:
            return "Sailing"
        case HKWorkoutActivityType.skatingSports:
            return "Skating"
        case HKWorkoutActivityType.snowSports:
            return "Snow Sports"
        case HKWorkoutActivityType.soccer:
            return "Soccer"
        case HKWorkoutActivityType.softball:
            return "Softball"
        case HKWorkoutActivityType.squash:
            return "Squash"
        case HKWorkoutActivityType.stairClimbing:
            return "Climbing Stairs"
        case HKWorkoutActivityType.surfingSports:
            return "Surfing"
        case HKWorkoutActivityType.swimming:
            return "Swimming"
        case HKWorkoutActivityType.tableTennis:
            return "Table Tennis"
        case HKWorkoutActivityType.tennis:
            return "Tennis"
        case HKWorkoutActivityType.trackAndField:
            return "Athletics"
        case HKWorkoutActivityType.traditionalStrengthTraining:
            return "Strength Training"
        case HKWorkoutActivityType.volleyball:
            return "Volleyball"
        case HKWorkoutActivityType.walking:
            return "Walking"
        case HKWorkoutActivityType.waterFitness:
            return "Water"
        case HKWorkoutActivityType.waterPolo:
            return "Water Polo"
        case HKWorkoutActivityType.waterSports:
            return "Water Sports"
        case HKWorkoutActivityType.wrestling:
            return "Wrestling"
        case HKWorkoutActivityType.yoga:
            return "Yoga"
        case HKWorkoutActivityType.other:
            return "Other"
        case HKWorkoutActivityType.barre:
            return "Barre workout"
        case HKWorkoutActivityType.coreTraining:
            return "Core Training"
        case HKWorkoutActivityType.crossCountrySkiing:
            return "Cross Country Skiing"
        case HKWorkoutActivityType.downhillSkiing:
            return "Downhill Skiing"
        case HKWorkoutActivityType.flexibility:
            return "Flexibility Workout"
        case HKWorkoutActivityType.highIntensityIntervalTraining:
            return "High Intensity Interval Training"
        case HKWorkoutActivityType.jumpRope:
            return "Jumping Rope"
        case HKWorkoutActivityType.kickboxing:
            return "Kickboxing"
        case HKWorkoutActivityType.pilates:
            return "Pilates"
        case HKWorkoutActivityType.snowboarding:
            return "Snowboarding"
        case HKWorkoutActivityType.stairs:
            return "Stairs Workout"
        case HKWorkoutActivityType.stepTraining:
            return "Step Training"
        case HKWorkoutActivityType.wheelchairWalkPace:
            return "walking pace wheelchair workout"
        case HKWorkoutActivityType.wheelchairRunPace:
            return "running pace wheelchair workout"
        }
    }

    func workoutDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.short
        return formatter.string(from: workout.startDate)
    }

    func description() -> String {
        return "\(workoutDateString()) - \(workoutTypeString())"
    }

}
