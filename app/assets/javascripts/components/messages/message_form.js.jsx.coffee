@MessageForm = React.createClass
  handleSubmit: (e)->
    e.preventDefault()
    text = React.findDOMNode(@refs.text).value.trim()
    return unless text
    @props.onSubmit {text: text}
    React.findDOMNode(this.refs.text).value = ''

  render: ->
    `<form onSubmit={this.handleSubmit}>
      <textarea ref='text' name='text' placeholder='Текст сообщения'/>
      <br/>
      <input type='submit'/>
    </form>`