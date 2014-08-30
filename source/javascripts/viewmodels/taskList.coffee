window.App ?= {}
window.App.ViewModels ?= {}

class App.ViewModels.TaskList
    constructor: ->
        @items = ko.observableArray()

    add_item: (title) ->
        @items.push(new App.Models.Task({title: title}))
