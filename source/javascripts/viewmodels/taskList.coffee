window.App ?= {}
window.App.ViewModels ?= {}

class App.ViewModels.TaskList
    constructor: ->
        @items = ko.observableArray()
        @newTaskInput = ko.observable()

    addItem: ->
        @items.push(new App.Models.Task({title: @newTaskInput()}))
        @newTaskInput("")
