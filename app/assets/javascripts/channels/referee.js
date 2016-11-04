this.App = {};

App.cable = ActionCable.createConsumer();

App.referee = App.cable.subscriptions.create("RefereeChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    this.updateScores(data.scores);
  },

  updateScore: function(arguments) {
    var splitArguments = arguments.split('/');
    this.perform('update_score', {team_color: splitArguments[1], add_or_remove: splitArguments[2]});
  },

  updateScores: function(scores) {
    $('#team-blue-score').html(scores.team_blue);
    $('#team-red-score').html(scores.team_red);
  }

});

$(document).on('click', 'button[data-behavior^=update_score]', function() {
  App.referee.updateScore($(this).data("behavior"));
  return false;
});
