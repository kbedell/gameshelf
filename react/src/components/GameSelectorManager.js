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
    if(this.state.players.match(regex)) {
      $( '.flash' ).remove();
      $('.alert').append ("<div class='flash'>Please enter the number of players or leave the field blank to not specify player number</div>");
    } else {
      $.ajax({
        method: "GET",
        url: "/api/v1/usersgames/random",
        contentType: 'application/json',
        data: {'players': {'players': this.state.players}}
      })
      .done((data) => {
        $( '.flash' ).remove();
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
