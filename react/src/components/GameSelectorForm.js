import React from 'react';

const GameSelectorForm = props => {
  return (
    <form onSubmit={props.handleSearchClick}>
      <input className='players'
        id = 'players'
        type='text'
        value={props.players}
        onChange={props.handleChange}
      />
      <input type='submit' className='button' value='Choose a Game for Me' onClick={props.handleButtonClick}/>
    </form>
  )
}

export default GameSelectorForm;
