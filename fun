<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unblocked Games</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        header {
            background-color: #333;
            color: white;
            width: 100%;
            text-align: center;
            padding: 1em 0;
        }
        .game-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .game-item {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            width: 200px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .game-item img {
            width: 100%;
            height: auto;
        }
        .game-item a {
            display: block;
            text-align: center;
            padding: 10px;
            text-decoration: none;
            color: #333;
        }
        .game-item a:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Unblocked Games</h1>
    </header>
    <div class="game-list" id="game-list"></div>

    <script>
        async function fetchGames() {
            const response = await fetch('https://raw.githubusercontent.com/swarmintelli/Unblocked-Games-CDN/main/games.json');
            const games = await response.json();
            return games;
        }

        function createGameItem(game) {
            const gameItem = document.createElement('div');
            gameItem.className = 'game-item';
            gameItem.innerHTML = `
                <img src="${game.game_image_icon}" alt="${game.name}">
                <a href="${game.iframe}" target="_blank">${game.name}</a>
            `;
            return gameItem;
        }

        async function displayGames() {
            const games = await fetchGames();
            const gameList = document.getElementById('game-list');
            games.forEach(game => {
                const gameItem = createGameItem(game);
                gameList.appendChild(gameItem);
            });
        }

        displayGames();
    </script>
</body>
</html>
