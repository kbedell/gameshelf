import React from 'react';

const Game = props => {
  return (
    <div>
    <input type="radio" name="Game" value={props.id} onChange={props.handleRadioChange} />
    <span>
      {props.name} ({props.year})
    </span>
    </div>
  )
};

export default Game;
