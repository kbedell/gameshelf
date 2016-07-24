import React from 'react';

const UsersGame = props => {
  return (
    <div className='users-game column' id={props.id}>
      <img src={props.thumbnail} className='thumbnail' alt='game-image' />
       <div className='game-info'><i className='fa fa-times delete-button' aria-hidden='true' id='delete-button' onClick={props.handleButtonClick}></i>  {props.name} ({props.year})</div>
    </div>
  );
};

export default UsersGame;
