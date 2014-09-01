window.App ?= {}
window.App.ViewModels ?= {}

class App.ViewModels.TaskList
    constructor: ->
        @items = ko.observableArray()
        @newTaskInput = ko.observable()

    addItem: ->
        if "" != @newTaskInput()
            @items.push(new App.Models.Task({title: @newTaskInput().trim()}))
            @newTaskInput("")

    removeItem: (item) =>
        @items.remove(item)

    editItem: (item) =>
        item.editing(true)
        item.previousTitle = item.title()

    cancelEditingItem: (item) =>
        item.editing(false)
        item.title(item.previousTitle)

    saveEditedItem: (item) =>
        item.editing(false)

    isVisible: ->
        @items().length > 0

    numberIncomplete: ->
        @items().filter((item) -> !item.completed()).length

    itemCountText: =>
        if 1 == @items().length then "item" else "items"
