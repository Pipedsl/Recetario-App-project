//  Recipe.swift
//  RecetarioAPP
//
//  Created by Felipe Navarrete Navarrete on 25-09-25.

import Foundation

struct Recipe: Identifiable {
    var id: String
    var name: String
    var ingredients: [String]
    var instructions: [String]
}
