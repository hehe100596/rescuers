//================================================================================
// BACHELOR THESIS - AUGMENTED REALITY FOR DESK GAMES
//================================================================================

/*
 * Filename:       gameboard.js
 * Date:           27. 11. 2017
 * Subject:        IBP - Bachelor Thesis
 * Description:    Javascript file for gameboard
 * Author:         Juraj Bačovčin
 *                 (xbacov04@stud.fit.vutbr.cz)
 */

var maxColumn = 10;
var maxRow = 8;
var maxIndex = maxRow * maxColumn;
var board = new Array (maxIndex);
var component;

function index (column, row)
{
    return column + (row * maxColumn);
}

function startGame ()
{
    for (var i = 0; i < maxIndex; i++)
    {
        if (board [i] != null) board [i].destroy ();
    }

    for (var column = 0; column < maxColumn; column++)
    {
        for (var row = 0; row < maxRow; row++)
        {
            board [index (column, row)] = null;
            createSquare (column, row);
        }
    }

    // TODO: add alerts to the start of the game
    for (var fires = 0; fires < (game.difficulty * 5); fires++)
    {
        addFire ();
    }
}

function createSquare (column, row)
{
    if (component == null) component = Qt.createComponent ("../qml/GameSquare.qml");

    if (component.status == Component.Ready)
    {
        var dynamicObject = component.createObject (gameboard);

        if (dynamicObject == null)
        {
            showErrorMessage ("Error creating gameboard.")
            return false;
        }

        dynamicObject.column = column;
        dynamicObject.row = row;

        board [index (column, row)] = dynamicObject;
    }
    else
    {
        showErrorMessage ("Error loading square component.")
        return false;
    }

    return true;
}

function createExplosion (fireX, fireY)
{
    var counter;

    counter = 0;
    while (true)
    {
        if (fireX > counter)
        {
            if (board [index (fireX - (counter + 1), fireY)].state !== "fire")
            {
                board [index (fireX - (counter + 1), fireY)].state = "fire";
                break;
            }
            counter++;
        }
        else break;
    }

    counter = 0;
    while (true)
    {
        if (fireX < (maxColumn - (1 + counter)))
        {
            if (board [index (fireX + (counter + 1), fireY)].state !== "fire")
            {
                board [index (fireX + (counter + 1), fireY)].state = "fire";
                break;
            }
            counter++;
        }
        else break;
    }

    counter = 0;
    while (true)
    {
        if (fireY > counter)
        {
            if (board [index (fireX, fireY - (counter + 1))].state !== "fire")
            {
                board [index (fireX, fireY - (counter + 1))].state = "fire";
                break;
            }
            counter++;
        }
        else break;
    }

    counter = 0;
    while (true)
    {
        if (fireY < (maxRow - (1 + counter)))
        {
            if (board [index (fireX, fireY + (counter + 1))].state !== "fire")
            {
                board [index (fireX, fireY + (counter + 1))].state = "fire";
                break;
            }
            counter++;
        }
        else break;
    }
}

function checkSmokeAround (smokeX, smokeY)
{
    board [index (smokeX, smokeY)].state = "smoke";

    if ((smokeX > 0 && board [index (smokeX - 1, smokeY)].state === "smoke") ||
        (smokeX < (maxColumn - 1) && board [index (smokeX + 1, smokeY)].state === "smoke") ||
        (smokeY > 0 && board [index (smokeX, smokeY - 1)].state === "smoke") ||
        (smokeY < (maxRow - 1) && board [index (smokeX, smokeY + 1)].state === "smoke"))
        board [index (smokeX, smokeY)].state = "fire";
}

function checkFireAround (fireX, fireY)
{
    if ((fireX > 0 && board [index (fireX - 1, fireY)].state === "fire") ||
        (fireX < (maxColumn - 1) && board [index (fireX + 1, fireY)].state === "fire") ||
        (fireY > 0 && board [index (fireX, fireY - 1)].state === "fire") ||
        (fireY < (maxRow - 1) && board [index (fireX, fireY + 1)].state === "fire"))
    {
        board [index (fireX, fireY)].state = "fire";
        checkAfterEffects ();
    }
}

function checkAfterEffects () // TODO: add damages and reactions to alerts and players
{
    for (var column = 0; column < maxColumn; column++)
    {
        for (var row = 0; row < maxRow; row++)
        {
            if (board [index (column, row)].state === "smoke") checkFireAround (column, row);
        }
    }
}

function addSmoke () // TODO: add walls, doors and alerts
{
    var smokeX = Math.floor ((Math.random () * (maxColumn - 2)) + 1);
    var smokeY = Math.floor ((Math.random () * (maxRow - 2)) + 1);
    var smoke = index (smokeX, smokeY);

    if (board [smoke].state === "nothing") checkSmokeAround (smokeX, smokeY);

    else if (board [smoke].state === "smoke") board [smoke].state = "fire";

    else if (board [smoke].state === "fire") createExplosion (smokeX, smokeY);

    else showErrorMessage ("Unidentified behavior."); // TODO: add reaction to alerts and players

    checkAfterEffects ();
}

function addFire ()
{
    var fireX = Math.floor ((Math.random () * (maxColumn - 2)) + 1);
    var fireY = Math.floor ((Math.random () * (maxRow - 2)) + 1);
    var fire = index (fireX, fireY);

    if (board [fire].state === "fire") addFire ();

    else board [fire].state = "fire";
}

//--------------------------------------------------------------------------------
// End of file gameboard.js
//--------------------------------------------------------------------------------
