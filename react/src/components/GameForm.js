import React from 'react';

const GameForm = props => {
  return (
    <form onSubmit={props.handleSearchClick}>
      <input className="GameName"
        placeholder="Game Name"
        type="text"
        value={props.name}
        onChange={props.handleChange}
      />
      <input type="submit" value="Search for Game" />
    </form>
  )
}

export default GameForm;
