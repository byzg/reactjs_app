@Chat = React.createClass
  getInitialState: -> { messages: [] }
  loadMessages: ->
    $.ajax
      url: this.props.url
      dataType: 'json'
      cache: false
      success: ((data)-> @setState {messages: data}).bind(@),
      error: ((xhr, status, err)-> console.error(this.props.url, status, err.toString())).bind(@)

  onMessageSubmit: (message)->
    messages = @state.messages;
    newMessages = messages.concat([message]);
    @setState {messages: newMessages}
    message.name = @props.currentName
    console.log message
    $.ajax
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: message,
      success: ((data)-> @setState({messages: data})).bind(@),
      error: ((xhr, status, err)-> console.error(this.props.url, status, err.toString())).bind(@)

  componentDidMount: ->
    @loadMessages();
    setInterval(@loadMessages, @props.pollInterval)

  render: ->
    `<div>
      <MessagesList messages={this.state.messages}/>
      <MessageForm onSubmit={this.onMessageSubmit}/>
    </div>`