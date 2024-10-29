//
//  Manager.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import Foundation

enum JobType {
  case manager
  case headCoach
}

struct Manager {
  let name: String
  let job: JobType
}
