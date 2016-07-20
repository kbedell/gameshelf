import React from 'react';

const Game = props => {
  return (
    <div>
    <input type="radio" name="Game" value={props.id} onChange={props.handleRadioChange} /> {props.name} ({props.year})
    </div>
  )
};

export default Game;
