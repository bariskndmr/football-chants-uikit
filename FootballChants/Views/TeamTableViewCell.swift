//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
  
  static let cellID = "TeamTableViewCell"
  
  // MARK: - UI
  
  private lazy var containerView: UIView = {
    let view = UIView();
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  private lazy var contentStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 4
    stackView.axis = .vertical
    
    return stackView
  }()
  
  private lazy var badgeImageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    
    return view
  }()
  
  private lazy var playBackButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tintColor = .white
    
    return button
  }()
  
  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.textColor = .white
    
    return label
  }()
  
  private lazy var foundedLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 12, weight: .light)
    label.textColor = .white
    
    return label
  }()
  
  private lazy var jobLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 10, weight: .light)
    label.textColor = .white
    
    return label
  }()
  
  private lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .white
    
    return label
  }()
  
  // MARK: - LifeCycle
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.layer.cornerRadius = 10
  }
  
  // MARK: - Configurations
  
  func configure()  {
    
    containerView.backgroundColor = TeamType.arsenal.background
    
    badgeImageView.image = TeamType.arsenal.badge
    
    let playBackButtonImage = UIImage(
      systemName: "play.circle.fill",
      withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))
    
    playBackButton.setImage(playBackButtonImage, for: .normal)
    
    nameLabel.text = "Arsenal"
    foundedLabel.text = "1880"
    jobLabel.text = "Mikel Arteta"
    infoLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    
    self.contentView.addSubview(containerView)
    
    containerView.addSubview(contentStackView)
    containerView.addSubview(badgeImageView)
    containerView.addSubview(playBackButton)
    
    contentStackView.addArrangedSubview(nameLabel)
    contentStackView.addArrangedSubview(foundedLabel)
    contentStackView.addArrangedSubview(jobLabel)
    contentStackView.addArrangedSubview(infoLabel)
    
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
      containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
      containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
      containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
      
      badgeImageView.heightAnchor.constraint(equalToConstant: 50),
      badgeImageView.widthAnchor.constraint(equalToConstant: 50),
      badgeImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
      badgeImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
      
      contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
      contentStackView.trailingAnchor.constraint(equalTo: playBackButton.leadingAnchor, constant: -8),
      contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
      contentStackView.leadingAnchor.constraint(equalTo: badgeImageView.trailingAnchor, constant: 8),
      
      playBackButton.heightAnchor.constraint(equalToConstant: 44),
      playBackButton.widthAnchor.constraint(equalToConstant: 44),
      playBackButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
      playBackButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
      
    ])
    
  }
  
}
