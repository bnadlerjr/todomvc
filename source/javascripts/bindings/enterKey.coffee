ko.bindingHandlers.enterKey = {
    init: (element, value, bindings, data, context) ->
        newValue= ->
            {
                keyup: (data, event) ->
                    if 13 == event.keyCode
                        value().call(@, data, event)
            }

        ko.bindingHandlers.event.init(element, newValue, bindings, data, context)
}
