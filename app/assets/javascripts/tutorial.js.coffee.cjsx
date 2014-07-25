
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
  render: ->
    <div className="commentForm">
      I am a comment form
    </div>

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
  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={@state.data} />
      <CommentForm />
    </div>

React.renderComponent(
  <CommentBox url="/comments.json" />
  $('#content').get(0)
)
