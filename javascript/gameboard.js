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

    createWalls ();

    for (var alerts = 0; alerts < 3; alerts++)
    {
        addAlert ()
    }

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

function createWalls () // TODO: dynamically creating walls based on background picture
{
    if (game.building == 0)
    {
        board [11].leftWall = "full";
        board [21].leftWall = "full";
        board [31].leftWall = "closed";
        board [41].leftWall = "full";
        board [51].leftWall = "full";
        board [61].leftWall = "full";

        board [33].leftWall = "closed";
        board [43].leftWall = "full";

        board [14].leftWall = "closed";
        board [24].leftWall = "full";

        board [16].leftWall = "full";
        board [26].leftWall = "closed";
        board [56].leftWall = "full";
        board [66].leftWall = "closed";

        board [37].leftWall = "full";
        board [47].leftWall = "closed";

        board [58].leftWall = "full";
        board [68].leftWall = "closed";

        board [19].leftWall = "full";
        board [29].leftWall = "full";
        board [39].leftWall = "full";
        board [49].leftWall = "closed";
        board [59].leftWall = "full";
        board [69].leftWall = "full";

        board [11].topWall = "full";
        board [12].topWall = "full";
        board [13].topWall = "full";
        board [14].topWall = "full";
        board [15].topWall = "full";
        board [16].topWall = "closed";
        board [17].topWall = "full";
        board [18].topWall = "full";

        board [33].topWall = "full";
        board [34].topWall = "full";
        board [35].topWall = "full";
        board [36].topWall = "full";
        board [37].topWall = "full";
        board [38].topWall = "closed";

        board [51].topWall = "full";
        board [52].topWall = "full";
        board [53].topWall = "full";
        board [54].topWall = "closed";
        board [55].topWall = "full";
        board [56].topWall = "full";
        board [57].topWall = "full";
        board [58].topWall = "full";

        board [71].topWall = "full";
        board [72].topWall = "full";
        board [73].topWall = "closed";
        board [74].topWall = "full";
        board [75].topWall = "full";
        board [76].topWall = "full";
        board [77].topWall = "full";
        board [78].topWall = "full";
    }

    else if (game.building == 1)
    {
        board [11].leftWall = "full";
        board [21].leftWall = "full";
        board [31].leftWall = "closed";
        board [41].leftWall = "full";
        board [51].leftWall = "full";
        board [61].leftWall = "full";

        board [14].leftWall = "full";
        board [24].leftWall = "full";
        board [34].leftWall = "full";
        board [54].leftWall = "full";
        board [64].leftWall = "full";

        board [16].leftWall = "closed";
        board [26].leftWall = "full";
        board [36].leftWall = "closed";

        board [47].leftWall = "closed";
        board [57].leftWall = "full";
        board [67].leftWall = "full";

        board [19].leftWall = "full";
        board [29].leftWall = "full";
        board [39].leftWall = "full";
        board [49].leftWall = "full";
        board [59].leftWall = "full";
        board [69].leftWall = "full";

        board [11].topWall = "full";
        board [12].topWall = "full";
        board [13].topWall = "full";
        board [14].topWall = "full";
        board [15].topWall = "full";
        board [16].topWall = "full";
        board [17].topWall = "full";
        board [18].topWall = "full";

        board [24].topWall = "full";
        board [25].topWall = "full";

        board [31].topWall = "full";
        board [32].topWall = "full";

        board [44].topWall = "full";
        board [45].topWall = "closed";
        board [46].topWall = "closed";
        board [47].topWall = "full";
        board [48].topWall = "full";

        board [51].topWall = "full";
        board [52].topWall = "full";
        board [53].topWall = "closed";
        board [54].topWall = "full";
        board [55].topWall = "full";
        board [56].topWall = "closed";

        board [71].topWall = "full";
        board [72].topWall = "full";
        board [73].topWall = "closed";
        board [74].topWall = "full";
        board [75].topWall = "full";
        board [76].topWall = "full";
        board [77].topWall = "full";
        board [78].topWall = "full";
    }

    else return false
}

function isNeighbor (x, y, wallX, wallY, isLeft, wantedState) // TODO: define function and add reactions to walls and doors
{
    var wall = index (wallX, wallY);

    if (board [index (x, y)].state === wantedState)
    {
        if (isLeft && board [wall].leftWall != "full" && board [wall].leftWall != "closed" && board [wall].leftWall != "damaged") return true;
        if (! isLeft && board [wall].topWall != "full" && board [wall].topWall != "closed" && board [wall].topWall != "damaged") return true;
    }

    return false;
}

function damageWall (wallX, wallY, isLeft)
{
    var wall = index (wallX, wallY);

    if (isLeft)
    {
        if (board [wall].leftWall === "full") board [wall].leftWall = "damaged";

        else if (board [wall].leftWall === "damaged" || board [wall].leftWall === "closed")
        {
            board [wall].leftWall = "destroyed";
            game.damaged++;
        }

        else showErrorMessage ("Unidentified behavior.");
    }

    else
    {
        if (board [wall].topWall === "full") board [wall].topWall = "damaged";

        else if (board [wall].topWall === "damaged" || board [wall].topWall === "closed")
        {
            board [wall].topWall = "destroyed";
            game.damaged++;
        }

        else showErrorMessage ("Unidentified damaging behavior.");
    }
}

function createFire (fireX, fireY)
{
    var fire = index (fireX, fireY);

    if (board [fire].state === "questionMark" || board [fire].state === "fakeAlert" || board [fire].state === "realAlert") addAlert ()

    board [fire].state = "fire";
}

function createExplosion (fireX, fireY)
{
    var counter;

    counter = 0;
    while (true)
    {
        if (fireX > counter)
        {
            var leftWall = board [index (fireX - counter, fireY)].leftWall;

            if (leftWall === "full" || leftWall === "closed" || leftWall === "damaged")
            {
                damageWall (fireX - counter, fireY, true);
                break;
            }

            if (board [index (fireX - (counter + 1), fireY)].state != "fire")
            {
                createFire (fireX - (counter + 1), fireY);
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
            var rightWall = board [index (fireX + (counter + 1), fireY)].leftWall;

            if (rightWall === "full" || rightWall === "closed" || rightWall === "damaged")
            {
                damageWall (fireX + (counter + 1), fireY, true);
                break;
            }

            if (board [index (fireX + (counter + 1), fireY)].state != "fire")
            {
                createFire (fireX + (counter + 1), fireY);
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
            var topWall = board [index (fireX, fireY - counter)].topWall;

            if (topWall === "full" || topWall === "closed" || topWall === "damaged")
            {
                damageWall (fireX, fireY - counter, false);
                break;
            }

            if (board [index (fireX, fireY - (counter + 1))].state != "fire")
            {
                createFire (fireX, fireY - (counter + 1));
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
            var bottomWall = board [index (fireX, fireY + (counter + 1))].topWall;

            if (bottomWall === "full" || bottomWall === "closed" || bottomWall === "damaged")
            {
                damageWall (fireX, fireY + (counter + 1), false);
                break;
            }

            if (board [index (fireX, fireY + (counter + 1))].state != "fire")
            {
                createFire (fireX, fireY + (counter + 1));
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

    if ((smokeX > 0 && isNeighbor (smokeX - 1, smokeY, smokeX, smokeY, true, "fire")) ||
        (smokeX < (maxColumn - 1) && isNeighbor (smokeX + 1, smokeY, smokeX + 1, smokeY, true, "fire")) ||
        (smokeY > 0 && isNeighbor (smokeX, smokeY - 1, smokeX, smokeY, false, "fire")) ||
        (smokeY < (maxRow - 1) && isNeighbor (smokeX, smokeY + 1, smokeX, smokeY + 1, false, "fire")))
        board [index (smokeX, smokeY)].state = "fire";
}

function checkFireAround (fireX, fireY)
{
    if ((fireX > 0 && isNeighbor (fireX - 1, fireY, fireX, fireY, true, "fire")) ||
        (fireX < (maxColumn - 1) && isNeighbor (fireX + 1, fireY, fireX + 1, fireY, true, "fire")) ||
        (fireY > 0 && isNeighbor (fireX, fireY - 1, fireX, fireY, false, "fire")) ||
        (fireY < (maxRow - 1) && isNeighbor (fireX, fireY + 1, fireX, fireY + 1, false, "fire")))
    {
        board [index (fireX, fireY)].state = "fire";
        checkAfterEffects ();
    }
}

function checkAfterEffects () // TODO: add reactions to players
{
    for (var column = 0; column < maxColumn; column++)
    {
        for (var row = 0; row < maxRow; row++)
        {
            if (board [index (column, row)].state === "smoke") checkFireAround (column, row);

            if (board [index (column, row)].alert && board [index (column, row)].state === "fire")
            {
                board [index (column, row)].alert = false;
                game.dead++;
            }
        }
    }

    if (game.dead >= 4 || game.damaged >= 24) game.gameOver ();
}

function addSmoke ()
{
    var smokeX = Math.floor ((Math.random () * (maxColumn - 2)) + 1);
    var smokeY = Math.floor ((Math.random () * (maxRow - 2)) + 1);
    var smoke = index (smokeX, smokeY);

    if (board [smoke].state === "nothing") checkSmokeAround (smokeX, smokeY);

    else if (board [smoke].state === "smoke") board [smoke].state = "fire";

    else if (board [smoke].state === "fire") createExplosion (smokeX, smokeY);

    else if (board [smoke].state === "questionMark") addSmoke (); // TODO: find out about reaction to alerts

    else showErrorMessage ("Unidentified smoking behavior."); // TODO: add reaction to players
}

function addFire () // USE THIS IN THE BEGINNING ONLY
{
    var fireX = Math.floor ((Math.random () * (maxColumn - 2)) + 1);
    var fireY = Math.floor ((Math.random () * (maxRow - 2)) + 1);
    var fire = index (fireX, fireY);

    if (board [fire].state != "nothing") addFire ();

    else board [fire].state = "fire";
}

function addAlert ()
{
    var real = Math.floor ((Math.random () * 2));

    var alertX = Math.floor ((Math.random () * (maxColumn - 2)) + 1);
    var alertY = Math.floor ((Math.random () * (maxRow - 2)) + 1);
    var alert = index (alertX, alertY);

    if (board [alert].state === "questionMark") addAlert ();

    else
    {
        board [alert].state = "questionMark";
        if (real == 1) board [alert].alert = true;
    }
}

//--------------------------------------------------------------------------------
// End of file gameboard.js
//--------------------------------------------------------------------------------
