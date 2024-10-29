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
    table.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellID)
    
    return table
  }()
  
  // MARK: - LifeCycle
  
  override func loadView() {
    super.loadView()
    
    setup()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
  }
  
}

private extension ChantsViewController {
  
  func setup() {
    
    tableView.dataSource = self
    
    self.view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
    ])
  }
  
}


// MARK: - UITableViewDataSource

extension ChantsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellID, for: indexPath) as? TeamTableViewCell 
    else { return UITableViewCell() }
    cell.configure()
    
    return cell
  }
  
}
