import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import GameManager from './components/GameManager'
import UsersGamesManager from './components/UsersGamesManager'

$(function() {
  if(document.getElementById('add-game')) {
  ReactDOM.render(
    <GameManager />,
    document.getElementById('add-game')
  )};
});
