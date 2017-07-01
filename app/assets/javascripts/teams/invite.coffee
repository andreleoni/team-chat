$(document).on 'turbolinks:load', ->
  $('body').on 'click', 'a.invite_user', (e) ->
    $('#invite_team_modal').modal('open')
    $('#invite_team').attr('action', '/teams/' + e.target.id + '/invite')
    $('#invite_team_id').val(e.target.id)

    return false

  $('#invite_team').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        contentType:'application/json',
        dataType: 'json',
        data: { }
        success: (data, text, jqXHR) ->          
          Materialize.toast('Convite enviado &nbsp;<b>:(</b>', 4000, 'green')
          $('#invite_team_modal').modal('close')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema ao enviar o convite &nbsp;<b>:(</b>', 4000, 'red')

    $('#invite_team_modal').modal('close')
    return false
