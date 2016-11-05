//
//  DetailViewController.swift
//  Workout Extractor
//
//  Created by Caius Durling on 15/10/2016.
//  Copyright © 2016 Caius Durling. All rights reserved.
//

import UIKit
import HealthKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description()
            }
        }

        let exportButton = UIBarButtonItem(title: "Export", style: UIBarButtonItemStyle.plain, target: self, action: #selector(exportWorkout(_:)))
        self.navigationItem.rightBarButtonItem = exportButton

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Workout? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func exportWorkout(_ sender: Any) {
        print("Exporting workout \(self.detailItem!.description())")

        Healthstore.healthstore.call { (store) in
            let exporter = WorkoutExporter(store: store, workout: detailItem!.workout)
            exporter.export()
        }
    }

}
