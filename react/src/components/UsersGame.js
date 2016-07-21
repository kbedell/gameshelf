import React from 'react';

const UsersGame = props => {
  return (
    <li id={props.id}>
      <i className='fa fa-times delete-button' aria-hidden='true' id='delete-button' onClick={props.handleButtonClick}></i>  {props.name} ({props.year})
    </li>
  );
};

export default UsersGame;
