//
//  ViewModel.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

protocol ViewModel {
  associatedtype Inputs
  associatedtype Outputs
  func outputs(from inputs: Inputs) -> Outputs
}
