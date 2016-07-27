import React from 'react';

const Game = props => {
  var buttonClass = 'btn';
  var radioSymbol = 'fa fa-circle-thin fg-lg'

  if(props.checked === true) {
    buttonClass = 'btn active'
    radioSymbol = 'fa fa-circle fg-lg'
  };

  return (
  <label className={buttonClass}>
    <input type='radio' className='radio-game' id={props.id} value={props.id} checked={props.checked} onChange={props.handleRadioChange} /><i className={radioSymbol}></i>  {props.name} ({props.year})
   </label>
  )
};

export default Game;
