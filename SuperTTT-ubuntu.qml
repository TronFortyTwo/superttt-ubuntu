import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"

MainView {
    objectName: "mainView"
    applicationName: "com.ubuntu.developer..SuperTTT-ubuntu"
    width: units.gu(100)
    height: units.gu(75)

    Game{id: game}          // contains global game/match variables and functions/methods
    Page {
        id: status

        property string statusText: game.playerOne+"'s Turn"

        title: statusText

        BigGrid{id: bigGrid}    //big TTT grid
        Action{
            id: newGame
            text: "New game"
            onTriggered: bigGrid.reset()
        }
        Action
        {
            id: newMatch            //Currently unused, future prep
            text: "New Match"
            onTriggered: game.reset()
        }
        tools: ToolbarItems {
            ToolbarButton{
                action:newGame
            }
        }

        states: [                // Different states of the title
            State{
                name: "PLAYERONE"       //player 1's move
                PropertyChanges {
                    target: status
                    //color:game.playerOneColor             //may use this sometime for something
                    statusText: game.playerOne+"'s Turn"
                }
            },
            State{
                name: "PLAYERTWO"       //player 2's move
                PropertyChanges {
                    target: status
                    //color:game.playerTwoColor
                    statusText: game.playerTwo+"'s Turn"
                }
            },
            State{
                name: "WINNERONE"       //player 1 won
                PropertyChanges {
                    target: status
                    //color:game.playerOneColor
                    statusText: game.playerOne+" won"
                }
            },
            State{
                name: "WINNERTWO"       //player 2 won
                PropertyChanges {
                    target: status
                    //color:game.playerTwoColor
                    statusText: game.playerTwo+" won"
                }
            },
            State{
                name:"DRAW"             //draw
                PropertyChanges {
                    target: status
                    //color:game.drawColor
                    statusText: "Draw"
                }
            }
        ]
    }
}
