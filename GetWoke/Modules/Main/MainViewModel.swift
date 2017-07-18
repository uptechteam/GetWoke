//
//  MainViewModel.swift
//  GetWoke
//
//  Created by Евгений Матвиенко on 7/18/17.
//  Copyright © 2017 UPTech Team. All rights reserved.
//

import UIKit

protocol MainViewModelProtocol: ViewModel { }

class MainViewModel: MainViewModelProtocol {
  struct Inputs {
  }

  struct Outputs {

  }

  func outputs(from inputs: MainViewModel.Inputs) -> MainViewModel.Outputs {
    return Outputs()
  }
}
