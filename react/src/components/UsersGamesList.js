import React from 'react';
import UsersGame from './UsersGame';

const UsersGameList = props => {
  let games = props.games.map(game => {
    let onButtonClick = () => props.handleButtonClick(game.id);
    return (
      <UsersGame
        key={game.id}
        id={game.id}
        name={game.name}
        year={game.year}
        handleButtonClick={onButtonClick}
      />
    );
  });

  return (
    <div>
      <ul className='games'>
        {games}
      </ul>
    </div>
  );
};

export default UsersGameList;
