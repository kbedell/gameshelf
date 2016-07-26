import React from 'react';

const Game = props => {
  return (
    <label>
      <input type="radio" className="game" id={props.id} value={props.id} checked={props.checked} onChange={props.handleRadioChange} />
      {props.name} ({props.year})
   </label>
  )
};

export default Game;
