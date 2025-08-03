# DailyQuiz

iOS-приложение для прохождения коротких викторин, разработанное в рамках **Surf Summer iOS School 2025**.

## 🛠️ Технологии

- **iOS 16.4+**
- **SwiftUI**
- **CoreData**
- **URLSession** с async/await
- **Open Trivia Database API**

## 🏗️ Архитектура

**MVVM + Router** с модульной структурой:
- Каждый экран — отдельный модуль с Assembly для сборки зависимостей
- Protocol-oriented сервисы (Mock и Network реализации)
- Разделение Entry (API) и Entity (App) моделей
- CoreData для постоянного хранения истории

## ✅ Реализация по ТЗ

В приложении реализован весь обязательный и дополнительный функционал согласно требованиям:

- Загрузка викторины с сервера (Open Trivia DB)
- Фильтры категории и сложности перед запуском викторины
- Отображение состояния ошибки
- Прохождение 5 вопросов с поддержкой подсветки выбранного ответа (правильно/неправильно)
- Блокировка UI во время подсветки и переходов между вопросами
- Таймер на 5 минут с авто-завершением викторины и сохранением случайных ответов
- Сохранение результата в постоянное хранилище
- Раздел с историей прохождений, удалением попыток и пустым состоянием
- Экран разбора викторины: отображение ответов, правильности и выбранных вариантов

## 🎥 Видео демо

[Rutube](https://rutube.ru/video/197bf71fc07458f9291b7c2f1dbb38e2/)
## 📸 Скриншоты

| | | | |
|--|--|--|--|
| ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2461.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2463.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2465.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2466.PNG) |
| ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2467.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2468.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2470.PNG) | ![](https://github.com/IgorPustylnik/daily-quiz-ios/blob/main/Images/IMG_2471.PNG) |
