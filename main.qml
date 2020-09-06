import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "components"

ApplicationWindow {
	
	id: rootPage
	
	width: 100
	height: 75

	// contains global game/match variables and functions/methods
	Game {
		id: game
	}

	// big TTT grid
	BigGrid{id: bigGrid}

	header: ToolBar {
		
		id: status
		
		width: parent.width
		RowLayout {
			anchors.fill: parent
			Label {
				id: title
				text: game.playerOne + "'s Turn"
				Layout.fillWidth: true
			}
			ToolButton {
				text: "New Game"
				onClicked: bigGrid.reset()
			}
		}
	
		states: [                // Different states of the title
			State{
				name: "PLAYERONE"       //player 1's move
				PropertyChanges {
					target: title
					//color:game.playerOneColor             //may use this sometime for something
					text: game.playerOne+"'s Turn"
				}
			},
			State{
				name: "PLAYERTWO"       //player 2's move
				PropertyChanges {
					target: title
					//color:game.playerTwoColor
					text: game.playerTwo+"'s Turn"
				}
			},
			State{
				name: "WINNERONE"       //player 1 won
				PropertyChanges {
					target: title
					//color:game.playerOneColor
					text: game.playerOne+" won"
				}
			},
			State{
				name: "WINNERTWO"       //player 2 won
				PropertyChanges {
					target: title
					//color:game.playerTwoColor
					text: game.playerTwo+" won"
				}
			},
			State{
				name:"DRAW"             //draw
				PropertyChanges {
					target: title
					//color:game.drawColor
					text: "Draw"
				}
			}
		]
	}
}
