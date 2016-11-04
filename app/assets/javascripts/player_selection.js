$(document).ready(function () {
  $('.selectable-players').on('click', function(event) {
    var selectedPlayer = $(event.target);
    var selectedPlayerId = selectedPlayer.parent('li').data('player-id');

    var slot = findEmptySlot();

    slot.attr('src', selectedPlayer.attr('src'));
    slot.attr('data-selected-player-id', selectedPlayerId);
    slot.removeClass('nonvisible');

    refreshLists();
  });

  $('.slots').on('click', function(event) {
    var slot = $(event.target);
    slot.attr('src', "");
    slot.attr('data-selected-player-id', "");
    slot.addClass('nonvisible');

    refreshLists();
  });
});

function findEmptySlot() {
  return $('.slots[data-selected-player-id=""]:first');
}

function findUsedSlots() {
  return $('.slots[data-selected-player-id!=""]').map(function() {
    return $(this).data('selected-player-id');
  });
}

function updateFormFields(selectedPlayers) {
  $("input#player_ids").val(selectedPlayers);

  if(selectedPlayers.length == 4) {
    $(".kick-off-button").removeClass('nonvisible');
  } else {
    $(".kick-off-button").addClass('nonvisible');
  }
}

function refreshLists() {
  var selectedPlayers = findUsedSlots().toArray();

  $('.selectable-players').each(function() {
    var parentLi = $(this).parent('li');
    parentLi.removeClass('hidden');

    if ($.inArray(parentLi.data('player-id'), selectedPlayers) >= "0") {
      parentLi.addClass('hidden');
    }
  });

  updateFormFields(selectedPlayers);
}
