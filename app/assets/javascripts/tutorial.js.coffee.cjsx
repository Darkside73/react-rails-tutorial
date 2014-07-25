
converter = new Showdown.converter()

Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>

CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      <Comment author={comment.author}>{comment.text}</Comment>
    <div className="commentList">
      {commentNodes}
    </div>

CommentForm = React.createClass
  handleSubmit: ->
    author = @refs.author.getDOMNode().value.trim()
    text = @refs.text.getDOMNode().value.trim()
    @props.onCommentSubmit author: author, text: text
    @refs.author.getDOMNode().value = ''
    @refs.text.getDOMNode().value = ''
    false

  render: ->
    <form className="commentForm" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Your name" ref="author" />
      <input type="text" placeholder="Say something..." ref="text" />
      <input type="submit" value="Post" />
    </form>

CommentBox = React.createClass
  loadFromServer: ->
    $.get(
      @props.url
      (data) =>
        @setState data: data
      'json'
    )
  getInitialState: ->
    data: []
  componentDidMount: ->
    @loadFromServer()
  handleCommentSubmit: (comment) ->
    $.post(
      @props.url
      comment
      (data) => @setState data: data
    )
  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={@state.data} />
      <CommentForm onCommentSubmit={@handleCommentSubmit} />
    </div>

React.renderComponent(
  <CommentBox url="/comments.json" />
  $('#content').get(0)
)
