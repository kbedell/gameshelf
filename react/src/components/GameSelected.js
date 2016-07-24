import React, {Component} from 'react';

class GameSelected extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    if($.isEmptyObject(this.props.game)) {
        return(
          <div>
          </div>
        )
    } else {
      return (
        <div>
          <div className='game-name centered-text'>
            <h3>{this.props.game.name}</h3>
          </div>
          <div className='game-minplayers centered-text'>
            <h3>{this.props.game.min_players} - {this.props.game.max_players}</h3>
          </div>
        </div>
      )
    }
  }
}

export default GameSelected;
