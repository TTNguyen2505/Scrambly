pragma Singleton
import QtQuick

QtObject {
    // Application Info
    readonly property string appName: qsTr("Scrambly")
    readonly property string appTagline: qsTr("Unscramble the letters, find the words!")
    readonly property string appDescription: qsTr("A fun and challenging word unscrambling puzzle game.")
    readonly property string version: "1.0.0"

    // Common Actions
    readonly property string ok: qsTr("OK")
    readonly property string cancel: qsTr("Cancel")
    readonly property string close: qsTr("Close")
    readonly property string back: qsTr("Back")
    readonly property string retry: qsTr("Retry")
    readonly property string search: qsTr("Search")
    readonly property string settings: qsTr("Settings")

    // Gameplay Actions
    readonly property string play: qsTr("Play")
    readonly property string pause: qsTr("Pause")
    readonly property string resume: qsTr("Resume")
    readonly property string restart: qsTr("Restart")
    readonly property string shuffle: qsTr("Shuffle")
    readonly property string submit: qsTr("Submit")
    readonly property string clear: qsTr("Clear")
    readonly property string hint: qsTr("Hint")

    // Gameplay Stats & Status
    readonly property string score: qsTr("Score")
    readonly property string highScore: qsTr("High Score")
    readonly property string level: qsTr("Level")
    readonly property string timer: qsTr("Time")
    readonly property string wordsFound: qsTr("Words Found")
    readonly property string ready: qsTr("Ready")

    // Messages & Alerts
    readonly property string welcomeTitle: qsTr("Welcome to Scrambly!")
    readonly property string welcomeSubtitle: qsTr("Unscramble letters to find as many words as you can!")
    readonly property string gameOverTitle: qsTr("Game Over")
    readonly property string gameOverMessage: qsTr("Great effort! Want to try another round?")
    readonly property string victoryTitle: qsTr("Congratulations!")
    readonly property string victoryMessage: qsTr("You solved all words for this level!")
    readonly property string invalidWordMessage: qsTr("Not in the word list. Keep guessing!")
}
