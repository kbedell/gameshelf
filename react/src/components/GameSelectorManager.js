import React, {Component} from 'react';
import GameSelectorForm from './GameSelectorForm';
import GameSelected from './GameSelected';

class GameManager extends Component {
  constructor(props) {
    super(props);
    this.state = {
      players: '',
      game: {}
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
  }

  handleChange(event) {
    let newPlayers = event.target.value;
    this.setState({ players: newPlayers });
  }

  handleButtonClick(event) {
    event.preventDefault();
    let regex = /[a-zA-Z]/;
    $('.alert-box').remove();
    if(this.state.players.match(regex)) {
      $('.alert').append ("<div div data-alert class='alert-box alert'><div class='alert-text'>Please enter a number</div></div>");
    } else {
      $.ajax({
        method: 'GET',
        url: '/api/v1/usersgames/random',
        contentType: 'application/json',
        data: {'players': {'players': this.state.players}}
      })
      .done((data) => {
        $( '.alert' ).remove();
        this.setState({ game: data.game })
        this.setState({ players: '' })
      });
    }
  }

  render() {
    return (
      <div>
      <GameSelectorForm
        handleChange={this.handleChange}
        handleButtonClick={this.handleButtonClick}
        players={this.state.players}
      />
      <GameSelected
        game={this.state.game}
      />
      </div>
    )
  }
}

export default GameManager;
