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
}
