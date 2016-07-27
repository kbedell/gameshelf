import React from 'react';
import Game from './Game';

const GameList = props => {
  var checked = false;
  let games = props.data.map(game => {
    if(game.id === props.selectedGame) {
      var checked = true;
    }

    return (
      <Game
        key={game.id}
        name={game.name}
        id={game.id}
        year={game.year}
        handleRadioChange={props.handleRadioChange}
        checked={checked}
      />
    );
  });

  let submitButton = () => {
    if(props.data.length > 0){
      return ( <input type='submit' className='button' value='Add Game to my Library' /> );
    }
  }

  return (
  <div>
    <form onSubmit={props.handleAddGameClick}>
    <fieldset className='btn-group-vertical'>
      {games}
    </fieldset>
      {submitButton()}
    </form>
  </div>
  );
};

export default GameList;
