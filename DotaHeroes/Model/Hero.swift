//
//  Hero.swift
//  DotaHeroes
//
//  Created by Mohammad Azri on 03/10/22.
//

import Foundation




struct Transaction : Identifiable {
    let uuid = UUID()
    let id: Int
    let name: String
    let category: String
    let value: Int
    let isIncome: Bool
}

let dummyTransaction = [
    Transaction(id: 1, name: "Samuel Suhi", category: "Transfer", value: 50000, isIncome: true),
    Transaction(id: 2, name: "Spotify", category: "Subscription", value: 49000, isIncome: false),
    Transaction(id: 3, name: "Netflix", category: "Subscription", value: 149000, isIncome: false),
    Transaction(id: 4, name: "Bobi Sammy", category: "Transfer", value: 1150000, isIncome: true),
]
