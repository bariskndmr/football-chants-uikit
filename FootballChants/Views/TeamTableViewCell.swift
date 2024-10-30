//
//  TeamTableViewCell.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import UIKit

protocol TeamTableViewCellDelegate: AnyObject {
  func didTapPlayback(for team: Team)
}

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
  
  private weak var delegate: TeamTableViewCellDelegate?
  private var team: Team?
  
  // MARK: - LifeCycle
  
  override func layoutSubviews() {
    super.layoutSubviews()
    containerView.layer.cornerRadius = 10
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    self.team = nil
    self.delegate = nil
    self.contentView.subviews.forEach { $0.removeFromSuperview() }
  }
  
  // MARK: - Configurations
  
  func configure(with team: Team, delegate: TeamTableViewCellDelegate)  {
    
    self.delegate = delegate
    self.team = team
    
    playBackButton.addTarget(
      self,
      action: #selector(didTapPlayback),
      for: .touchUpInside)
    
    containerView.backgroundColor = team.id.background
    
    badgeImageView.image = team.id.badge
    
    let playButtonImage = UIImage(
      systemName: "play.circle.fill",
      withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))
    
    let pauseButtonImage = UIImage(
      systemName: "pause.circle.fill",
      withConfiguration: UIImage.SymbolConfiguration(pointSize: 32))
    
    playBackButton.setImage(team.isPlaying ? pauseButtonImage : playButtonImage, for: .normal)
    
    nameLabel.text = team.name
    foundedLabel.text = team.founded
    jobLabel.text = "Current \(team.manager.job.rawValue) : \(team.manager.name)"
    infoLabel.text = team.info
    
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
  
  @objc func didTapPlayback() {
    if let team = team {
      self.delegate?.didTapPlayback(for: team)
    }
  }
  
}
