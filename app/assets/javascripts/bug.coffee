# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".product_selector").change (e) ->
    e.preventDefault()
    $.get(
          url: '/productformobject',
          data:
            subobject: 'component',
            id: this.value,
         ).done (data) ->
            $('#componentSelect').html(data)
    $.get(
          url: '/productformobject',
          data:
            subobject: 'milestone',
            id: this.value,
         ).done (data) ->
            $('#milestoneSelect').html(data)
    $.get(
          url: '/productformobject',
          data:
            subobject: 'version',
            id: this.value,
         ).done (data) ->
            $('#versionFoundSelect').html(data)
    $.get(
          url: '/productformobject',
          data:
            subobject: 'version',
            id: this.value,
         ).done (data) ->
            $('#versionIntegratedSelect').html(data)
    return
