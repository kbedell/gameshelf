import React from 'react';
import Game from './Game';

const GameList = props => {
  let games = props.data.map(game => {
    return (
      <Game
        key={game.id}
        name={game.name}
        id={game.id}
        year={game.year}
        handleRadioChange={props.handleRadioChange}
      />
    );
  });

  let submitButton = () => {
    if(props.data.length > 0){
      return ( <input type="submit" value="Add Game to my Library" /> )
    }
  };

  return (
  <div>
    <form onSubmit={props.handleAddGameClick}>
      {games}
      {submitButton()}
    </form>
  </div>
  );
};

export default GameList;
