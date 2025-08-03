//
//  TimerManager.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 03.08.2025.
//

import Foundation
import UIKit

final class TimerManager: ObservableObject {

    // MARK: - Public Properties

    @Published
    private(set) var elapsedTime: TimeInterval = 0
    @Published
    private(set) var duration: TimeInterval = 0

    // MARK: - Private Properties

    private var onComplete: EmptyClosure?
    private var lastStartDate: Date?
    private var displayLink: CADisplayLink?
    private var pausedElapsedTime: TimeInterval = 0

    // MARK: - Computed

    var isActive: Bool {
        lastStartDate != nil
    }

    // MARK: - Public Methods

    func start(duration: TimeInterval, onComplete: @escaping () -> Void) {
        self.duration = duration
        self.onComplete = onComplete
        self.elapsedTime = 0
        self.pausedElapsedTime = 0
        resume()
    }

    func pause() {
        guard let lastStartDate else {
            return
        }

        let currentSessionTime = Date().timeIntervalSince(lastStartDate)
        let totalElapsed = pausedElapsedTime + currentSessionTime

        elapsedTime = min(totalElapsed, duration)

        pausedElapsedTime = totalElapsed
        self.lastStartDate = nil
        stopDisplayLink()
    }

    func resume() {
        guard !isActive else {
            return
        }

        lastStartDate = Date()
        startDisplayLink()
    }

    func stop() {
        elapsedTime = 0
        duration = 0
        pausedElapsedTime = 0
        lastStartDate = nil
        stopDisplayLink()
    }

    // MARK: - Display Link Handling

    private func startDisplayLink() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .main, forMode: .common)
    }

    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }

    @objc
    private func update() {
        guard let lastStartDate else {
            return
        }

        let currentSessionTime = Date().timeIntervalSince(lastStartDate)
        let totalElapsed = pausedElapsedTime + currentSessionTime

        if totalElapsed >= duration {
            elapsedTime = duration
            onComplete?()
            return
        }

        elapsedTime = totalElapsed
    }
}
