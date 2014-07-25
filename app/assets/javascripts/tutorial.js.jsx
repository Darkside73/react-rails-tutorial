/** @jsx React.DOM */

var CommentList = React.createClass({
  render: function() {
    return (
      <div className="commentList">
        I am a comment list
      </div>
    );
  }
});

var CommentForm = React.createClass({
  render: function() {
    return (
      <div className="commentForm">
        I am a comment form
      </div>
    );
  }
});

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
);
