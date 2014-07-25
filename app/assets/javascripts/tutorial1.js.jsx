/** @jsx React.DOM */

var commentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        I am a comment box
      </div>
    );
  }
});

React.renderComponent(
  <commentBox />,
  $('#content').get(0)
)
