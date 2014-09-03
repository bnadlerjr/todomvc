window.App ?= {}
window.App.ViewModels ?= {}

class App.ViewModels.TaskList
    constructor: ->
        @items = ko.observableArray()
        @newTaskInput = ko.observable()
        @filterBy = ko.observable("all")

        @filteredItems = ko.computed =>
            fb = @filterBy()
            throw "Unsupported filter (#{fb})." unless fb of filters
            @items().filter(filters[fb])

        ko.computed =>
            sanitizeItem = (item) ->
                delete item.editing
                item

            items = ko.utils.arrayMap(ko.toJS(@items), sanitizeItem)
            localStorage["todomvc"] = ko.toJSON(items)

    addItem: =>
        if "" != @newTaskInput()
            @items.push(new App.Models.Task({title: @newTaskInput().trim()}))
            @newTaskInput("")

    removeItem: (item) =>
        @items.remove(item)

    removeCompleted: =>
        @items.remove(filters["completed"])

    editItem: (item) =>
        item.editing(true)
        item.previousTitle = item.title()

    cancelEditingItem: (item) =>
        item.editing(false)
        item.title(item.previousTitle)

    saveEditedItem: (item) =>
        item.editing(false)
        trimmedTitle = item.title().trim()
        if trimmedTitle
            item.title(trimmedTitle)
        else
            @items.remove(item)

    isVisible: ->
        @items().length > 0

    numberCompleted: ->
        @items().filter(filters["completed"]).length

    numberIncomplete: ->
        @items().filter(filters["active"]).length

    itemCountText: =>
        if 1 == @items().length then "item" else "items"

    filters = {
        "active": (item) -> !item.completed(),
        "all": (item) -> item,
        "completed": (item) -> item.completed()
    }
