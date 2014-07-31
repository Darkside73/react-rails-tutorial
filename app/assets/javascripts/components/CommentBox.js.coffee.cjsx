@CommentBox = React.createClass
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
    comments = @state.data
    newComments = comments.concat [comment]
    @setState data: newComments
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
