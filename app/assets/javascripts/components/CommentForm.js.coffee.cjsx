Input = ReactBootstrap.Input
Button = ReactBootstrap.Button

@CommentForm = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    author = @refs.author.getInputDOMNode().value.trim()
    text = @refs.text.getInputDOMNode().value.trim()
    @props.onCommentSubmit author: author, text: text
    @refs.author.getInputDOMNode().value = ''
    @refs.text.getInputDOMNode().value = ''

  render: ->
    <form onSubmit={@handleSubmit}>
      <hr />
      <h2>Write a new one</h2>
      <Input type="text" label="Your name" ref="author" />
      <Input type="textarea" label="Say something..." ref="text" />
      <Button bsStyle="primary" type="submit">Post</Button>
    </form>
