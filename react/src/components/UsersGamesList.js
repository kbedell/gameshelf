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
        thumbnail={game.thumbnail}
        handleButtonClick={onButtonClick}
      />
    );
  });

  return (
    <div>
      <div className='games row small-up-1 medium-up-2 large-up-4'>
        {games}
      </div>
    </div>
  );
};

export default UsersGameList;
