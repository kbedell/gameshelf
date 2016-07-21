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

  handleButtonClick(id) {
    $.ajax({
      method: "GET",
      url: "/api/v1/usersgames/random",
      contentType: 'application/json',
      data: {'players': {'players': this.state.players}}
    })
    .done((data) => {
      this.setState({ game: data.game })
    });
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
