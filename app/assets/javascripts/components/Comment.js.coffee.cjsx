converter = new Showdown.converter()

@Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>
