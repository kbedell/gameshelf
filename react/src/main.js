import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import GameManager from './components/GameManager'
import GameSelectorManager from './components/GameSelectorManager'

$(function() {
  if(document.getElementById('add-game')) {
  ReactDOM.render(
    <GameManager />,
    document.getElementById('add-game')
  )};
});

$(function() {
  if(document.getElementById('game-selector')) {
  ReactDOM.render(
    <GameSelectorManager />,
    document.getElementById('game-selector')
  )};
});
