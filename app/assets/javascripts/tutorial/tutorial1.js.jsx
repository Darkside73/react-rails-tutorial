/** @jsx React.DOM */

var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList />
        <CommentForm />
      </div>
    );
  }
});

React.renderComponent(
  <CommentBox />,
  $('#content').get(0)
)