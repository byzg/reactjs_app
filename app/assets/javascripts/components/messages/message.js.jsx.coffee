@Message = React.createClass
  render: ->
    `<div>
      <span>{this.props.name}</span>:
      &nbsp;
      <span>{this.props.text}</span>
    </div>`