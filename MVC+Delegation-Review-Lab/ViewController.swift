//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var movies = [Movie]()
    
    var font: CGFloat = 14 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? ChangeTableViewController else {
            fatalError()
            
        }
        settingsVC.delegate = self
        settingsVC.initialFont = font
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
    let movie = movies[indexPath.row]
    cell.textLabel?.text = movie.name
    cell.textLabel?.font = cell.textLabel?.font.withSize(font)
        cell.detailTextLabel?.font = cell.detailTextLabel?.font.withSize(font)
    cell.detailTextLabel?.text = movie.description
    cell.imageView?.image = UIImage(named: "\(movie.posterImageName)")
    return cell
        }
    }

extension ViewController: itemCellDelegate {
    func fontSizeChanged(changevc: ChangeTableViewController, fontSize: CGFloat) {
        self.font = changevc.fontSize
    }
}
