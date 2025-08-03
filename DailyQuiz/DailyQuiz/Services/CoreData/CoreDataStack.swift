//
//  CoreDataStack.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 02.08.2025.
//

import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack()

    private init() {}

    private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DailyQuiz")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("unable to load persistent store")
            }
        })
        return container
    }()

}
