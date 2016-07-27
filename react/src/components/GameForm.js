import React from 'react';

const GameForm = props => {
  return (
    <form onSubmit={props.handleSearchClick}>
      <input className='game-name'
        id = 'game-name'
        placeholder='Game Name'
        type='text'
        value={props.name}
        onChange={props.handleChange}
      />
      <input type='submit' className='button' value='Search for Game' />
    </form>
  )
}

export default GameForm;
