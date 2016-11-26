//
//  MasterViewController.swift
//  Workout Extractor
//
//  Created by Caius Durling on 15/10/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import UIKit
import HealthKit

class MasterViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate // tailor:disable

    var detailViewController: DetailViewController? = nil
    var workouts = [Workout]()


    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchWorkoutData()
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = workouts[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Fetching data

    func fetchWorkoutData() {
        let workoutQuery = HKSampleQuery(sampleType: HKWorkoutType.workoutType(), predicate: HKQuery.predicateForWorkouts(with: HKWorkoutActivityType.cycling), limit: 5, sortDescriptors: nil) { (query, samples, error) in

            guard let samples = samples as? [HKWorkout] else {
                fatalError("Error occured trying to grab workouts. The error was: \(error?.localizedDescription)")
            }

            DispatchQueue.main.sync(execute: {
                self.workouts.removeAll()

                for healthWorkout in samples {
                    self.workouts.append(Workout(workout: healthWorkout))
                }

                self.tableView.reloadData()
            })
        }

        appDelegate.healthstore!.execute(workoutQuery)
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = workouts[indexPath.row]
        cell.textLabel!.text = object.description()
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            workouts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}
