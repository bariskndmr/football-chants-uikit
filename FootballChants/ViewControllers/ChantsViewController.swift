//
//  ChantsViewController.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import UIKit

final class ChantsViewController: UIViewController {
  
  // MARK: - UI
  
  private lazy var tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .clear
    table.rowHeight = UITableView.automaticDimension
    table.estimatedRowHeight = 44
    table.separatorStyle = .none
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    return table
  }()
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    setup()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .systemBlue
  }
  
}

private extension ChantsViewController {
  
  func setup() {
    
    tableView.dataSource = self
    
    self.view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
      tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
      tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
    ])
  }
  
}


// MARK: - UITableViewDataSource

extension ChantsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    switch indexPath.row {
    case 1:
      cell.backgroundColor = .systemMint
    case 2:
      cell.backgroundColor = .systemRed
    case 3:
      cell.backgroundColor = .systemGray
    default:
      break
    }
    
    return cell
  }
  
}
