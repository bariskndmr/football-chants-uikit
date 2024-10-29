//
//  Team.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import Foundation

struct Team {
  let id: TeamType
  let name: String
  let info: String
  let manager: Manager
  let founded: String
  var isPlaying: Bool = false
}
