//
//  Team.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import Foundation

class Team {
  let id: TeamType
  let name: String
  let info: String
  let manager: Manager
  let founded: String
  var isPlaying: Bool = false
  
  init(id: TeamType, name: String, info: String, manager: Manager, founded: String) {
    self.id = id
    self.name = name
    self.info = info
    self.manager = manager
    self.founded = founded
  }
}
