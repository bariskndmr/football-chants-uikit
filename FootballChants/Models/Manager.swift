//
//  Manager.swift
//  FootballChants
//
//  Created by BarisKandemir on 29.10.2024.
//

import Foundation

enum JobType: String {
  case manager = "Manager"
  case headCoach = "Head Coach"
}

struct Manager {
  let name: String
  let job: JobType
}
