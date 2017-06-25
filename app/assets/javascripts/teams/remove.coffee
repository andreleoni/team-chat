$(document).on 'turbolinks:load', ->
  $('body').on 'click', 'a.remove_team_user', (e) ->
    $('#remove_team_modal').modal('open')
    $('.remove_team_form').attr('action', '/team_users/' + e.target.id + '/disable')
    $('#remove_user_team_id').val(e.target.id)

    return false

  $('.remove_team_form').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        contentType:'application/json',
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          console.log("aqui")
          $('.team_user_id_' + $('#remove_user_team_id').val()).remove()
          Materialize.toast('Success in delete Channel &nbsp;<b>:(</b>', 4000, 'green')
          $('#remove_team_modal').modal('close')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem to delete Channel &nbsp;<b>:(</b>', 4000, 'red')

    $('#remove_team_modal').modal('close')
    return false
