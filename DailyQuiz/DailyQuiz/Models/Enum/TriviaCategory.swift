//
//  TriviaCategory.swift
//  DailyQuiz
//
//  Created by Игорь Пустыльник on 01.08.2025.
//

import Foundation

enum TriviaCategory: String, Decodable {
    case generalKnowledge = "General Knowledge"
    case entertainmentBooks = "Entertainment: Books"
    case entertainmentFilm = "Entertainment: Film"
    case entertainmentMusic = "Entertainment: Music"
    case entertainmentMusicalsTheatres = "Entertainment: Musicals & Theatres"
    case entertainmentTelevision = "Entertainment: Television"
    case entertainmentVideoGames = "Entertainment: Video Games"
    case entertainmentBoardGames = "Entertainment: Board Games"
    case scienceNature = "Science & Nature"
    case scienceComputers = "Science: Computers"
    case scienceMathematics = "Science: Mathematics"
    case mythology = "Mythology"
    case sports = "Sports"
    case geography = "Geography"
    case history = "History"
    case politics = "Politics"
    case art = "Art"
    case celebrities = "Celebrities"
    case animals = "Animals"
    case vehicles = "Vehicles"
    case entertainmentComics = "Entertainment: Comics"
    case scienceGadgets = "Science: Gadgets"
    case entertainmentJapaneseAnimeManga = "Entertainment: Japanese Anime & Manga"
    case entertainmentCartoonAnimations = "Entertainment: Cartoon & Animations"

    case unknown

    var id: Int {
        switch self {
        case .generalKnowledge: return 9
        case .entertainmentBooks: return 10
        case .entertainmentFilm: return 11
        case .entertainmentMusic: return 12
        case .entertainmentMusicalsTheatres: return 13
        case .entertainmentTelevision: return 14
        case .entertainmentVideoGames: return 15
        case .entertainmentBoardGames: return 16
        case .scienceNature: return 17
        case .scienceComputers: return 18
        case .scienceMathematics: return 19
        case .mythology: return 20
        case .sports: return 21
        case .geography: return 22
        case .history: return 23
        case .politics: return 24
        case .art: return 25
        case .celebrities: return 26
        case .animals: return 27
        case .vehicles: return 28
        case .entertainmentComics: return 29
        case .scienceGadgets: return 30
        case .entertainmentJapaneseAnimeManga: return 31
        case .entertainmentCartoonAnimations: return 32
        case .unknown: return -1
        }
    }

}
