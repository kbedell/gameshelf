import React, {Component} from 'react';

class GameSelected extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    debugger;
    if(this.props.game === {}){
      return(
        <div>
        </div>
      )
    } else {
      return (
        <div>
          <div className='game-name'>
            {this.props.game.name}
          </div>
          <div className='game-minplayers'>
            {this.props.game.min_players} - {this.props.game.max_players}
          </div>
        </div>
      )
    }
  }
}

export default GameSelected;
