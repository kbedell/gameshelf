import React, {Component} from 'react';
import GameForm from './GameForm';
import GameList from './GameList';
import UsersGamesList from './UsersGamesList';

class GameManager extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      selectedGame: '',
      data: [],
      games: []
    };

    this.handleSearchClick = this.handleSearchClick.bind(this);
    this.handleAddGameClick = this.handleAddGameClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleRadioChange = this.handleRadioChange.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
    this.loadGames = this.loadGames.bind(this);
  }

  loadGames() {
    $.ajax({
      url: '/api/v1/usersgames',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ games: data.games });
    });
  }

  componentDidMount() {
    this.loadGames();
  }

  handleChange(event) {
    let newName = event.target.value;
    this.setState({ name: newName });
  }

  handleRadioChange(event) {
    let game = event.target.value;
    this.setState({ selectedGame: game });
  }

  handleAddGameClick(event){
    event.preventDefault();
    if(this.state.selectedGame === ''){
      $('.alert-box').remove();
      $('.alert').append("<div data-alert class='alert-box alert'><div class='alert-text'>Please select a game</div></div>");
    } else {
      $.ajax({
        method: 'POST',
        contentType: 'application/json',
        url: '/api/v1/boardgamegeek/game',
        data: JSON.stringify({'game': { 'name': this.state.selectedGame }})
      })
      .done(data => {
        if(data.game.name === 'game already exists') {
          $('.alert-box').remove();
          $('.alert').append("<div data-alert class='alert-box alert'><div class='alert-text'>You already own this game</div></div>");
        } else {
          $('.alert-box').remove();
          $('.alert').append("<div data-alert class='alert-box success'><div class='alert-text'>Game added successfully</div></div>");
          this.setState( {data: []});
          this.loadGames();
        }
      });
    }
  }

  handleSearchClick(event){
    event.preventDefault();
    $('.alert-box').remove();
    if(this.state.name === ''){
      $('.alert').append("<div data-alert class='alert-box alert'><div class='alert-text'>Please enter something in the search field</div></div>");
    } else  {
      $.ajax({
        method: 'POST',
        contentType: 'application/json',
        url: '/api/v1/boardgamegeek/search',
        data: JSON.stringify({'games': { 'name': this.state.name }})
      })
      .done(data => {
        this.setState( {data: data.games} );
        $( '.alert-box' ).remove();
        if(this.state.games.length === 0) {
        $('.alert').append("<div data-alert class='alert-box alert'><div class='alert-text'>Sorry, no games found!</div></div>");
        }
      });
    }
  }

  handleButtonClick(id) {
    $.ajax({
      method: 'Delete',
      url: '/api/v1/usersgames/' + id
    })
    .done((data) => {
      $('.alert').append ("<div data-alert class='alert-box success'><div class='alert-text'>Game deleted!</div></div>");
      $( '#' + id ).remove();
    });
  }

  render() {
    return (
      <div>
      <GameForm
      handleSearchClick={this.handleSearchClick}
      handleChange={this.handleChange}
      name={this.state.name}
      />
      <GameList
        data={this.state.data}
        handleAddGameClick={this.handleAddGameClick}
        handleRadioChange={this.handleRadioChange}
        selectedGame={this.state.selectedGame}
      />
      <UsersGamesList
        games={this.state.games}
        handleButtonClick={this.handleButtonClick}
      />
      </div>
    )
  }
}

export default GameManager;
